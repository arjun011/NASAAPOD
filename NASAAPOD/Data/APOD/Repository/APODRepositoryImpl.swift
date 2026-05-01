//
//  APODRepositoryImpl.swift
//  NASAAPOD
//
//  Created by Arjun on 28/04/26.
//

import Foundation

final class APODRepositoryImpl: APODRepository {

    private let client: APODServiceProtocol
    private let cacheManager = APODCacheManager()

    init(client: APODServiceProtocol = NASAAPIClient()) {
        self.client = client
    }

    func fetchTodayAPOD() async throws -> APODFetchResult {
        
        do {
            let apod = try await self.client.fetchTodayAPOD()
            cacheManager.save(apod)
            return APODFetchResult(apod: apod, source: .remote)
        } catch {

            if let cachedAPOD = cacheManager.load() {
                return APODFetchResult(apod: cachedAPOD, source: .cache)
            }
            throw error
        }

    }

    func fetchAPOD(for date: Date) async throws -> APODFetchResult {

        do {
            let apod = try await self.client.fetchAPOD(for: date)
            cacheManager.save(apod)
            return APODFetchResult(apod: apod, source: .remote)
        } catch {

            if let cachedAPOD = cacheManager.load() {
                return APODFetchResult(apod: cachedAPOD, source: .cache)
            }
            throw error
        }

    }

}
