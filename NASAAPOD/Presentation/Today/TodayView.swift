//
//  TodayView.swift
//  NASAAPOD
//
//  Created by Arjun on 24/04/26.
//

import SwiftUI

struct TodayView: View {
    @State var model:TodayViewModel = TodayViewModel(repository: APODRepositoryImpl())

    var body: some View {
        VStack {
            Text(model.todayAPODDetails?.title ?? "")
        }.task {
            await model.loadTodayAPOD()
        }
    }
}

#Preview {
    TodayView(model: TodayViewModel(repository: PreviewAPODRepository()))
}
