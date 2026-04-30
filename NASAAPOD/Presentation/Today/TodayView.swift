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

            ScrollView(.vertical) {

                VStack(alignment: .leading) {

                    AsyncImage(
                        url: URL(string: model.todayAPODDetails?.url ?? "")
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

                    VStack(alignment: .leading, spacing: 5) {
                        Text(model.todayAPODDetails?.title ?? "")
                            .font(.title2)
                            .fontWeight(.semibold)

                        Text(model.todayAPODDetails?.date ?? "")
                            .font(.subheadline)
                            .foregroundStyle(.gray)

                        Text(model.todayAPODDetails?.explanation ?? "")

                    }.padding(.horizontal, 10)

                }

            }
            .blur(radius: model.isLoading ? 1 : 0)
            .disabled(model.isLoading)
            .ignoresSafeArea(edges: .top)

            if model.isLoading {
                ProgressView()
                    .font(.largeTitle)

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
