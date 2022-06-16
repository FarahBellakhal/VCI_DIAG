//
//  ViewController.swift
//  Diag_VCI
//
//  Created by mac on 14/6/2022.
//

import Foundation
import UIKit

import SwiftSpinner
import PusherSwift
import SystemConfiguration
class ViewController: UIViewController,PusherDelegate {
    
    
     func isInternetAvailable() -> Bool {
         var zeroAddress = sockaddr_in()
         zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
         zeroAddress.sin_family = sa_family_t(AF_INET)
         let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) { $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress) } }
         var flags = SCNetworkReachabilityFlags()
         if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
             return false }
         let isReachable = flags.contains(.reachable)
         let needsConnection = flags.contains(.connectionRequired)
         return (isReachable && !needsConnection)
         
     }

    
    @IBOutlet weak var centerview: UIView!
    
    
   // @IBOutlet weak var report: UIButton!

    @IBOutlet weak var connect: UIButton!
    @IBOutlet weak var diag: UIButton!
   
    
   
    var sockfd : Int32 = socket(AF_INET, SOCK_STREAM, 0)
    
    var sock:Int32 = -1
    var pusher: Pusher! = nil
    let decoder = JSONDecoder()
    var progress = 0.0
    private var menuIsOpen: Bool = false
let defaults = UserDefaults.standard
let customColor:UIColor = #colorLiteral(red: 1, green: 0.4874575138, blue: 0, alpha: 1)
static var name:Any = ""
static var city:Any = ""
static var phone:Any = ""
static var email:Any = ""
   
    @IBOutlet weak var tabbar: UIView!
    var isOpen = false
    var tabBarConstant: CGFloat = -1
    static var extraPoint: CGFloat = 0
    override func viewDidLoad() {
    super.viewDidLoad()
   
    centerview.layer.cornerRadius = 20
    //cardView.layer.shadowPath = UIBezierPath(rect: cardView.bounds).cgPath
    centerview.layer.shadowRadius = 10
    centerview.layer.shadowOffset = CGSize(width: 1, height: 1)
    centerview.layer.shadowOpacity = 0.2
    diag.layer.cornerRadius = 10
   diag.layer.borderWidth = 0
    diag.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        // Setting shadow for menu (tab bar)
        tabbar.layer.cornerRadius = 5
        tabbar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabbar.layer.shadowOpacity = 0
   // report.layer.cornerRadius = 10
   connect.layer.cornerRadius = 10
        diag.isEnabled = false
   // let tapRecognizer = UITapGestureRecognizer()
   // tapRecognizer.addTarget(self, action: #selector(ViewController.didTapView))
   // self.view.addGestureRecognizer(tapRecognizer)
    //shopping.layer.cornerRadius = 10
    
  //  emergencyBtn.layer.cornerRadius = 10
    //defaults.removeObject(forKey: "userId")
    //  profileImage.layer.cornerRadius = 5
    
  //  fetchUserData()
       
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func isIPv4() -> Bool {
       let  IP: String  = ""
          let items = IP.components(separatedBy: ".")
          
          if(items.count != 4) { return false }
          
          for item in items {
              var tmp = 0
              if(item.utf8CString.count > 3 || item.utf8CString.count < 1){
                  return false
              }
              
              for char in item.utf8CString{
                  if(char < 0 || char > 9){
                      return false
                  }
                  
                  tmp = tmp * 10 + Int(String(char))!
              }
              
              if(tmp < 0 || tmp > 255){
                  return false
              }
              
              if((tmp > 0 && item.utf8CString.first == 0) || (tmp == 0 && item.utf8CString.count > 1)){
                  return false
              }
          }
          
          
          return true
      }
    
    @objc func didTapView() {
        self.view.endEditing(true)
    }
    
    func updateConnectButton(connected: Bool) {
        connect.isEnabled = false
        diag.isEnabled = true

        
        
    }
    func delay(seconds: Double, completion: @escaping () -> ()) {
            let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
            
            DispatchQueue.main.asyncAfter(deadline: popTime) {
                completion()
            }
        }
    
    @IBAction func logOut(_ sender: Any) {
        SwiftSpinner.show(delay: 0.5, title: "Shouldn't see this one", animated: true)
        
                SwiftSpinner.hide()
               SwiftSpinner.show(delay: 1.0, title: "Donnexion...", animated: true)
        
        delay(seconds: 1.0, completion: {
            SwiftSpinner.show("Donnexion \n du vehicule...").addTapHandler({
                print("tapped")
                
                SwiftSpinner.hide()
            }, subtitle: "Tap to hide while connecting! This will affect only the current operation.")
        })
        delay(seconds: 1.0, completion: {
            SwiftSpinner.setTitleFont(nil)
            SwiftSpinner.shared.innerColor = UIColor.green.withAlphaComponent(0.5)
            SwiftSpinner.show(duration: 2.0, title: "Déconnecté ", animated: false)
        })
        connect.isEnabled = true
        diag.isEnabled = false
       
    }
    let manufact = ManufacturerVC(nibName: "ManufacturerVC", bundle: nil)
   // let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ManufacturerVC")
    let connected = connexion(nibName: "connexion", bundle: nil)
    let userr = UserDataViewController(nibName: "user", bundle: nil)
    
    
    
     
    @IBAction func diagnosticAction(_ sender: UIButton) {
        
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let secondVc = storyboard.instantiateViewController(withIdentifier: "ManufacturerVC") as! ManufacturerVC
        secondVc.modalPresentationStyle = .fullScreen
          present(secondVc, animated: true, completion: nil)
         //self.navigationController?.pushViewController(manufact, animated: true)
    }
    
    @IBAction func diagnostiqueAction(_ sender: UIButton) {
        //let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        //let secondVc = storyboard!.instantiateViewController(withIdentifier: "ManufacturerVC") as! ManufacturerVC

          // present(vc, animated: true, completion: nil)
      
    }
    
    @IBAction func connectAction(_ sender: UIButton) {
        if ( isInternetAvailable()) {
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
        delay(seconds: 1.0, completion: {
            SwiftSpinner.setTitleFont(nil)
            SwiftSpinner.shared.innerColor = UIColor.green.withAlphaComponent(0.5)
            SwiftSpinner.show(duration: 2.0, title: "Connecté ", animated: false)
        })
            connect.isEnabled = false
            diag.isEnabled = true
        }
       
    else {
            SwiftSpinner.show(delay: 0.5, title: "Shouldn't see this one", animated: true)
            
                    SwiftSpinner.hide()
                   SwiftSpinner.show(delay: 1.0, title: "Connexion...", animated: true)
            
            delay(seconds: 1.0, completion: {
                SwiftSpinner.show("Connexion \n  au vehicule...").addTapHandler({
                    print("tapped")
                    
                    SwiftSpinner.hide()
                }, subtitle: "Tap to hide while connecting! This will affect only the current operation.")
            })
            delay(seconds: 1.0, completion: {
                SwiftSpinner.setTitleFont(nil)
                SwiftSpinner.shared.innerColor = UIColor.red.withAlphaComponent(0.5)
                SwiftSpinner.show(duration: 2.0, title: "Vérifiez votre connexion internet ", animated: false)
            })
        }
       
    }
   // @IBAction func reportAction(_ sender: UIButton) {
       // navigationController?.pushViewController(userr, animated: true)
    //}
}

   

//    @IBAction func historyBtn(_ sender: Any) {
//        self.performSegue(withIdentifier: "report", sender: nil)
//    }
//@IBAction func reportButton(_ sender: Any) {
   // self.performSegue(withIdentifier: "reportss", sender: nil)
//}
//@IBAction func doctor(_ sender: Any) {
  //  self.performSegue(withIdentifier: "doctor", sender: nil)
//}

//@IBAction func mediStore(_ sender: Any) {
   // self.performSegue(withIdentifier: "medistore", sender: nil)
//}





