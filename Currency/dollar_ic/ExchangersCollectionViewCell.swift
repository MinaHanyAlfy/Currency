//
//  ExchangersCollectionViewCell.swift
//  Currency
//
//  Created by Mina Hany on 5/14/21.
//

import UIKit

class ExchangersCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
        // Initialization code
    }

    @IBOutlet weak var titleOfiicialLBL: UILabel!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var priceLBL: UILabel!
    func setUpUI()  {
        mainView.layer.cornerRadius = 10
        mainView.clipsToBounds = true
        mainView.layer.shadowRadius = 10
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOffset = .zero
        mainView.layer.shadowOpacity = 1
    }
}
