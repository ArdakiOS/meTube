//
//  CustomTableViewCell.swift
//  meTube
//
//  Created by Ardak Tursunbayev on 22.05.2023.
//

import UIKit
import SDWebImage

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    let stack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    let dateLable : UILabel = {
        let dateLable = UILabel()
        dateLable.font = .systemFont(ofSize: 15, weight: .semibold)
        dateLable.textColor = .systemBlue
        return dateLable
    }()
    
    let titleLable : UILabel = {
        let titleLable = UILabel()
        titleLable.font = .systemFont(ofSize: 25, weight: .bold)
        titleLable.textColor = .systemBlue
        titleLable.numberOfLines = 0
        return titleLable
    }()
    
    let imageV : UIImageView = {
        let imageV = UIImageView()
        imageV.contentMode = .scaleAspectFit
        imageV.clipsToBounds = true
        return imageV
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemBackground
        
//        contentView.addSubview(imageV)
//        contentView.addSubview(titleLable)
//        contentView.addSubview(dateLable)
        
        stack.addArrangedSubview(imageV)
        stack.addArrangedSubview(titleLable)
        stack.addArrangedSubview(dateLable)
        contentView.addSubview(stack)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        stack.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: contentView.bounds.height)
    }
    
    func configure(_ v: Video){
        let url = URL(string: v.thumbnail)
        imageV.sd_setImage(with: url, completed: nil)
        titleLable.text = v.title
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE, MMM d, yyyy"
        dateLable.text = dateFormater.string(from: v.published)
    }
    
    
}


