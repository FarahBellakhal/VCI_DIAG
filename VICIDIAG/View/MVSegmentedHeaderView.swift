//
//  MVSegmentedHeaderView.swift
//  Car_Shop
//
//  Created by mac on 19/04/2022.
//


import UIKit

protocol MVHeaderSegmentDelegate {
    func segmentControlChanged(segmentControll: UISegmentedControl, currentIndex: Int)
}

class MVSegmentedHeaderView: UIView {
    
    var delegate: MVHeaderSegmentDelegate? = nil
    var titleLabel = UILabel()
    var pageControl: UISegmentedControl!
    private var segmentItems: [Any] = []
    
    override func draw(_ rect: CGRect) {
        titleLabel.frame = CGRect(x: 0, y: 0, width: frame.width-20, height: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.white
        titleLabel.font = .boldSystemFont(ofSize: 25)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive=true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        /*pageControl = UISegmentedControl(items: segmentItems)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pageControl)
        pageControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive=true
        pageControl.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive=true
        pageControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive=true
        pageControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "Sapphire")], for: UIControl.State.selected)
        pageControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        pageControl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.09843214897)
        pageControl.selectedSegmentTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.801557149)
        pageControl.selectedSegmentIndex = 0
        pageControl.addTarget(self, action: #selector(recurranceChanged(sender:)), for: .valueChanged)
        */
    }
    
    @IBAction private func recurranceChanged(sender: UISegmentedControl) {
        self.delegate?.segmentControlChanged(segmentControll: sender, currentIndex: sender.selectedSegmentIndex)
       

    }
    
    public func setTitle(title: String){
        titleLabel.text = title
    }
    
   // public func setSegmentItems(items: [Any]) -> Void {
     //   self.segmentItems = items
    //}
    
    //public func getSegmentItems() -> [Any] {
      //  return segmentItems
    //}
}
