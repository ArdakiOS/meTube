//
//  Fetcher.swift
//  meTube
//
//  Created by Ardak Tursunbayev on 19.05.2023.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ video : [Video])
}

class Fetcher {
    var delegate: ModelDelegate?
    
    func getVideos(){
        
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
                
                if result.items != nil {

                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(result.items!)
                    }
                    
                }
            }
            catch{
                print(error.localizedDescription)
            }
            
            
        }
        dataTask.resume()
    }
}
