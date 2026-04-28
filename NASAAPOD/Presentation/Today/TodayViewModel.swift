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
    
    func loadTodayAPOD() async {
        do{
            let apodList = try await repository.fetchTodayAPOD()
        }catch {
            print(error)
        }
    }
  
}
