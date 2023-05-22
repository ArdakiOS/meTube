//
//  VideoModel.swift
//  meTube
//
//  Created by Ardak Tursunbayev on 19.05.2023.
//

import Foundation

struct Video : Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published : Date
    
    enum CodingKeys : String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        let resourceContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highConteiner = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.videoId = try resourceContainer.decode(String.self, forKey: .videoId)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.thumbnail = try highConteiner.decode(String.self, forKey: .thumbnail)
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
    }
}



//struct VideoModel: Codable {
//
//    let publishedAt : String
//    let channelId : String
//    let title : String
//    let description : String
//    let thumbnails : Thumbnail
//    let channelTitle : String
//    let playlistId : String
//    let position : Int
//    let resourceID : Resource
//}

//struct Response : Codable {
//    let kind : String
//    let etag : String
//    let nextPageToken : String
//    let items : Array<Item>
//    let pageInfo : PageInfo
//}

//struct Item : Codable {
//    let kind : String
//    let etag : String
//    let id : String
//    let snippet : Array<VideoModel>
//    let videoOwnerChannelTitle : String
//    let videoOwnerChannelId : String
//}
//
//struct Thumbnail : Codable {
//    let standard : Standard
//}
//
//struct Resource : Codable {
//    let kind : String
//    let videoId : String
//}
//
//struct Standard: Codable{
//    let url : String
//    let width : Int
//    let height : Int
//}
//
//struct PageInfo : Codable {
//    let totalResults : Int
//    let resultsPerPage : Int
//}
