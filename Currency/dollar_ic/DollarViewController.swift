//
//  DollarViewController.swift
//  Currency
//
//  Created by Mina Hany on 4/8/21.
//

import UIKit

class DollarViewController: UIViewController {
    
    @IBOutlet weak var buySellCollectionView: UICollectionView!
    @IBOutlet weak var exchangerCollectionView: UICollectionView!
    
    @IBOutlet weak var dollarCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
        // Do any additional setup after loading the view.
        
    }
    
    private func registerCells(){
        dollarCollectionView.register(UINib(nibName: "DollarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DollarCollectionViewCell")
        buySellCollectionView.register(UINib(nibName: "Buy&SellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Buy&SellCollectionViewCell")
        exchangerCollectionView.register(UINib(nibName: "ExchangersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ExchangersCollectionViewCell")
    }
}

//MARK:- UICollectionViewDelegate , UICollectionViewDelegateFlowLayout , UICollectionViewDataSource
extension DollarViewController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case dollarCollectionView:
            return 4
        default:
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case dollarCollectionView:
            let cell = dollarCollectionView.dequeueReusableCell(withReuseIdentifier: "DollarCollectionViewCell", for: indexPath) as! DollarCollectionViewCell
            
            cell.nameLBL.text = "Gold"
            cell.codeLBL.text = "1001"
            cell.priceLBL.text = "123000"
            return cell
            
        case buySellCollectionView:
            let cell = buySellCollectionView.dequeueReusableCell(withReuseIdentifier: "Buy&SellCollectionViewCell", for: indexPath) as! Buy_SellCollectionViewCell
            cell.titleLBL.text = "Dollar Lebanion"
            cell.buyLBL.text = "Buy"
            cell.sellLBL.text = "Sell"
            cell.buyNumberLBL.text = "3305"
            cell.sellNumberLBL.text = "3307"
            cell.arrowImageView.image = UIImage(systemName: "arrow.up.forward.app")
            return cell
        default:
            let cell = exchangerCollectionView.dequeueReusableCell(withReuseIdentifier: "ExchangersCollectionViewCell", for: indexPath) as! ExchangersCollectionViewCell
            cell.priceLBL.text = "1700"
            cell.titleOfiicialLBL.text = "Official Price"
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case dollarCollectionView:
            return CGSize(width: dollarCollectionView.frame.width / 1.7
                          , height: dollarCollectionView.frame.height - 16)
        case buySellCollectionView:
            return CGSize(width: collectionView.frame.width
                          , height: collectionView.frame.height/2)
        default:
            return CGSize(width: collectionView.frame.width / 2
                          , height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
