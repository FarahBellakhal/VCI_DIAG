//
//  FonctVC.swift
//  Diagnostic_VCI
//
//  Created by mac on 25/04/2022.
//

import Foundation
import UIKit
import SwiftSpinner
import PusherSwift
import Firebase
import FirebaseStorage

class FonctVC: UIViewController , UIGestureRecognizerDelegate{
    
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var menuCollectionView: UICollectionView!{
        didSet {
            menuCollectionView.dataSource = self
           menuCollectionView.delegate = self

        }
    }
    var cpt = 1
    var pusher: Pusher! = nil
    let decoder = JSONDecoder()
    var progress = 0.0
    var MenuArray = [Menu] ()
    var ref1: DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()
        menuCollectionView.layer.cornerRadius = 20
        menuCollectionView.layer.shadowRadius = 10
        menuCollectionView.layer.shadowOffset = CGSize(width: 1, height: 1)
        menuCollectionView.layer.shadowOpacity = 0.2
    ref1 = Database.database().reference().child("menu")
    ref1?.observe(.childAdded) {[weak self](snapshot) in
     guard let value = snapshot.value as? [String : Any] else {
            return
        }
        if let nom = value["nom"] as? String {
            let mesure = Menu(nom: nom)
            self?.MenuArray.append(mesure)
}
        if let row = self?.MenuArray.count{
            let indexPath = IndexPath(item: row-1,section : 0)
                self?.menuCollectionView.insertItems(at: [indexPath])
        }
    }
        
    }
    func delay(seconds: Double, completion: @escaping () -> ()) {
            let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
            
            DispatchQueue.main.asyncAfter(deadline: popTime) {
                completion()
            }
        }
    @IBAction func NEXT(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        SwiftSpinner.show(delay: 0.5, title: "Shouldn't see this one", animated: true)
        
                SwiftSpinner.hide()
               SwiftSpinner.show(delay: 1.0, title: "Diagnostic...", animated: true)
        
        delay(seconds: 1.0, completion: {
            SwiftSpinner.show("Lancement \n du diagnostic...").addTapHandler({
                print("tapped")
                
                SwiftSpinner.hide()
            }, subtitle: "Tap to hide while connecting! This will affect only the current operation.")
        })
        delay(seconds: 1.0, completion: {
            SwiftSpinner.setTitleFont(nil)
            SwiftSpinner.shared.innerColor = UIColor.green.withAlphaComponent(0.5)
            SwiftSpinner.show(duration: 2.0, title: "Terminé! Voir résultat ", animated: false)
            
        }
        )
            let secondVc = storyboard.instantiateViewController(withIdentifier: "ECUVC") as! ECUVC
            secondVc.modalPresentationStyle = .fullScreen
                self.present(secondVc, animated: true, completion: nil)
        }
    @IBAction func btnBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension FonctVC : UICollectionViewDataSource {
    

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return  MenuArray.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let menu = MenuArray[indexPath.row]
    let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "FonctCell", for: indexPath) as! FonctCell
    
   
    cell.NomLabel.text = menu.nom
    
   
    return cell
    
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = menuCollectionView.cellForItem(at: indexPath) as! FonctCell
       // cell.contentView.backgroundColor = .darkGray
        cell.contentView.layer.masksToBounds = true
        if cell.contentView.backgroundColor == .darkGray{
            cell.contentView.backgroundColor = .white
        }else{
            cell.contentView.backgroundColor = .darkGray
        }
        
       /* let cell1 = marqueCollectionView.cellForItem(at: lastIndexActive) as! ManufacturerCell
        cell1.contentView.backgroundColor = .white
        cell1.contentView.layer.masksToBounds = true
        lastIndexActive = indexPath*/
        }
    
}



extension FonctVC: UICollectionViewDelegateFlowLayout {

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let yourWidth = collectionView.bounds.width/2.0
    let yourHeight = yourWidth

    return CGSize(width: yourWidth, height: yourHeight)
}
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets.zero
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
}
    

   
}
