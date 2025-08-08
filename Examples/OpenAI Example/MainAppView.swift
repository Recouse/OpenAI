//
//  MainAppView.swift
//  OpenAI Example
//
//  Created by Firdavs Khaydarov on 03/08/2025.
//

import SwiftUI

struct MainAppView: View {
    @State private var requestsModel = RequestsModel()
    @State private var selection: Request.ID?
    @State private var columnVisibility: NavigationSplitViewVisibility = .doubleColumn

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            RequestsView(selection: $selection, model: requestsModel)
        } detail: {
            if let selectedRequestId = selection {
                RequestDetailView(
                    model: RequestDetailModel(
                        requestId: selectedRequestId,
                        requestsModel: requestsModel
                    )
                )
                .id(selectedRequestId)
            } else {
                ContentUnavailableView("Select a request", systemImage: "terminal")
            }
        }
    }
}

#Preview {
    MainAppView()
}
