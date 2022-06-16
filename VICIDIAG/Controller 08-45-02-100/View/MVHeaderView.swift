//
//  MVHeaderView.swift
//  BlueDesign
//
//  Created by Matteo Visotto on 04/05/2020.
//  Copyright © 2020 Matteo Visotto. All rights reserved.
//

import UIKit
@IBDesignable
class MVHeaderView: UIView {
    
    var titleLabel = UILabel()
    
    override func draw(_ rect: CGRect) {
        titleLabel.frame = CGRect(x: 0, y: 0, width: frame.width-20, height: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.white
        titleLabel.font = .boldSystemFont(ofSize: 25)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive=true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
    public func setTitle(title: String){
        titleLabel.text = title
    }
}
