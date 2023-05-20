//
//  Constants.swift
//  meTube
//
//  Created by Ardak Tursunbayev on 19.05.2023.
//

import Foundation

struct Constants {
    
    static var API_KEY = "API_KEY"
    static var PLAYLIST_ID = "UULFq3PlGB0_e6jTc9Jr2Al7LQ"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
