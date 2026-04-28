//
//  APODServiceProtocol.swift
//  NASAAPOD
//
//  Created by Arjun on 28/04/26.
//

import Foundation

protocol APODServiceProtocol:Sendable {
    func fetchTodayAPOD() async throws -> APOD
}
