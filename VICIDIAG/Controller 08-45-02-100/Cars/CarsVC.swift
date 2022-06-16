//
//  CarsVC.swift

import UIKit
import iOSDropDown
import Firebase
import FirebaseStorage


class CarsVC: UIViewController, UIGestureRecognizerDelegate {
    
    //MARK: - IBOutlets
  
    @IBOutlet weak var labelMenu2: UILabel!
    
    
    @IBOutlet weak var carCollectionView: UICollectionView!{
        didSet {
            carCollectionView.dataSource = self
            carCollectionView.delegate = self

        }
    
    
    }
   
    weak var delegate: QuantityDelegate!
    var ModelIndex = 0
    var carIndex = 0
    var cpt = 1
    var ref: DatabaseReference?
    var ref2: DatabaseReference?
    var ref1: DatabaseReference?
    var ModeleArray = [Model] ()
    var ECUArray = [ECU] ()
    var ModeleNameArray = [String] ()
    var ModeleNameArray2 = [String] ()
    @IBOutlet weak var tabbar: UIView!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carModel: UILabel!
    
    @IBOutlet weak var labelModel: UILabel!

    @IBOutlet weak var drop: DropDown!

    @IBOutlet weak var drop1: DropDown!
    @IBOutlet weak var backBTN: UIButton!

    //let marque = ManufacturerVC(nibName: "ManufacturerVC", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        carCollectionView.layer.cornerRadius = 20
        //cardView.layer.shadowPath = UIBezierPath(rect: cardView.bounds).cgPath
        carCollectionView.layer.shadowRadius = 10
        carCollectionView.layer.shadowOffset = CGSize(width: 1, height: 1)
        carCollectionView.layer.shadowOpacity = 0.2
        ref1 = Database.database().reference().child("ecu")
        ref1?.observe(.childAdded) {[weak self](snapshot) in
         guard let value = snapshot.value as? [String : Any] else {
                return
            }
            // Download the data, assuming a max size of 1MB (you can change this as necessary)
            
            if let nom = value["nom"] as? String ,let logo = value["logo"] as? String{
                let marque = ECU(ECUName: nom,logo : logo)
                self?.ECUArray.append(marque)
}
            if let row = self?.ECUArray.count{
                
                let indexPath = IndexPath(item: row-1,section : 0)
                    self?.carCollectionView.insertItems(at: [indexPath])
            }
           
            }
       // drop.frame = CGRect(x: 110, y: 140, width: 200, height: 30)
        tabbar.layer.cornerRadius = 5
        tabbar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabbar.layer.shadowOpacity = 0
        ref = Database.database().reference()
        self.ref!.child("modele").child("peugeot").child("model").observe(.value) { snapshot in
            print("value from back-end : ",snapshot.value)
            let res = snapshot.value as? [Int]
            print(res!.description)
            var i = 0
            while( i<res!.count){
                self.ModeleNameArray.append(String(res![i]))
                i+=1
            }
            DispatchQueue.main.asyncAfter(deadline: .now()){ [self] in
                self.drop.optionArray = self.ModeleNameArray
                self.drop.optionIds = [1,23,54,22]
                //self.drop.showList()
                self.drop.didSelect{(selectedText , index ,id) in
                self.labelModel.text = "Modèle choisi: \(selectedText)"
                }
            }
            
        }
        /*ref2 = Database.database().reference()
        self.ref2!.child("menu").child("mesure").observe(.value) { snapshot in
            print("value from back-end : ",snapshot.value!)
            let res = snapshot.value as? [String]
            print(res!)

           var i = 0
            while( i<res!.count){
                self.ModeleNameArray2.append(String(res![i]))
                i+=1
            }
            DispatchQueue.main.asyncAfter(deadline: .now()){ [self] in
                
                self.drop1.optionArray = self.ModeleNameArray2
                self.drop1.optionIds = [1,23,54,22]
                //self.drop.showList()
                self.drop1.didSelect{(selectedText , index ,id) in
                self.labelMenu2.text = " \(selectedText) \n index: \(index)"
                }
            }
       // drop.frame = CGRect(x: 110, y: 140, width: 200, height: 30)
       // tabbar.layer.cornerRadius = 5
      //  tabbar.layer.shadowOffset = CGSize(width: 0, height: 0)
       // tabbar.layer.shadowOpacity = 0
    }*/
        // The list of array to display. Can be changed dynamically
            
        //Its Id Values and its optional
       // drop.optionIds = [1,23,54,22]

        // Image Array its optional
        
        // The the Closure returns Selected Index and String
       
       // UIDesign()
        //carTableView.delegate = self
        //carTableView.dataSource = self
    }
   
    @IBAction func gogo(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let secondVc = storyboard.instantiateViewController(withIdentifier: "FonctVC") as! FonctVC
        secondVc.modalPresentationStyle = .fullScreen
          present(secondVc, animated: true, completion: nil)
    }
    
    @IBAction func backk(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension CarsVC : UICollectionViewDataSource {
    

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return  ECUArray.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let car = ECUArray[indexPath.row]
    let cell = carCollectionView.dequeueReusableCell(withReuseIdentifier: "CarCell", for: indexPath) as! CarCell
    
   
    cell.nom.text = car.ECUName
    while cpt < 10 {
    if let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/diagnostic-108a9.appspot.com/o/ecu\(cpt).png?alt=media&token=854cf368-c784-40ec-9aee-19bcd494f5cf") {
        // show a loader here if needed
        cell.logo.load(url: url)
        cpt+=1
        return cell
    }
    }
   
    return cell
    
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = carCollectionView.cellForItem(at: indexPath) as! CarCell
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



extension CarsVC: UICollectionViewDelegateFlowLayout {

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let yourWidth = collectionView.bounds.width/2.5
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
