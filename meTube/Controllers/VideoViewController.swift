//
//  VideoViewController.swift
//  meTube
//
//  Created by Ardak Tursunbayev on 23.05.2023.
//

import UIKit
import WebKit

class VideoViewController: UIViewController {
    
    var vid : Video?
    
    let titleLable : UILabel = {
        let titleLable = UILabel()
        titleLable.font = .systemFont(ofSize: 25, weight: .bold)
        titleLable.textColor = .systemBlue
        titleLable.numberOfLines = 0
        return titleLable
    }()
    
    let dateLable : UILabel = {
        let dateLable = UILabel()
        dateLable.font = .systemFont(ofSize: 15, weight: .semibold)
        dateLable.textColor = .systemBlue
        return dateLable
    }()
    
    let desc : UILabel = {
        let desc = UILabel()
        desc.font = .systemFont(ofSize: 15, weight: .semibold)
        desc.textColor = .systemBlue
        desc.numberOfLines = 0
        return desc
    }()
    
    let webV : WKWebView = {
        let webV = WKWebView()
        return webV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(webV)
        view.addSubview(titleLable)
        view.addSubview(dateLable)
        view.addSubview(desc)
        
        titleLable.text = vid?.title
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE, MMM d, yyyy"
        dateLable.text = dateFormater.string(from: vid!.published)
        
        desc.text = vid?.description
        
        let urlString = "https://www.youtube.com/embed/" + vid!.videoId
        
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        
        webV.load(request)
        
        
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let safeArea = view.safeAreaLayoutGuide
        
        let size = desc.sizeThatFits(CGSize(width: view.bounds.width, height: CGFloat.greatestFiniteMagnitude))
        let tSize = titleLable.sizeThatFits(CGSize(width: view.bounds.width, height: CGFloat.greatestFiniteMagnitude))
        let webSize = webV.sizeThatFits(CGSize(width: view.bounds.width, height: CGFloat.greatestFiniteMagnitude))
        
        webV.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 360)
        titleLable.frame = CGRect(x: 0, y: 100 + webSize.height, width: view.bounds.width, height: tSize.height)
        dateLable.frame = CGRect(x: 0, y: 100 + tSize.height + 20 + webSize.height, width: view.bounds.width, height: 20)
        desc.frame = CGRect(x: 0, y: 100 + tSize.height + 40 + webSize.height, width: view.bounds.width, height: size.height)
        
        
    }
}
