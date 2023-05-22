//
//  FirstScreen.swift
//  meTube
//
//  Created by Ardak Tursunbayev on 19.05.2023.
//

import UIKit

class FirstScreen: UIViewController, ModelDelegate {

    
    var fetch = Fetcher()
    var videos = [Video]()
    private let tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        fetch.delegate = self
        fetch.getVideos()
        
    }

    func videosFetched(_ video: [Video]) {
        self.videos = video
        
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    

}

extension FirstScreen : UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.configure(videos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 370
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Playlist Items"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        
        header.textLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalized
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let nextPage = VideoViewController()
        let temp = videos[indexPath.row].title
        nextPage.vidTitle = temp
        navigationController?.pushViewController(nextPage, animated: true)
    }
}

