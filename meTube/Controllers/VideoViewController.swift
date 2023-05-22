//
//  VideoViewController.swift
//  meTube
//
//  Created by Ardak Tursunbayev on 23.05.2023.
//

import UIKit

class VideoViewController: UIViewController {
    
    var vidTitle : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = vidTitle
        label.textColor = .systemRed
        view.addSubview(label)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
