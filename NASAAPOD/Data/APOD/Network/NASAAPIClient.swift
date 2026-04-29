//
//  NASAAPIClient.swift
//  NASAAPOD
//
//  Created by Arjun on 28/04/26.
//

import Foundation

final class NASAAPIClient: APODServiceProtocol {
    
    private var apodTodayURL: URL {
        // Adjust path component as needed for APOD endpoint
        URL(string: APIConstants.baseURL + "planetary/apod?api_key=\(APIConstants.apiKey)")!
    }
    
    func fetchTodayAPOD() async throws -> APOD {
        let (data, response) = try await URLSession.shared.data(from: apodTodayURL)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
       return try JSONDecoder().decode(APOD.self, from: data)
       
    }
}
