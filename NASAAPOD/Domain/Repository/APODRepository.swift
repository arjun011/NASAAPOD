//
//  APODRepository.swift
//  NASAAPOD
//
//  Created by Arjun on 28/04/26.
//

import Foundation

protocol APODRepository: Sendable {
    func fetchTodayAPOD() async throws -> APOD
}
