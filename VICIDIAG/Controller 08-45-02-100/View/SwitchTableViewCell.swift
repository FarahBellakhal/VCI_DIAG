//
//  SwitchTableViewCell.swift
//  BlueDesign
//
//  Created by Matteo Visotto on 05/05/2020.
//  Copyright © 2020 Matteo Visotto. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var control: UISwitch!
    
    func setCell(description: String, defaultValue: Bool){
        setLayout()
        control.isOn = defaultValue
        label.text = description
    }
    
    private func setLayout(){
        self.selectionStyle = .none
        control.onTintColor = UIColor(named: "Sapphire")
    }
    
    
}
