//
//  TodayViewModel.swift
//  NASAAPOD
//
//  Created by Arjun on 25/04/26.
//

import Foundation
@MainActor
@Observable final class TodayViewModel {
    private let repository:APODRepository
    
    init(repository: APODRepository) {
        self.repository = repository
    }
}
