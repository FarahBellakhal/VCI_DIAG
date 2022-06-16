//
//  ManufacturerVC.swift

import UIKit
import Firebase
import FirebaseStorage
class ManufacturerVC: UIViewController, UICollectionViewDelegate{

    
    
    
    @IBOutlet weak var nextvc: UIButton!
    
    @IBOutlet weak var back: UIButton!
    
    var ref: DatabaseReference?
    var MarqueArray = [Marque] ()
    var reff: StorageReference!
    var imageURL = ""
    var LOGOArray = [UIImage] ()
    var cpt = 1
    var selectedCellIndex:Int?
    //lazy var storage = Storage.storage()
    //MARK: - IBOutlets
   // private var itemsToken: NotificationToken?
    typealias FileCompletionBlock = () -> Void
    var block: FileCompletionBlock?
    
   
    @IBOutlet weak var marqueCollectionView: UICollectionView!{
        didSet {
            marqueCollectionView.dataSource = self
            marqueCollectionView.delegate = self

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Setting shadow for menu (tab bar)
        tabbar.layer.cornerRadius = 5
        tabbar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabbar.layer.shadowOpacity = 0
       
      //  marqueCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: .bottom)
        // Create a reference to the file you want to download
        ref = Database.database().reference().child("marque")
        ref?.observe(.childAdded) {[weak self](snapshot) in
         guard let value = snapshot.value as? [String : Any] else {
                return
            }
            // Download the data, assuming a max size of 1MB (you can change this as necessary)
            
            if let nom = value["nom"] as? String ,let logo = value["logo"] as? String{
                let marque = Marque(brandName: nom,logo : logo)
                self?.MarqueArray.append(marque)
                
            }
            if let row = self?.MarqueArray.count{
                
                let indexPath = IndexPath(item: row-1,section : 0)
                    self?.marqueCollectionView.insertItems(at: [indexPath])
            }
           
            }
        
    }
    
    @IBOutlet weak var tabbar: UIView!
    //@IBAction func diagprecedaction(_ sender: UIButton) {
   //     navigationController?.pushViewController(back, animated: true)
    //}
    //MARK: - IBActions
    
         
    let car = CarsVC(nibName: "CarsVC", bundle: nil)
    
    @IBAction func nextAction(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let secondVc = storyboard.instantiateViewController(withIdentifier: "CarsVC") as! CarsVC
        secondVc.modalPresentationStyle = .fullScreen
          present(secondVc, animated: true, completion: nil)
    }
    @IBAction func payButtonPressed(_ sender: UIButton) {
       /* let myStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let thirdVC = myStoryboard.instantiateViewController(withIdentifier: "PaymentVC") as! PaymentVC
        chosenCars(thirdVC: thirdVC)
        thirdVC.delegate = self
        self.navigationController?.present(thirdVC, animated: true, completion: nil)
   */ }
    
    @IBAction func go(_ sender: UIButton) {
        navigationController?.pushViewController(car, animated: true)
    }
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        removeData()
    }
    
    @IBAction func backaction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
    //MARK: - Functions
var lastIndexActive:IndexPath = [1,0]
    extension ManufacturerVC : UICollectionViewDataSource {
        
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  MarqueArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let marque = MarqueArray[indexPath.row]
        let cell = marqueCollectionView.dequeueReusableCell(withReuseIdentifier: "ManufacturerCell", for: indexPath) as! ManufacturerCell
        
        /*if indexPath.row > 2 {

                    cell.contentView.isHidden = true
                    cell.layer.borderColor = UIColor.white.cgColor

                }*/
    
        cell.nomMarqueLabel.text = marque.brandName
        while cpt < MarqueArray.count + 1 {
        if let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/diagnostic-108a9.appspot.com/o/img\(cpt).png?alt=media&token=854cf368-c784-40ec-9aee-19bcd494f5cf") {
            // show a loader here if needed
            cell.logo.load(url: url)
            cpt+=1
            return cell
        }
        }
        
        return cell
}
        
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    let cell = marqueCollectionView.cellForItem(at: indexPath) as! ManufacturerCell
   // cell.contentView.backgroundColor = .darkGray
    cell.contentView.layer.masksToBounds = true
    if cell.contentView.backgroundColor == .darkGray{
        cell.isMultipleTouchEnabled = false
        cell.contentView.backgroundColor = .white
    }else{
        cell.contentView.backgroundColor = .darkGray
    }
    cell.isMultipleTouchEnabled = false
   /* let cell1 = marqueCollectionView.cellForItem(at: lastIndexActive) as! ManufacturerCell
    cell1.contentView.backgroundColor = .white
    cell1.contentView.layer.masksToBounds = true
    lastIndexActive = indexPath*/
    }

    }

extension ManufacturerVC: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/3.0
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

    
