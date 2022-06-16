//
//  ECUVC.swift
//  Diagnostic_VCI
//
//  Created by mac on 25/04/2022.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import iOSDropDown
class ECUVC: UIViewController ,UIGestureRecognizerDelegate{
   
    
    //MARK: - IBOutlets
   
    @IBOutlet weak var btnDiag: UIButton!
    @IBOutlet weak var fonctCollectionview: UICollectionView!{
        didSet {
            fonctCollectionview.dataSource = self
           // marqueCollectionView.delegate = self

        }
    }
    
    @IBOutlet weak var valeurMesure: UITextField!
    @IBOutlet weak var DiagAction: UIButton!
   
    @IBOutlet weak var drop: DropDown!
    @IBOutlet weak var labelMenu: UILabel!
    var ModeleNameArray = [String] ()
    var FonctNameArray = [String] ()
    var cpt = 1
    var ref1: DatabaseReference?
    var ref: DatabaseReference?
    var ref3: DatabaseReference?
    var FonctArray = [Fonct] ()
    weak var delegate: QuantityDelegate!
  
    var EcuIndex = 0
    var ModelIndex = 0
    //let fonct = FonctVC(nibName: "FonctVC", bundle: nil)
    //let  modelback = CarsVC(nibName: "CarsVC", bundle: nil)
    @IBOutlet weak var ECUNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let secondVc = storyboard!.instantiateViewController(withIdentifier: "ECUVC") as! ECUVC
        secondVc.modalPresentationStyle = .fullScreen
        fonctCollectionview.layer.cornerRadius = 20
        //cardView.layer.shadowPath = UIBezierPath(rect: cardView.bounds).cgPath
        fonctCollectionview.layer.shadowRadius = 10
        fonctCollectionview.layer.shadowOffset = CGSize(width: 1, height: 1)
        fonctCollectionview.layer.shadowOpacity = 0.2
        ref1 = Database.database().reference().child("fonct")
        ref1?.observe(.childAdded) {[weak self](snapshot) in
         guard let value = snapshot.value as? [String : Any] else {
                return
            }
            // Download the data, assuming a max size of 1MB (you can change this as necessary)
            
            if let nom = value["nom"] as? String,let logo = value["logo"] as? String{
                let ecu = Fonct(FonctName: nom,logo : logo)
                self?.FonctArray.append(ecu)
                if let row = self?.FonctArray.count{
                    print(self?.FonctArray)
                    let indexPath = IndexPath(item: row-1,section : 0)
                        self?.fonctCollectionview.insertItems(at: [indexPath])
                }
}
            
           
            }
       
       
    }
    
    
    @IBAction func modelprecedaction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    //@IBAction func fonctAction(_ sender: Any) {
        //navigationController?.pushViewController(fonct, animated: true)
   // }
}
extension ECUVC : UICollectionViewDataSource {
    

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return    FonctArray.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   let fonct = FonctArray[indexPath.row]
    let cell = fonctCollectionview.dequeueReusableCell(withReuseIdentifier: "ECUCell", for: indexPath) as! ECUCell
    
      cell.nom.text = fonct.FonctName
    
    while cpt < 10 {
    if let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/diagnostic-108a9.appspot.com/o/fonc\(cpt).png?alt=media&token=854cf368-c784-40ec-9aee-19bcd494f5cf") {
        // show a loader here if needed
        cell.logo.load(url: url)
        cpt+=1
        return cell
    }
    }
   
    return cell
    
    }

}



extension ECUVC: UICollectionViewDelegateFlowLayout {

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
func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
 /*   if (indexPath.row >= 2) {
        
            return false
        }*/
        return true
}
   

}


