//
//  TodayView.swift
//  NASAAPOD
//
//  Created by Arjun on 24/04/26.
//

import SwiftUI

struct TodayView: View {
    
    var body: some View {
        VStack {
            Text("ToDay")
        }.task {
            let model = TodayViewModel(repository: APODRepositoryImpl())
            await model.loadTodayAPOD()
        }
    }
}

#Preview {
    TodayView()
}
