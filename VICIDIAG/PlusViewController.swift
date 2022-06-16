//
//  PlusViewController.swift
//  BlueDesign
//
//  Created by Matteo Visotto on 06/05/2020.
//  Copyright © 2020 Matteo Visotto. All rights reserved.
//

import UIKit
import SwiftSpinner
class PlusViewController: UIViewController {
    
    private var headerView: MVAddNavigationHeaderView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        headerView = MVAddNavigationHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        headerView.delegate = self
        headerView.backgroundColor = UIColor(named: "Sapphire")
        headerView.setTitle(title: "Add test")
        view.addSubview(headerView)
        addView()
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    private func addView(){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height-headerView.frame.height+20))
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        self.view.addSubview(view)
        view.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -20).isActive=true
        view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive=true
        view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive=true
        view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

}

extension PlusViewController: MVAddNavigationHeaderDelegate {
    func didTapAddButton(addButton: UIButton) {
        print("Tapped plus button")
    }
    
    func didTapBackButton(backButton: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
}
