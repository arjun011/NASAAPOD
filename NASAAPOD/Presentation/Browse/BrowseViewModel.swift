//
//  BrowserViewModel.swift
//  NASAAPOD
//
//  Created by Arjun on 30/04/26.
//

import Foundation

@MainActor
@Observable final class BrowseViewModel {

    private let repository: APODRepository

    var isLoading = false
    var errorMessage: String?
    var apodDetails: APOD?
    var selectedDate: Date = .now
    private var loadTask: Task<Void, Never>?

    init(repository: APODRepository) {
        self.repository = repository
    }
    
    func selectedDateChange() {
        loadTask?.cancel()
        loadTask = Task {
            await loadAPOD(from: self.selectedDate)
        }
    }

    func loadAPOD(from date: Date) async {
        self.isLoading = true
        self.errorMessage = nil
        self.apodDetails = nil
        
        do {
            self.apodDetails = try await self.repository.fetchAPOD(
                for: date
            )
        } catch {
            print(error.localizedDescription)
            errorMessage = "Unable to load APOD for selected date."
        }

        self.isLoading = false
    }
}
