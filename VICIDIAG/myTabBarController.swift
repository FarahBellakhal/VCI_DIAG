//
//  myTabBarController.swift
//  BlueDesign
//
//  Created by Matteo Visotto on 03/05/2020.
//  Copyright © 2020 Matteo Visotto. All rights reserved.
//

import UIKit
import SwiftSpinner
import PusherSwift
class MyTabBarController: UITabBarController, UITabBarControllerDelegate ,PusherDelegate {
   
    var pusher: Pusher! = nil
    let decoder = JSONDecoder()
    var progress = 0.0
    private var menuIsOpen: Bool = false
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        setLayout()
        setupMiddleButton()
    }
    
    private func setLayout(){
        self.tabBar.tintColor = UIColor(named: "Sapphire")
        let items = self.tabBar.items!
               items[0].title = ""
               items[1].title = ""
               
               items[0].imageInsets = UIEdgeInsets(top: 5,left: 0,bottom: -5,right: 0)
               items[1].imageInsets = UIEdgeInsets(top: 5,left: -10,bottom: -5,right: 10)
               
    }
    //func connexion succes
    func connexionSuccess() {
       
        delay(seconds: 21.0, completion: {
            SwiftSpinner.setTitleFont(nil)
            SwiftSpinner.shared.innerColor = UIColor.green.withAlphaComponent(0.5)
            SwiftSpinner.show(duration: 2.0, title: "Connecté ", animated: false)
        })
    }
    // func cnx invalide
    func connexionfailed() {
        delay(seconds: 10.0, completion: {
            SwiftSpinner.shared.outerColor = UIColor.red.withAlphaComponent(0.5)
            SwiftSpinner.setTitleColor(UIColor.red)
            SwiftSpinner.show("Connexion échouée, attendez...", animated: false)
        })
    }
    // TabBarButton – Setup Middle Button
    func setupMiddleButton() {
        let middleBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-25, y: -20, width: 50, height: 50))
        middleBtn.tag = 101
        middleBtn.layer.cornerRadius = 25
        middleBtn.tintColor = UIColor.white
        middleBtn.setImage(UIImage(named: "add"), for: .normal)
        middleBtn.backgroundColor = UIColor(named: "Sapphire")
        self.tabBar.addSubview(middleBtn)
        middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)
        self.view.layoutIfNeeded()
    }
    func delay(seconds: Double, completion: @escaping () -> ()) {
            let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
            
            DispatchQueue.main.asyncAfter(deadline: popTime) {
                completion()
            }
        }
       // Menu Button Touch Action
    @objc func menuButtonAction(sender: UIButton) {
        SwiftSpinner.show(delay: 0.5, title: "Shouldn't see this one", animated: true)
        
                SwiftSpinner.hide()
               SwiftSpinner.show(delay: 1.0, title: "Connexion...", animated: true)
        
        delay(seconds: 2.0, completion: {
            SwiftSpinner.show("Connexion \n  au vehicule...").addTapHandler({
                print("tapped")
                
                SwiftSpinner.hide()
            }, subtitle: "Tap to hide while connecting! This will affect only the current operation.")
        })
                
             // conneter au serveur
        
                     // connexionSuccess()
                      
         
                    //  connexionfailed()
                  
       
                  
                
                delay(seconds: 10.0, completion: {
                    SwiftSpinner.shared.outerColor = UIColor.red.withAlphaComponent(0.5)
                    SwiftSpinner.setTitleColor(UIColor.red)
                    SwiftSpinner.show("Connexion échouée, attendez...", animated: false)
                })
                
                delay(seconds: 14.0, completion: {
                    SwiftSpinner.shared.outerColor = nil
                    SwiftSpinner.setTitleFont(UIFont(name: "Futura", size: 22.0))
                    SwiftSpinner.setTitleColor(UIColor.white)
                    SwiftSpinner.show("Nouvelle tentative de connexion")
                })
                
                delay(seconds: 18.0, completion: {
                    SwiftSpinner.setTitleColor(UIColor.green)
                    SwiftSpinner.show("Connexion...")
                })
        
                delay(seconds: 24.0) {
                    SwiftSpinner.setTitleColor(UIColor.white)
                    SwiftSpinner.shared.innerColor = nil
                    Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.timerFire), userInfo: nil, repeats: true)
                }
                
    }
    @objc func timerFire(_ timer: Timer) {
            progress += (timer.timeInterval/5)
            SwiftSpinner.show(progress: progress, title: "Rechargement des données: \(Int(progress * 100))% terminé")
            if progress >= 1 {
                progress = 0
                timer.invalidate()
                SwiftSpinner.show(duration: 2.0, title: "Terminer!", animated: true)
            }
        }
        
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
      
    

}
