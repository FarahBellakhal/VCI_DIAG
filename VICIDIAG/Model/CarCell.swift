//
//  CarCell.swift



import UIKit

//protocol chooseCar: AnyObject {
   // func addCar(cell: CarCell)
   // func removeCar(cell: CarCell)
//


class CarCell: UICollectionViewCell {

    //MARK: - IBOutlets
    
    @IBOutlet weak var btn: UIButton!
    
  
    @IBOutlet weak var logo: UIImageView!
    
   
    @IBOutlet weak var nom: UILabel!
    // weak var delegate: chooseCar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
}


