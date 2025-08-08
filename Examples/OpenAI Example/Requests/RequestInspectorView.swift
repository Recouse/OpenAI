//
//  RequestInspectorView.swift
//  OpenAI Example
//
//  Created by Firdavs Khaydarov on 05/08/2025.
//

import SwiftUI

struct RequestInspectorView: View {
    @Binding var request: Request
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String
    @State private var systemPrompt: String
    @State private var model: String
    @State private var temperature: Double

    init(request: Binding<Request>) {
        self._request = request
        self._name = State(initialValue: request.wrappedValue.name)
        self._systemPrompt = State(initialValue: request.wrappedValue.systemPrompt)
        self._model = State(initialValue: request.wrappedValue.model)
        self._temperature = State(initialValue: request.wrappedValue.temperature)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Request Details") {
                    TextField("Name", text: $name)
                    
                    HStack {
                        Text("API Type")
                        Spacer()
                        Text(request.apiType.displayName)
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("System Prompt") {
                    TextField("System prompt...", text: $systemPrompt, axis: .vertical)
                        .lineLimit(3...8)
                }
                
                Section("Model Configuration") {
                    Picker("Model", selection: $model) {
                        Group {
                            Text("GPT-4o").tag("gpt-4o")
                            Text("GPT-4o Mini").tag("gpt-4o-mini")
                            Text("GPT-4").tag("gpt-4")
                            Text("GPT-4 Turbo").tag("gpt-4-turbo")
                            Text("GPT-3.5 Turbo").tag("gpt-3.5-turbo")
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Temperature")
                            Spacer()
                            Text("\(temperature, specifier: "%.2f")")
                                .foregroundColor(.secondary)
                        }
                        Slider(value: $temperature, in: 0...2, step: 0.1)
                    }
                }
                
                Section("Request Info") {
                    LabeledContent("Created", value: request.createdAt, format: .dateTime)
                    LabeledContent("Updated", value: request.updatedAt, format: .dateTime)
                    LabeledContent("Messages", value: "\(request.messages.count)")
                }
            }
            .navigationTitle("Request Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveChanges()
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func saveChanges() {
        var updatedRequest = request
        updatedRequest.name = name
        updatedRequest.systemPrompt = systemPrompt
        updatedRequest.model = model
        updatedRequest.temperature = temperature
        updatedRequest.updatedAt = Date()
        
        request = updatedRequest
    }
}

#Preview {
    RequestInspectorView(request: .constant(Request(name: "Test Request")))
}
