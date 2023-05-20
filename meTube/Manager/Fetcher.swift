//
//  Fetcher.swift
//  meTube
//
//  Created by Ardak Tursunbayev on 19.05.2023.
//

import Foundation

class Fetcher {
    
    func getVideos() {
        
        guard let url = URL(string: Constants.API_URL) else {return}
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { data, respons, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let result = try decoder.decode(ResponseModel.self, from: data)
                dump(result)
            }
            catch{
                print (error)
            }
            
            
        }
        dataTask.resume()
    }
}
