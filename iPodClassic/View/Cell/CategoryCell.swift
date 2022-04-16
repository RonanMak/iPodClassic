//
//  CategoryCell.swift
//  iPodClassic
//
//  Created by Ronan Mak on 13/4/2022.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "music"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let arrowIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "arraow_icon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubview(categoryLabel)
        addSubview(arrowIcon)
        categoryLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        arrowIcon.rightAnchor.constraint(equalTo: rightAnchor,constant: -10).isActive = true
        arrowIcon.centerYAnchor.constraint(equalTo: categoryLabel.centerYAnchor).isActive = true
        arrowIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        arrowIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

