//
//  Connexion.swift
//  Diagnostic_VCI
//
//  Created by mac on 17/5/2022.
//

import Foundation
import UIKit
import SwiftSpinner
import PusherSwift
class connexion: UIViewController, UITextFieldDelegate,PusherDelegate{
    
    @IBOutlet weak var ipTextField: UITextField!
    
    @IBOutlet weak var portTextField: UITextField!
    
    @IBOutlet weak var connectBtn: UIButton!
    var sock:Int32 = -1
    var pusher: Pusher! = nil
    let decoder = JSONDecoder()
    var progress = 0.0
    private var menuIsOpen: Bool = false
    /*required init?(coder: NSCoder) {
        super.init(coder: coder)
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        ipTextField.delegate = self
        portTextField.delegate = self
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(connexion.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        ipTextField.resignFirstResponder()
        portTextField.resignFirstResponder()
        return true;
    }
    
    @objc func didTapView() {
        self.view.endEditing(true)
    }
    
    func updateConnectButton(connected: Bool) {
        connectBtn.isEnabled = !connected
        
    }
    func delay(seconds: Double, completion: @escaping () -> ()) {
            let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
            
            DispatchQueue.main.asyncAfter(deadline: popTime) {
                completion()
            }
        }
    
    @IBAction func Connecter(_ sender: UIButton) {
        SwiftSpinner.show(delay: 0.5, title: "Shouldn't see this one", animated: true)
        
                SwiftSpinner.hide()
               SwiftSpinner.show(delay: 1.0, title: "Connexion...", animated: true)
        
        delay(seconds: 1.0, completion: {
            SwiftSpinner.show("Connexion \n au vehicule...").addTapHandler({
                print("tapped")
                
                SwiftSpinner.hide()
            }, subtitle: "Tap to hide while connecting! This will affect only the current operation.")
        })
        Tester_init()
        
        Tester_Connect()
        delay(seconds: 21.0, completion: {
            SwiftSpinner.setTitleFont(nil)
            SwiftSpinner.shared.innerColor = UIColor.green.withAlphaComponent(0.5)
            SwiftSpinner.show(duration: 2.0, title: "Connecté ", animated: false)
        })
    }
    @IBAction func closeSocket(_ sender: UIButton) {
       
        updateConnectButton(connected: false)
    }
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
