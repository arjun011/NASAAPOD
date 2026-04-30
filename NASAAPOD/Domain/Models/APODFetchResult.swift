//
//  APODFetchResult.swift
//  NASAAPOD
//
//  Created by Arjun on 30/04/26.
//

import Foundation

struct APODFetchResult: Sendable {
    
    let apod:APOD
    let source:Source
    
    enum Source:Equatable {
        case cache
        case remote
    }
}
