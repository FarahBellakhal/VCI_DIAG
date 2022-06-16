//
//  ManufacturerCell.swift

import UIKit


class ManufacturerCell: UICollectionViewCell {
    
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var checkmark: UIImageView!
    
    @IBOutlet weak var nomMarqueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func toggleSelected() {

           if (isSelected) {
               self.checkmark.image = UIImage(named: "check-mark")
           }else{
               self.checkmark.image = UIImage(named: "")
   // here you can use uncheck img here i am not using any image for not selected.
           }
       }
}
    extension UIImageView {
        func load(url: URL, onLoadCompletion: ((_ isImageLoaded: Bool) -> Void)? = nil) {
            self.image = nil
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                            onLoadCompletion?(true)
                        }
                    } else {
                        onLoadCompletion?(false)
                    }
                } else {
                    onLoadCompletion?(false)
                }
            }
        }
    }
   

