//
//  TodayView.swift
//  NASAAPOD
//
//  Created by Arjun on 24/04/26.
//

import SwiftUI

struct TodayView: View {

    @State var model: TodayViewModel = TodayViewModel(
        repository: APODRepositoryImpl()
    )

    var body: some View {

        VStack {
            if let message = model.errorMessage {
                self.errorView(message)
            } else if model.isLoading {
                ProgressView()
                    .font(.largeTitle)

            } else if let apod = model.todayAPODDetails {
                APODDetailView(apod: apod)
            }
            if model.isShowingCachedData {
                Text("Showing last cached APOD because the today data could not be loaded.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding()
            }
        }.task {
            await model.loadTodayAPOD()
        }
    }


    private func errorView(_ message: String) -> some View {

        AppErrorView(
            title: "Something went wrong",
            message: message,
            systemImage: "exclamationmark.triangle",
            actionTitle: "Retry"
        ) {
            Task {
                await model.loadTodayAPOD()
            }
        }

    }
}

#Preview {

    NavigationStack {
        TodayView(model: TodayViewModel(repository: PreviewAPODRepository()))
    }

}
