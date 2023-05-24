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
    var previous: UILabel?
    
    let titleLable : UILabel = {
        let titleLable = UILabel()
        titleLable.font = .systemFont(ofSize: 25, weight: .bold)
        titleLable.textColor = .white
        titleLable.numberOfLines = 0
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        return titleLable
    }()
    
    let dateLable : UILabel = {
        let dateLable = UILabel()
        dateLable.font = .systemFont(ofSize: 15, weight: .semibold)
        dateLable.textColor = .white
        dateLable.translatesAutoresizingMaskIntoConstraints = false
        return dateLable
    }()
    
    let desc : UILabel = {
        let desc = UILabel()
        desc.font = .systemFont(ofSize: 15, weight: .semibold)
        desc.textColor = .white
        desc.numberOfLines = 0
        desc.translatesAutoresizingMaskIntoConstraints = false
        return desc
    }()
    
    let webV : WKWebView = {
        let webV = WKWebView()
        webV.translatesAutoresizingMaskIntoConstraints = false
        return webV
    }()
    
    let container : UIStackView = {
        let c = UIStackView()
        c.axis = .vertical
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()
    
    let scrollView : UIScrollView = {
        let c =  UIScrollView()
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        //        view.addSubview(webV)
        //        view.addSubview(titleLable)
        //        view.addSubview(dateLable)
        //        view.addSubview(desc)
        
        setUpView()
        
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
    
    func setUpView(){
        view.addSubview(webV)
        view.addSubview(scrollView)
        scrollView.addSubview(container)
        container.addArrangedSubview(titleLable)
        container.addArrangedSubview(dateLable)
        container.addArrangedSubview(desc)
        
        NSLayoutConstraint.activate([
            webV.topAnchor.constraint(equalTo: view.topAnchor),
            webV.widthAnchor.constraint(equalTo: view.widthAnchor),
            webV.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height/2),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: scrollView.topAnchor),
            container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            container.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        
        
        for labels in [titleLable, dateLable, desc]{
            if let previous = previous{
                labels.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
            }
            let labSize = labels.sizeThatFits(CGSize(width: container.frame.width, height: .greatestFiniteMagnitude))
            NSLayoutConstraint.activate([
                labels.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
        }
        
    }
    
}
