//
//  Date.swift
//  NASAAPOD
//
//  Created by Arjun on 30/04/26.
//

import Foundation

extension Date {
    func formatted(_ format:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: self)
    }
}
