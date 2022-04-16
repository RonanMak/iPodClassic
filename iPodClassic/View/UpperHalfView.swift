//
//  UpperHalfView.swift
//  iPodClassic
//
//  Created by Ronan Mak on 13/4/2022.
//

import UIKit

class UpperHalfView: UIView {
    
    // MARK: - Dimen
    private enum Dimen {
//        static let spacing: CGFloat = 0
    }
    
    // MARK: - Properties
    
    private let projectLabel: UILabel = {
       let label = UILabel()
        label.text = "ipod clissic"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let batteryImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "battery_icon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper
    
    func setupStyle() {
        addSubview(projectLabel)
        addSubview(batteryImageView)
        backgroundColor = .yellow

        projectLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        projectLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        projectLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        batteryImageView.centerYAnchor.constraint(equalTo: projectLabel.centerYAnchor).isActive = true
        batteryImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        batteryImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        batteryImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 200, height: 41)
//    }
}

