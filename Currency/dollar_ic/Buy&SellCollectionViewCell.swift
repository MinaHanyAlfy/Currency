//
//  Buy&SellCollectionViewCell.swift
//  Currency
//
//  Created by Mina Hany on 5/14/21.
//

import UIKit

class Buy_SellCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var buyLBL: UILabel!
    @IBOutlet weak var sellLBL: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var ratioLBL: UILabel!
    @IBOutlet weak var buyNumberLBL: UILabel!
    @IBOutlet weak var sellNumberLBL: UILabel!
}
