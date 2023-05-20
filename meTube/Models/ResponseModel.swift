//
//  ResponseModel.swift
//  meTube
//
//  Created by Ardak Tursunbayev on 20.05.2023.
//

import Foundation

struct ResponseModel : Decodable {
    
    var items : [Video]?
    
    enum CodingKeys : String, CodingKey {
        case  items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
    
}
