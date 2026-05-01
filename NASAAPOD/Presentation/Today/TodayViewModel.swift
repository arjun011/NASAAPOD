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
    var isShowingCachedData:Bool = false
    

    func loadTodayAPOD() async {
        
        isLoading = true
        self.errorMessage = nil
        self.todayAPODDetails = nil
        self.isShowingCachedData = false
        
        do {
            let apodResult = try await repository.fetchTodayAPOD()
            
            self.todayAPODDetails = apodResult.apod
            self.isShowingCachedData = apodResult.source == .cache
            
        } catch {
            print(error.localizedDescription)
            errorMessage = "Unable to load APOD"
        }
        isLoading = false
    }

}
