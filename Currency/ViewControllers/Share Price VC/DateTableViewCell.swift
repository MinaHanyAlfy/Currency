//
//  DateTableViewCell.swift
//  Currency
//
//  Created by Mina Hany on 6/2/21.
//

import UIKit

class DateTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dateCollectionView.dequeueReusableCell(withReuseIdentifier: "LBLCustomCollectionViewCell", for: indexPath) as! LBLCustomCollectionViewCell
        
        return cell
    }
    
    @IBOutlet weak var dateCollectionView: UICollectionView!
    func register() {
        dateCollectionView.register(UINib(nibName: "LBLCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LBLCustomCollectionViewCell")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dateCollectionView.delegate = self
        dateCollectionView.dataSource = self
        register()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: dateCollectionView.frame.width - 16 , height: dateCollectionView.frame.height - 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8 , left: collectionView.frame.width / 2, bottom: 8, right: collectionView.frame.width / 2)
    }
}
