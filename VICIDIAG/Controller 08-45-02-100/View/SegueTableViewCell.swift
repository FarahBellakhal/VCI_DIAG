//
//  SegueTableViewCell.swift
//  BlueDesign
//
//  Created by Matteo Visotto on 05/05/2020.
//  Copyright © 2020 Matteo Visotto. All rights reserved.
//

import UIKit

class SegueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    func setCell(description: String){
        label.text = description
        self.accessoryType = .disclosureIndicator
        self.selectionStyle = .default
    }

}
