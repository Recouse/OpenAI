//
//  RequestDetailModel.swift
//  OpenAI Example
//
//  Created by Firdavs Khaydarov on 03/08/2025.
//

import Observation
import Foundation
import OpenAI

@MainActor @Observable
final class RequestDetailModel {
    let requestId: Request.ID
    var request: Request?
    var isLoading = false
    var errorMessage = ""
    var newMessageContent = ""
    var selectedRole: MessageRole = .user
    var streamingMessageId: UUID?
    var streamingContent = ""
    
    let requestsModel: RequestsModel
    private var openAI: OpenAI? {
        guard let apiKey = Config.openAIAPIKey, Config.isConfigured else { return nil }
        return OpenAI(apiKey: apiKey)
    }

    init(requestId: Request.ID, requestsModel: RequestsModel) {
        self.requestId = requestId
        self.requestsModel = requestsModel
        loadRequest()
    }
    
    private func loadRequest() {
        request = requestsModel.requests.first { $0.id == requestId }
    }
    
    func addMessage() {
        guard !newMessageContent.isEmpty, var currentRequest = request else { return }
        
        let message = ChatMessage(role: selectedRole, content: newMessageContent)
        currentRequest.addMessage(message)
        request = currentRequest
        requestsModel.updateRequest(currentRequest)
        
        newMessageContent = ""
        selectedRole = .user
    }
    
    func sendMessage() async {
        guard let currentRequest = request,
              !newMessageContent.isEmpty else { return }
        
        guard let openAI = openAI else {
            errorMessage = "API key not configured. Please set OPENAI_API_KEY in Config.xcconfig"
            return
        }
        
        let userMessage = ChatMessage(role: .user, content: newMessageContent)
        var updatedRequest = currentRequest
        updatedRequest.addMessage(userMessage)
        request = updatedRequest
        requestsModel.updateRequest(updatedRequest)
        
        newMessageContent = ""
        isLoading = true
        errorMessage = ""
        streamingContent = ""
        
        let assistantMessage = ChatMessage(role: .assistant, content: "")
        streamingMessageId = assistantMessage.id
        updatedRequest.addMessage(assistantMessage)
        request = updatedRequest
        requestsModel.updateRequest(updatedRequest)
        
        do {
            try await streamAPIRequest(request: updatedRequest, openAI: openAI)
        } catch {
            errorMessage = "Error: \(error.localizedDescription)"
        }
        
        streamingMessageId = nil
        streamingContent = ""
        isLoading = false
    }
    
    private func streamAPIRequest(request: Request, openAI: OpenAI) async throws {
        switch request.apiType {
        case .chatCompletions:
            try await streamChatCompletionsRequest(request: request, openAI: openAI)
        case .responses:
            try await streamResponsesRequest(request: request, openAI: openAI)
        }
    }
    
    private func sendAPIRequest(request: Request, openAI: OpenAI) async throws -> String {
        switch request.apiType {
        case .chatCompletions:
            return try await sendChatCompletionsRequest(request: request, openAI: openAI)
        case .responses:
            return try await sendResponsesRequest(request: request, openAI: openAI)
        }
    }
    
    private func sendChatCompletionsRequest(request: Request, openAI: OpenAI) async throws -> String {
        let messages = buildChatMessages(from: request)
        
        let completion = try await openAI.chat.completions(
            model: .init(request.model),
            messages: messages,
            temperature: request.temperature
        )
        
        return completion.choices.first?.message?.content ?? "No response"
    }
    
    private func sendResponsesRequest(request: Request, openAI: OpenAI) async throws -> String {
        let input = buildResponsesInput(from: request)
        
        let response = try await openAI.responses.create(
            input: .input(input),
            model: .init(request.model),
            temperature: request.temperature
        )
        
        return response.output.first?.content.first?.text ?? "No response"
    }
    
    private func streamChatCompletionsRequest(request: Request, openAI: OpenAI) async throws {
        let messages = buildChatMessages(from: request, excludeLast: true)
        
        let stream = openAI.chat.completionsStream(
            model: .init(request.model),
            messages: messages,
            temperature: request.temperature
        )
        
        for try await chunk in stream {
            if let content = chunk.choices.first?.delta.content {
                streamingContent += content
                updateStreamingMessage(with: streamingContent)
            }
        }
        
        finalizeStreamingMessage()
    }
    
    private func streamResponsesRequest(request: Request, openAI: OpenAI) async throws {
        let input = buildResponsesInput(from: request, excludeLast: true)
        
        let stream = openAI.responses.createStream(
            input: .input(input),
            model: .init(request.model),
            temperature: request.temperature
        )
        
        for try await response in stream {
            guard response.type == .outputTextDelta else { continue }
            if let content = response.delta {
                streamingContent += content
                updateStreamingMessage(with: streamingContent)
            }
        }
        
        finalizeStreamingMessage()
    }

    private func updateStreamingMessage(with content: String) {
        guard let streamingId = streamingMessageId else { return }
        updateMessageContent(messageId: streamingId, content: content)
    }
    
    private func finalizeStreamingMessage() {
        guard let streamingId = streamingMessageId else { return }
        updateMessageContent(messageId: streamingId, content: streamingContent)
    }
    
    private func updateMessageContent(messageId: UUID, content: String) {
        guard var currentRequest = request else { return }
        
        if let index = currentRequest.messages.firstIndex(where: { $0.id == messageId }) {
            currentRequest.messages[index].content = content
            request = currentRequest
            requestsModel.updateRequest(currentRequest)
        }
    }
    
    private func buildChatMessages(from request: Request, excludeLast: Bool = false) -> [ChatCompletions.Body.Message] {
        var messages: [ChatCompletions.Body.Message] = []
        
        if !request.systemPrompt.isEmpty {
            messages.append(.system(request.systemPrompt))
        }
        
        let messagesToProcess = excludeLast ? request.messages.dropLast() : request.messages
        for message in messagesToProcess {
            switch message.role {
            case .user:
                messages.append(.user(message.content))
            case .assistant:
                messages.append(.assistant(message.content))
            case .system:
                messages.append(.system(message.content))
            }
        }
        
        return messages
    }
    
    private func buildResponsesInput(from request: Request, excludeLast: Bool = false) -> [Responses.Body.InputObject] {
        var input: [Responses.Body.InputObject] = []

        if !request.systemPrompt.isEmpty {
            input.append(
                Responses.Body.InputObject(role: .system, content: .text(request.systemPrompt))
            )
        }
        
        let messagesToProcess = excludeLast ? request.messages.dropLast() : request.messages
        for message in messagesToProcess {
            let role: Role = switch message.role {
            case .user: .user
            case .assistant: .assistant
            case .system: .system
            }
            input.append(
                Responses.Body.InputObject(role: role, content: .text(message.content))
            )
        }
        
        return input
    }
}
