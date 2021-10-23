//
//  DollarCollectionViewCell.swift
//  Currency
//
//  Created by Mina Hany on 4/8/21.
//

import UIKit

@available(iOS 13.0, *)
class DollarCollectionViewCell: UICollectionViewCell {
    
    private var data :CurrencyModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
        fetchData(clientRequest: .getInternationalPrice())
    }
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var codeLBL: UILabel!
    
    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var priceLBL: UILabel!
    private func setUp(){
        mainView.layer.borderColor = UIColor.systemGray4.cgColor
        mainView.layer.borderWidth = 1
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOpacity = 1
        mainView.layer.shadowOffset = .zero
        mainView.layer.shadowRadius = 10
    }
    
 
    private func fetchData(clientRequest: Curriencies){
        NetworkLayer.shared.getResults(clientRequest: clientRequest, decodingModel: CurrencyModel.self) { [weak self] (response) in
            switch response{
            case .success(let data):
                self?.data = data
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
