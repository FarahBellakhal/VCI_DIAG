//
//  AlertModel.swift
//  Car_Shop
//
//  Created by Saba Khitaridze on 29.07.21.
//

import UIKit

class myAlert {

    static func showAlert(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
