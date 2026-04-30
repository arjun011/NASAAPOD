//
//  APODDetailsView.swift
//  NASAAPOD
//
//  Created by Arjun on 30/04/26.
//

import SwiftUI

struct APODDetailView: View {
    
    @State var apod:APOD
    
    var body: some View {
        
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
}

#Preview {
    APODDetailView(apod: APOD.mock)
}
