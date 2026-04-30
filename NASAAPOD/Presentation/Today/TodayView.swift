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

        ZStack {
            
            VStack {
                if let message =  model.errorMessage {
                    AppErrorView(title: "Something went wrong", message: message, systemImage: "exclamationmark.triangle", actionTitle: "Retry") {
                        Task {
                            await model.loadTodayAPOD()
                        }
                    }
                }else if model.isLoading {
                    ProgressView()
                        .font(.largeTitle)

                }else if let apod = model.todayAPODDetails {
                
                    ScrollView(.vertical) {

                        VStack(alignment: .leading) {

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
                            }else {
                                APODVideoView(videoUrl: apod.url)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity)
                            }
                            
                            

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
            }
           
        }.task {
            await model.loadTodayAPOD()
        }
    }
}

#Preview {

    NavigationStack {
        TodayView(model: TodayViewModel(repository: PreviewAPODRepository()))
    }

}
