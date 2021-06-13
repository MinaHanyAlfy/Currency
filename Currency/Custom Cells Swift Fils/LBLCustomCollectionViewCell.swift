//
//  LBLCustomCollectionViewCell.swift
//  Currency
//
//  Created by Mina Hany on 5/19/21.
//

import UIKit

class LBLCustomCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
   let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E,d MMM y"
        let today = Date()
        dateImageView.text = formatter.string(from: today)
        
    }

    @IBOutlet weak var dateImageView: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
}
