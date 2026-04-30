//
//  APODCacheManager.swift
//  NASAAPOD
//
//  Created by Arjun on 30/04/26.
//

import Foundation

final class APODCacheManager {

    private let key = "cached_apod"

    func save(_ apod: APOD) {
        if let data = try? JSONEncoder().encode(apod) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    func load() -> APOD? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        return try? JSONDecoder().decode(APOD.self, from: data)
    }
}
