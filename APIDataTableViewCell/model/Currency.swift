//
//  Currency.swift
//  APIDataTableViewCell
//
//  Created by Muralidhar reddy Kakanuru on 12/2/24.
//

import Foundation



struct Transcodings: Codable {
    let title : String?
    let id : String?
    let rtmp_stream_uri: String?
    let size : Int?
    let http_uri : String?
    let progress: Double?
    let rtmp_base_uri: String?
    let bitrate: Int?
    let height: Int?
    let rtmp_uri: String?
    let state: String?
    let width : Int?
}

struct Content: Codable{
    let id : String?
    let duration : Double?
    let title : String?
    let transcodings : [Transcodings]
}
