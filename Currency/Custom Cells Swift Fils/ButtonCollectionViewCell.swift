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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
        // Initialization code
    }
    //   @IBOutlet weak var tabButton: UIButton!
    var buttonArray = ["Dollar","Currencies","Gold"]
    
    func fillData(index:Int){
        titleLabel.text = (buttonArray[index])
        //  tabButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    }
    var  border = CALayer()
    var width = CGFloat(2.0)
    func setUp()
    {
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: titleLabel.frame.size.height - width, width: titleLabel.frame.size.width, height: titleLabel.frame.size.height)
        border.borderWidth = width
        titleLabel.layoutSublayers(of: border)
        titleLabel.layer.masksToBounds = true
        titleLabel.textColor = UIColor.white
        titleLabel.backgroundColor = UIColor.systemOrange
        // if titleLabel.isFocused {
        //   titleLabel.isHighlighted = true
        //}
        titleLabel.alpha = 0.5
        if titleLabel.isFocused {
            titleLabel.alpha = 1
        }
    }
    //@objc func actionButton (sender: UIButton!){
    //  print("Button tapped")
    //refresh View Controller and Disable Exchanger and share price
    // }
    
}
