//
//  DollarViewController.swift
//  Currency
//
//  Created by Mina Hany on 4/8/21.
//

import UIKit

class DollarViewController: UIViewController {
    
    @IBOutlet weak var bottomConstrainFromBuyCollectionView: NSLayoutConstraint!
    @IBOutlet weak var sharePriceBtn: UIButton!
    @IBOutlet weak var buySellCollectionView: UICollectionView!
    @IBOutlet weak var exchangerCollectionView: UICollectionView!
    @IBOutlet weak var buttonCollectionView: UICollectionView!
    @IBOutlet weak var removeAdsBtn: UIButton!
    
    @IBOutlet weak var dollarCollectionView: UICollectionView!
    
        private var data: CurrencyModel?{
        didSet{
            //print(data)\
            DispatchQueue.main.async {
                self.buySellCollectionView.reloadData()
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setUpUI()
        fetchData(clientRequest: .getDefault())
        // Do any additional setup after loading the view.
        
    }
    
    private func registerCells(){
        dollarCollectionView.register(UINib(nibName: "DollarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DollarCollectionViewCell")
        buySellCollectionView.register(UINib(nibName: "Buy&SellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Buy&SellCollectionViewCell")
        exchangerCollectionView.register(UINib(nibName: "ExchangersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ExchangersCollectionViewCell")
        buttonCollectionView.register(UINib(nibName: "ButtonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ButtonCollectionViewCell")
    }
    
    private func setUpUI(){
        sharePriceBtn.layer.cornerRadius = 10
        removeAdsBtn.layer.cornerRadius = 10
        sharePriceBtn.clipsToBounds = true
        removeAdsBtn.clipsToBounds = true
    }
    
    
}

//MARK:- UICollectionViewDelegate , UICollectionViewDelegateFlowLayout , UICollectionViewDataSource
extension DollarViewController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case dollarCollectionView:
            //return (data?.data.count) ?? 0
            return 4
        case buttonCollectionView:
            return 3
        case buySellCollectionView:
            if data != nil {
                return (data?.data.count) ?? 0
            }
            return 0
        default:
            return 2
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case dollarCollectionView:
            return UIEdgeInsets(top: 32, left: 16, bottom: 32, right: 16)
        case exchangerCollectionView:
            return UIEdgeInsets(top: 2, left: 8, bottom: 8, right: 8)
        case buySellCollectionView:
            return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        default:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
            cell.titleLBL.text = data?.data[indexPath.row].option3
            cell.buyLBL.text = "Buy"
            cell.sellLBL.text = "Sell"
            cell.buyNumberLBL.text = data?.data[indexPath.row].option2
            cell.sellNumberLBL.text = data?.data[indexPath.row].option1
            cell.arrowImageView.image = UIImage(systemName: "arrow.up.forward.app")
            return cell
        case buttonCollectionView:
            let cell = buttonCollectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCollectionViewCell", for: indexPath) as! ButtonCollectionViewCell
            cell.fillData(index: indexPath.row)
            return cell
        default:
            let cell = exchangerCollectionView.dequeueReusableCell(withReuseIdentifier: "ExchangersCollectionViewCell", for: indexPath) as! ExchangersCollectionViewCell
            cell.priceLBL.text = "1700"
            cell.titleOfiicialLBL.text = "Official Price"
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView == buttonCollectionView else {return}
        switch indexPath.row {
        case 0:
            fetchData(clientRequest: .getDefault())
            exchangerCollectionView.isHidden = false
            sharePriceBtn.isHidden = false
//            bottomConstrainFromBuyCollectionView!.isActive = false
            bottomConstrainFromBuyCollectionView.constant = 212
            removeAdsBtn.isHidden = false
        case 1:
            fetchData(clientRequest: .getCurriencyPrice())
            exchangerCollectionView.isHidden = true
            sharePriceBtn.isHidden = true
//            bottomConstrainFromBuyCollectionView!.isActive = true
            bottomConstrainFromBuyCollectionView.constant = 24
            removeAdsBtn.isHidden = true
        default:
            fetchData(clientRequest: .getGoldPrice())
            exchangerCollectionView.isHidden = true
            sharePriceBtn.isHidden = true
//            bottomConstrainFromBuyCollectionView!.isActive = true
            bottomConstrainFromBuyCollectionView.constant = 24
            removeAdsBtn.isHidden = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case dollarCollectionView:
            return CGSize(width: dollarCollectionView.frame.width / 2 - 32
                          , height: dollarCollectionView.frame.height - 32)
        case buySellCollectionView:
            return CGSize(width: collectionView.frame.width - 32
                          , height: collectionView.frame.height/2 - 32  )
        case buttonCollectionView:
            return CGSize(width: collectionView.frame.width/3, height:collectionView.frame.height)
        default:
            return CGSize(width: ((collectionView.frame.width / 2) - 16)
                          , height: collectionView.frame.height - 10)
        }
    }
    
    
    //   // func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        switch collectionView {
    //        case buttonCollectionView:
    //            return 2
    //        default:
    //            return 5
    //        }
    //    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //        switch collectionView {
    //        case buttonCollectionView:
    //            return 2
    //        default:
    //            return 5
    //        }
    //    }
    // MARK:- Call Api To Get Data
    
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

