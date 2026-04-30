//
//  NASAAPIClient.swift
//  NASAAPOD
//
//  Created by Arjun on 28/04/26.
//

import Foundation

final class NASAAPIClient: APODServiceProtocol {

    private var fetchAPODURL: URL {
        URL(
            string: APIConstants.baseURL
                + "/planetary/apod?api_key=\(APIConstants.apiKey)"
        )!
    }

    func fetchTodayAPOD() async throws -> APOD {
        try await fetchAPOD(from: fetchAPODURL)
    }

    func fetchAPOD(for date: Date) async throws -> APOD {
        let url = fetchAPODURL.appending(
            queryItems: [
                URLQueryItem(
                    name: "date",
                    value: date.formatted("yyyy-MM-dd")
                )
            ]
        )

        return try await fetchAPOD(from: url)
    }

    private func fetchAPOD(from url: URL) async throws -> APOD {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
            200...299 ~= httpResponse.statusCode
        else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(APOD.self, from: data)
    }
}
