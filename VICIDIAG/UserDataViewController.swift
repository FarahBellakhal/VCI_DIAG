//
//  UserDataViewController.swift
//  BlueDesign
//
//  Created by Matteo Visotto on 04/05/2020.
//  Copyright © 2020 Matteo Visotto. All rights reserved.
//

import UIKit

class UserDataViewController: UIViewController {
   // @IBOutlet weak var headerView: MVNavigationHeaderView!
    
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var autoDiag: UIButton!
    override var preferredStatusBarStyle: UIStatusBarStyle{
           return .lightContent
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // headerView.backgroundColor = UIColor(named: "Sapphire")
        //headerView.setTitle(title: "Rapport")
       // headerView.delegate = self
    }

    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

