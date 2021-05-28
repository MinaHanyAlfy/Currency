//
//  ConverterCollectionViewCell.swift
//  Currency
//
//  Created by Mina Hany on 5/23/21.
//

import UIKit

class ConverterCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpUi()
        
    }
    let arr : [String] = ["REL","EURO","TRY","LebanonLira","Dollar"]
    @IBOutlet weak var currencyLBL: UILabel!
    @IBOutlet weak var mainView: UILabel!
    private func setUpUi(){
        mainView.clipsToBounds = true
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.systemBlue.cgColor
        currencyLBL.backgroundColor = UIColor.white
        currencyLBL.textColor = UIColor.black
        mainView.layer.cornerRadius = 10
    
    }
    func fillData(index:Int){
        currencyLBL.text = arr[index]
        
    }
    func selected() {
        currencyLBL.textColor = UIColor.white
        currencyLBL.backgroundColor = UIColor.orange
        mainView.layer.borderWidth = 0
    }
    func
    unSelected() {
        currencyLBL.textColor = UIColor.black
        currencyLBL.backgroundColor = UIColor.white
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.systemBlue.cgColor
    }
}
