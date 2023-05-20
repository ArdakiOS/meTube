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
                
                print(error?.localizedDescription)
                return
                
            }
            print("data fetched")
            
//            do{
//                //
//            }
//            catch{
//                //
//            }
        }
        dataTask.resume()
    }
}
