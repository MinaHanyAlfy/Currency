//
//  ConverterCollectionViewCell.swift
//  Currency
//
//  Created by Mina Hany on 5/23/21.
//

import UIKit

class ConverterCollectionViewCell: UICollectionViewCell {
    override var isSelected: Bool{
        didSet{
            if isSelected == true {
                color()
            }else {
                unColor()
            }
        }
    }
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
    func color(){
        currencyLBL.backgroundColor = .systemOrange
        mainView.tintColor = .white
        currencyLBL.textColor = .white
        mainView.layer.borderWidth = 0
    }
    func unColor(){
        currencyLBL.textColor = UIColor.black
        currencyLBL.backgroundColor = UIColor.white
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.systemBlue.cgColor
    }
    func fillData(index:Int){
        currencyLBL.text = arr[index]
        
    }
    
}
