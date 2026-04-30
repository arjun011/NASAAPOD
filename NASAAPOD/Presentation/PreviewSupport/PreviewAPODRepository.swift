//
//  PreviewAPODRepository.swift
//  NASAAPOD
//
//  Created by Arjun on 29/04/26.
//

import Foundation

class PreviewAPODRepository:APODRepository {
    
    func fetchAPOD(for date: Date) async throws -> APOD {
        APOD.mock
    }
    
    func fetchTodayAPOD() async throws -> APOD {
        APOD.mock
    }
}

