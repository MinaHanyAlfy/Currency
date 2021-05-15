//
//  DollarCollectionViewCell.swift
//  Currency
//
//  Created by Mina Hany on 4/8/21.
//

import UIKit

class DollarCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
        
    }
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var codeLBL: UILabel!
    
    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var priceLBL: UILabel!
    private func setUp(){
        mainView.layer.borderColor = UIColor.systemGray4.cgColor
        mainView.layer.borderWidth = 1
        
        
        
        
        
    }
}
