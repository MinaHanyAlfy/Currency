//
//  ExchangerTableViewCell.swift
//  Currency
//
//  Created by Mina Hany on 6/2/21.
//

import UIKit

@available(iOS 13.0, *)
class ExchangerTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    var titleArray = ["المركزي","الصرافيين"]
    var pricearray = ["1507.5","3900"]
    var imageArray = ["building.2.fill","house.fill"]
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = exchangerCollectionView.dequeueReusableCell(withReuseIdentifier: "ExchangersCollectionViewCell", for: indexPath) as! ExchangersCollectionViewCell
        cell.titleImageView.image = UIImage(systemName: imageArray[indexPath.row])
        cell.titleOfiicialLBL.text = titleArray[indexPath.row]
        cell.priceLBL.text = pricearray[indexPath.row]
        cell.mainView.clipsToBounds = true
        cell.mainView.layer.borderWidth = 1
        cell.mainView.layer.borderColor = UIColor.systemGray4.cgColor
        cell.mainView.layer.cornerRadius = 8
        return cell
    }
    func register()  {
        exchangerCollectionView.register(UINib(nibName: "ExchangersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ExchangersCollectionViewCell")
    }
    
    @IBOutlet weak var exchangerCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        exchangerCollectionView.delegate = self
        exchangerCollectionView.dataSource = self
        register()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 8, height: collectionView.frame.height - 32)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 4, bottom: 16, right: 4)
    }
    
}
