//
//  HomeCollectionViewCell.swift
//  Currency
//
//  Created by IBRAM on 06/05/2021.
//

import UIKit

@available(iOS 13.0, *)
class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLBL: UILabel!
    
    let imageArr = ["chat_icon","dollar_icon","gas_icon","world_icon","converter_icon","news_icon"]
    let titleArr = ["الدردشة","العملات المحلية","المحروقات","الشاشة العالمية","محول العملات","الاخبار"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI(){
        mainView.layer.cornerRadius = 10
        mainView.clipsToBounds = true
        mainView.layer.borderWidth = 0.5
        mainView.layer.borderColor = UIColor.systemGray4.cgColor
        mainView.layer.masksToBounds = false
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOpacity = 0.2
        mainView.layer.shadowOffset = .zero
        mainView.layer.shadowRadius = 5
        mainView.layer.shouldRasterize = true
    }
    
    func fillData(index: Int) {
        cellImage.image = UIImage(named: imageArr[index])
        cellLBL.text = titleArr[index]
    }
    

}
