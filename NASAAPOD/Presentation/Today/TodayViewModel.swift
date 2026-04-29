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

    var todayAPODDetails: APOD?

    func loadTodayAPOD() async {
        #if DEBUG
            // In debug builds, use a mock APOD and return early.
            self.todayAPODDetails = APOD.mock
            return
        #endif
        
        do {
            self.todayAPODDetails = try await repository.fetchTodayAPOD()
        } catch {
            print(error)
        }
    }

}
