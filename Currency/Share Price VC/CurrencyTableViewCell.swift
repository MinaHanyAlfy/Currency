//
//  CurrencyTableViewCell.swift
//  Currency
//
//  Created by Mina Hany on 6/2/21.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32 , height: collectionView.frame.height - 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = currencyCollectionView.dequeueReusableCell(withReuseIdentifier: "Buy&SellCollectionViewCell", for: indexPath) as! Buy_SellCollectionViewCell
        cell.titleLBL.text = data?.data[indexPath.row].type
        cell.buyLBL.text = "Buy"
     cell.sellLBL.text = "Sell"
        cell.buyNumberLBL.text = data?.data[indexPath.row].option2
        cell.sellNumberLBL.text = data?.data[indexPath.row].option1
        cell.arrowImageView.image = UIImage(systemName: "arrow.up.forward.app")
        cell.ratioLBL.text = data?.data[indexPath.row].relative
        cell.mainView.clipsToBounds = true
        cell.mainView.layer.borderColor = UIColor.systemGray4.cgColor
        cell.mainView.layer.cornerRadius = 8
        cell.mainView.layer.borderWidth = 1
        return cell
    }
    
    @IBOutlet weak var currencyCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        currencyCollectionView.delegate = self
        currencyCollectionView.dataSource = self
        register()
        fetchData()
    }
    func register(){
        currencyCollectionView.register(UINib(nibName: "Buy&SellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Buy&SellCollectionViewCell")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    var data : CurrencyModel?{
        didSet{
            DispatchQueue.main.async {
                self.currencyCollectionView.reloadData()
            }
        }
    }
    private func fetchData(){
        NetworkLayer.shared.getResults(clientRequest: .getDefault(), decodingModel: CurrencyModel.self) { [weak self] (response) in
            switch response{
            case .success(let data):
                self?.data = data
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
