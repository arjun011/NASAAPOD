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

extension APOD {
    static let mock = APOD(copyright: "Marcelo Salemme",
                           date: "2026-04-28",
                           explanation: "They're like mountain peaks, but they are forming stars. Bright-rimmed, flowing shapes gather near the center of this rich starfield toward the borders of the nautical southern constellations Puppis and Vela. Composed of interstellar gas and  dust, the grouping of light-year sized cometary globules is about 1300 light-years distant. Energetic ultraviolet light from nearby hot stars has molded the globules and ionized their bright rims. The globules also stream away from the Vela supernova remnant which may have influenced their swept-back shapes. Within them, cores of cold gas and dust are likely collapsing to form low mass stars whose formation will ultimately cause the globules to disperse. In fact, cometary globule CG 30 (upper right in the group) sports a small reddish glow inside its head, a telltale sign of energetic jets from a star in the early stages of formation.",
                           hdurl: "https://apod.nasa.gov/apod/image/2604/CG30Globules_Salamme_2772.jpg",
                           mediaType: MediaType.image,
                           service_version: "v1",
                           title: "CG 30: Cometary Globules",
                           url: "https://apod.nasa.gov/apod/image/2604/CG30Globules_Salamme_960.jpg")
}
