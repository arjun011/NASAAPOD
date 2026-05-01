//
//  MockAPODRepository.swift
//  NASAAPODTests
//
//  Created by Arjun on 01/05/26.
//

import Testing

import Foundation
@testable import NASAAPOD

final class MockAPODRepository: APODRepository {

    let result: Result<APODFetchResult, Error>

    init(result: Result<APODFetchResult, Error>) {
        self.result = result
    }

    func fetchTodayAPOD() async throws -> APODFetchResult {
        try result.get()
    }

    func fetchAPOD(for date: Date) async throws -> APODFetchResult {
        try result.get()
    }
}
