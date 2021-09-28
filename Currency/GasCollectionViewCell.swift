//
//  GasCollectionViewCell.swift
//  Currency
//
//  Created by Mina Hany on 7/12/21.
//

import UIKit

@available(iOS 13.0, *)
class GasCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var gasImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCell()
        // Initialization code
    }
    func setUpCell(){
        mainView.clipsToBounds = true
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.systemGray4.cgColor
        mainView.layer.cornerRadius = mainView.frame.width / 8
        gasImageView.clipsToBounds = true
        gasImageView.layer.cornerRadius = gasImageView.frame.width / 2
        
    }
    

}
