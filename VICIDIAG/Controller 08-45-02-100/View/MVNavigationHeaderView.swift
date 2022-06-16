//
//  MVNavigationHeaderView.swift
//  BlueDesign
//
//  Created by Matteo Visotto on 05/05/2020.
//  Copyright © 2020 Matteo Visotto. All rights reserved.
//

import UIKit

protocol MVNavigationHeaderDelegate {
    func didTapBackButton(backButton: UIButton!)
}

class MVNavigationHeaderView: UIView {
    var delegate: MVNavigationHeaderDelegate? = nil
    var titleLabel = UILabel()
    private var backButton: UIButton!
    
    override func draw(_ rect: CGRect) {
        backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = UIColor.white
        backButton.setBackgroundImage(UIImage(systemName: "arrow.left"), for: .normal)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        addSubview(backButton)
        titleLabel.frame = CGRect(x: 0, y: 0, width: frame.width-20, height: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.white
        titleLabel.font = .boldSystemFont(ofSize: 25)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive=true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        backButton.topAnchor.constraint(equalTo: topAnchor, constant: 45).isActive = true
        backButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
    }
    
    @objc private func didTapBackButton(){
        delegate?.didTapBackButton(backButton: backButton)
    }
    
    public func setTitle(title: String){
        titleLabel.text = title
    }
}

