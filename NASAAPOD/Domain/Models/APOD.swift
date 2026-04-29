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
    let mediaType:MediaType
    let service_version:String
    let title:String
    let url:String
    
    enum MediaType:String, Codable {
        case image
        case video
    }
    
    enum CodingKeys: String, CodingKey {
        case copyright
        case date
        case explanation
        case hdurl
        case mediaType = "media_type"
        case service_version
        case title
        case url
    }
}
