//
//  APODVideoView.swift
//  NASAAPOD
//
//  Created by Arjun on 30/04/26.
//

import SwiftUI

struct APODVideoView: View {
    let videoUrl:URL
    var body: some View {
        ContentUnavailableView {
                    Label("Video APOD", systemImage: "play.rectangle.fill")
                } description: {
                    Text("Today's APOD is a video.")
                } actions: {
                    Link("Open Video", destination: videoUrl)
                        .buttonStyle(.borderedProminent)
                }
    }
}

#Preview {
    APODVideoView(videoUrl: URL(string: "https://apod.nasa.gov/apod/image/2604/waves.mp4")!)
}
