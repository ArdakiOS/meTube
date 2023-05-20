//
//  FirstScreen.swift
//  meTube
//
//  Created by Ardak Tursunbayev on 19.05.2023.
//

import UIKit

class FirstScreen: UIViewController {

    var fetch = Fetcher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        
        fetch.getVideos()
        // Do any additional setup after loading the view.
    }


}

