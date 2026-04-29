//
//  APODRepositoryImpl.swift
//  NASAAPOD
//
//  Created by Arjun on 28/04/26.
//

import Foundation

final class APODRepositoryImpl:APODRepository {
    
   private let client:APODServiceProtocol
    
    init(client: APODServiceProtocol = NASAAPIClient()) {
        self.client = client
    }
    
    func fetchTodayAPOD() async throws -> APOD {
        return try await self.client.fetchTodayAPOD()
    }
    
}
