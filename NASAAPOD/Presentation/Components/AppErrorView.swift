//
//  AppErrorView.swift
//  NASAAPOD
//
//  Created by Arjun on 30/04/26.
//

import SwiftUI

struct AppErrorView: View {
    let title: String
    let message: String?
    let systemImage: String
    let actionTitle: String
    let action: () -> Void

    var body: some View {
        ContentUnavailableView {
            Label(title, systemImage: systemImage)
        } description: {
            Text(message ?? "")
        } actions: {
            Button(actionTitle, action: action)
                .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    AppErrorView(
        title: "Failed to Load",
        message: "Unable to load",
        systemImage: "exclamationmark.triangle",
        actionTitle: "Retry",
        action: {

        }
    )
}
