//
//  SettingsViewController.swift
//  BlueDesign
//
//  Created by Matteo Visotto on 04/05/2020.
//  Copyright © 2020 Matteo Visotto. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var autoDiag: UIButton!
    
    @IBOutlet weak var headerView: MVHeaderView!
    
    @IBOutlet weak var tableView: UITableView!
    
    let manucfact = ManufacturerVC(nibName: "ManufacturerVC", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //headerView.setTitle(title: "Car Diag")
        headerView.backgroundColor = UIColor(named: "Sapphire")
        
       // tableView.delegate = self
       // tableView.dataSource = self
    }
    
    @IBAction func AutoBtn(_ sender: UIButton) {
        navigationController?.pushViewController(manucfact, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

   @objc private func testMethod(sender: UISwitch!){
        if(sender.isOn){
            print("Switch is on!")
        } else {
            print("Switch is off")
        }
    }

}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "testCell") as! SegueTableViewCell
            cell.setCell(description: "Segue prova")
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "testCell2") as! SwitchTableViewCell
            cell.setCell(description: "Test control", defaultValue: false)
            cell.control.addTarget(self, action: #selector(testMethod), for:.valueChanged)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "testCell")! as UITableViewCell
            return cell
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Impostazioni"
        case 1:
            return "Personalizzazione"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Selected row \(indexPath.row) in section \(indexPath.section)" )
        
        let addViewController = PlusViewController()
        addViewController.modalPresentationStyle = .fullScreen
        present(addViewController, animated: true, completion: nil)
        
    }
    
}
