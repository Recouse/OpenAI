//
//  RequestDetailView.swift
//  OpenAI Example
//
//  Created by Firdavs Khaydarov on 03/08/2025.
//

import SwiftUI

struct RequestDetailView: View {
    @State var model: RequestDetailModel
    @State private var showingInspector = false

    var body: some View {
        VStack(spacing: 0) {
            if let request = model.request {
                // Chat messages
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 12) {
                            ForEach(request.messages) { message in
                                MessageBubble(message: message)
                                    .id(message.id)
                            }
                        }
                        .padding()
                    }
                    .onChange(of: request.messages.count) { _, _ in
                        if let lastMessage = request.messages.last {
                            withAnimation {
                                proxy.scrollTo(lastMessage.id, anchor: .bottom)
                            }
                        }
                    }
                }
                
                Divider()
                
                // Input area
                VStack(spacing: 8) {
                    if !model.errorMessage.isEmpty {
                        Text(model.errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.horizontal)
                    }
                    
                    HStack(alignment: .bottom, spacing: 8) {
                        // Role picker for manual message addition
                        Menu {
                            ForEach(MessageRole.allCases, id: \.self) { role in
                                Button(role.displayName) {
                                    model.selectedRole = role
                                }
                            }
                        } label: {
                            Text(model.selectedRole.displayName)
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(8)
                        }
                        
                        // Message input
                        TextField("Type a message...", text: $model.newMessageContent, axis: .vertical)
                            .textFieldStyle(.roundedBorder)
                            .lineLimit(1...5)
                        
                        // Send buttons
                        MessageActionButtons(
                            isEmpty: model.newMessageContent.isEmpty,
                            isLoading: model.isLoading,
                            onSend: {
                                Task {
                                    await model.sendMessage()
                                }
                            },
                            onAdd: model.addMessage
                        )
                    }
                    
                    if model.isLoading {
                        HStack {
                            ProgressView()
                                .scaleEffect(0.8)
                            Text("Sending...")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding()
                .background(Color(.systemBackground))
            } else {
                ContentUnavailableView(
                    "Request Not Found",
                    systemImage: "exclamationmark.triangle",
                    description: Text("The selected request could not be found.")
                )
            }
        }
        .navigationTitle(model.request?.name ?? "Request")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Settings", systemImage: "gearshape") {
                    showingInspector = true
                }
                .disabled(model.request == nil)
            }
        }
        .sheet(isPresented: $showingInspector) {
            if let request = model.request {
                RequestInspectorView(
                    request: Binding(
                        get: { request },
                        set: { updatedRequest in
                            model.request = updatedRequest
                            model.requestsModel.updateRequest(updatedRequest)
                        }
                    )
                )
            }
        }
    }
}

struct MessageBubble: View {
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.role == .user {
                Spacer()
            }
            
            VStack(alignment: message.role == .user ? .trailing : .leading, spacing: 4) {
                HStack {
                    Text(message.role.displayName)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    
                    if message.role != .user {
                        Spacer()
                    }
                    
                    Text(message.timestamp, style: .time)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                
                Text(message.content)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(message.role == .user ? Color.blue : Color(.systemGray5))
                    )
                    .foregroundColor(message.role == .user ? .white : .primary)
            }
            .frame(maxWidth: .infinity * 0.8, alignment: message.role == .user ? .trailing : .leading)
            
            if message.role != .user {
                Spacer()
            }
        }
    }
}

struct MessageActionButtons: View {
    let isEmpty: Bool
    let isLoading: Bool
    let onSend: () -> Void
    let onAdd: () -> Void
    
    var body: some View {
        VStack(spacing: 4) {
            Button(action: onSend) {
                Image(systemName: "paperplane.fill")
            }
            .disabled(isEmpty || isLoading)
            
            Button(action: onAdd) {
                Image(systemName: "plus")
            }
            .disabled(isEmpty)
        }
        .buttonStyle(.borderedProminent)
    }
}
