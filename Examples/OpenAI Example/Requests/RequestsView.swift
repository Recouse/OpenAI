//
//  RequestsView.swift
//  OpenAI Example
//
//  Created by Firdavs Khaydarov on 03/08/2025.
//

import SwiftUI

struct RequestsView: View {
    @Binding var selection: Request.ID?
    var model: RequestsModel
    @State private var showingCreateSheet = false

    var body: some View {
        List(model.requests, selection: $selection) { request in
            VStack(alignment: .leading, spacing: 4) {
                Text(request.name)
                    .font(.headline)

                HStack {
                    Text(request.apiType.displayName)
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Spacer()

                    Text(request.updatedAt, style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 2)
        }
        .navigationTitle("Requests")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Add", systemImage: "plus") {
                    showingCreateSheet = true
                }
            }
        }
        .sheet(isPresented: $showingCreateSheet) {
            CreateRequestSheet { name, apiType in
                let newRequest = model.createRequest(name: name, apiType: apiType)
                selection = newRequest.id
                showingCreateSheet = false
            }
        }
    }
}

struct CreateRequestSheet: View {
    @State var name: String = ""
    @State var apiType: APIType = .chatCompletions
    let onCreate: (_ name: String, _ apiType: APIType) -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section("Request Details") {
                    TextField("Name", text: $name)
                    
                    Picker("API Type", selection: $apiType) {
                        ForEach(APIType.allCases) { api in
                            Text(api.displayName).tag(api)
                        }
                    }
                }
            }
            .navigationTitle("New Request")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Create") {
                        onCreate(name, apiType)
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}
