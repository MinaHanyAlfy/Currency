//
//  ButtonCollectionViewCell.swift
//  Currency
//
//  Created by Mina Hany on 5/15/21.
//

import UIKit
import Accessibility
import MaterialComponents
class ButtonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var tabButton: UIButton!
    var buttonArray = ["Dollar","Currencies","Gold"]
    
    func fillData(index:Int){
        tabButton.setTitle(buttonArray[index], for: .normal)
        tabButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    }
    func setUp()
    {
        tabButton.backgroundColor = UIColor.systemOrange
        
      //
    }
    @objc func actionButton (sender: UIButton!){
        print("Button tapped")
        //refresh View Controller and Disable Exchanger and share price
    }
    
}
