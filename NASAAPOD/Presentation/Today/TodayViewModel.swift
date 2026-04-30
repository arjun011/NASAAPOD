//
//  TodayViewModel.swift
//  NASAAPOD
//
//  Created by Arjun on 25/04/26.
//

import Foundation

@MainActor
@Observable final class TodayViewModel {
    
    private let repository: APODRepository
    init(repository: APODRepository) {
        self.repository = repository
    }

    var isLoading = false
    var errorMessage: String?
    var todayAPODDetails: APOD?
    

    func loadTodayAPOD() async {
        
        isLoading = true
        
        do {
            self.todayAPODDetails = try await repository.fetchTodayAPOD()
            print(self.todayAPODDetails?.title ?? "Title")
        } catch {
            print(error.localizedDescription)
            errorMessage = "Unable to load APOD"
        }
        
        isLoading = false
    }

}
