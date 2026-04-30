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
                self.apodContent(apod)
            }
        }.task {
            await model.loadTodayAPOD()
        }
    }

    @ViewBuilder
    private func mediaView(for apod: APOD) -> some View {

        if apod.mediaType == .image {
            AsyncImage(
                url: apod.url
            ) { image in

                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)

            } placeholder: {
                Rectangle()
                    .fill(.gray.opacity(0.15))
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .overlay {
                        ProgressView()
                    }
            }
        } else {
            APODVideoView(videoUrl: apod.url)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
        }

    }

    private func apodContent(_ apod: APOD) -> some View {

        ScrollView(.vertical) {

            VStack(alignment: .leading) {

                self.mediaView(for: apod)

                VStack(alignment: .leading, spacing: 5) {
                    Text(apod.title)
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text(apod.date)
                        .font(.subheadline)
                        .foregroundStyle(.gray)

                    Text(apod.explanation)

                }.padding(.horizontal, 10)
            }
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
