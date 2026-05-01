//
//  BrowseView.swift
//  NASAAPOD
//
//  Created by Arjun on 24/04/26.
//

import SwiftUI

struct BrowseView: View {
    
    @State var model = BrowseViewModel(repository: APODRepositoryImpl())
    
    var body: some View {
        VStack {
            
            if let message = model.errorMessage {
                self.errorView(message)
            } else if model.isLoading {
                ProgressView()
                    .font(.largeTitle)

            } else if let apod = model.apodDetails {
                APODDetailView(apod: apod)
            }
            if model.isShowingCachedData {
                Text("Showing last cached APOD because the selected date could not be loaded.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            
        }.navigationTitle("Browse")
        .navigationBarTitleDisplayMode(.automatic)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                DatePicker("Today", selection: $model.selectedDate, in: ...Date(), displayedComponents: .date)
                    .labelsHidden()
                    .onChange(of: model.selectedDate) { _, _ in
                        
                        print("API Called on  \(model.selectedDate)")
                        self.model.selectedDateChange()
                        
                    }
            }
        }.task {
            await model.loadAPOD(from: model.selectedDate)
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
                await model.loadAPOD(from: model.selectedDate)
            }
        }

    }
}

#Preview {
    
    NavigationStack {
        BrowseView(model: BrowseViewModel(repository: PreviewAPODRepository()))
    }
    
    
}
