//
//  APODModel.swift
//  NASAAPOD
//
//  Created by Arjun on 28/04/26.
//

import Foundation

struct APOD:Codable,Identifiable, Sendable {
    
    var id:String {
        date
    }
    let copyright:String
    let date:String
    let explanation:String
    let hdurl:String
    let media_type:mediaType
    let service_version:String
    let title:String
    let url:String
    
    enum mediaType:Codable {
        case image
        case video
    }
}
