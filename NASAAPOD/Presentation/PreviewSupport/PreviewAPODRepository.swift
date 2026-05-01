//
//  PreviewAPODRepository.swift
//  NASAAPOD
//
//  Created by Arjun on 29/04/26.
//

import Foundation

final class PreviewAPODRepository:APODRepository {
    
    func fetchTodayAPOD() async throws -> APODFetchResult {
        return APODFetchResult(apod: .mock, source: .remote)
    }
    
    
    func fetchAPOD(for date: Date) async throws -> APODFetchResult {
        return APODFetchResult(apod: .mock, source: .remote)
    }
    
   
}

