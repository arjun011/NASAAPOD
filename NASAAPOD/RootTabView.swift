//
//  RootTabView.swift
//  NASAAPOD
//
//  Created by Arjun on 24/04/26.
//

import SwiftUI

struct RootTabView: View {

    private enum TabSection: Hashable {
        case today
        case browse
    }

    @State private var selectedTab: TabSection = .today

    var body: some View {

        TabView(
            selection: $selectedTab,
            content: {

                Tab("Today", systemImage: "sparkles", value: .today) {
                    NavigationStack {
                        TodayView()
                    }
                }

                Tab("Browse", systemImage: "calendar", value: .browse) {
                    NavigationStack {
                        BrowseView()
                    }
                }
            }
        )

    }
}

#Preview {
    RootTabView()
}
