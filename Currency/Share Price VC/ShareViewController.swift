//
//  ShareViewController.swift
//  Currency
//
//  Created by Mina Hany on 5/19/21.
//

import UIKit

class ShareViewController: UIViewController {
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    
    @IBOutlet weak var screenShareCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setUPBtnUI()
        fetchData(clientRequest: .getDefault())
        
        // Do any additional setup after loading the view.
    }
    var data : CurrencyModel?{
        didSet{
            DispatchQueue.main.async {
                self.screenShareCollectionView.reloadData()
            }
        }
    }
    func setUPBtnUI(){
        closeBtn.layer.cornerRadius = 10
        closeBtn.clipsToBounds = true
        shareBtn.layer.cornerRadius = 10
        shareBtn.clipsToBounds = true
    }
    @IBAction func closeActionBtn(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareActionBtn(_ sender: Any) {
        let activityViewController = UIActivityViewController(activityItems: screenShareCollectionView.visibleCells, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.postToFacebook,UIActivity.ActivityType.postToTwitter,UIActivity.ActivityType.saveToCameraRoll,UIActivity.ActivityType.mail,UIActivity.ActivityType.airDrop]
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    // MARK: - Register Cells
    
    private func registerCells(){
        screenShareCollectionView.register(UINib(nibName: "Buy&SellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Buy&SellCollectionViewCell")
        
        screenShareCollectionView.register(UINib(nibName: "ExchangersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ExchangersCollectionViewCell")
        screenShareCollectionView.register(UINib(nibName: "LBLCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LBLCustomCollectionViewCell")
        
    }
    //MARK :- FetchData
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
//MARK:- CollectionViewDelegate , CollectionViewDataSource , CollectionViewDelegateFlowLayout
extension ShareViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //  switch section.tag {
        //case <#pattern#>:
        //  <#code#>
        // default:
        //<#code#>
        return 1
        //}
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
        
    }
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    ////        switch cell {
    ////        case <#pattern#>:
    ////            <#code#>
    ////        default:
    ////            <#code#>
    ////        }
    //    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = screenShareCollectionView.dequeueReusableCell(withReuseIdentifier: "LBLCustomCollectionViewCell", for: indexPath) as! LBLCustomCollectionViewCell
            cell.dateImageView.text = "Date Now"
            return cell
            
        case 1:
            let buyCell = screenShareCollectionView.dequeueReusableCell(withReuseIdentifier: "Buy&SellCollectionViewCell", for: indexPath) as! Buy_SellCollectionViewCell
            buyCell.titleLBL.text = data?.data[indexPath.row].type
            buyCell.buyLBL.text = "Buy"
            buyCell.sellLBL.text = "Sell"
            buyCell.buyNumberLBL.text = data?.data[indexPath.row].option2
            buyCell.sellNumberLBL.text = data?.data[indexPath.row].option1
            buyCell.arrowImageView.image = UIImage(systemName: "arrow.up.forward.app")
            buyCell.ratioLBL.text = data?.data[indexPath.row].relative
            
            return buyCell
            
        default:
            let exchangerCell =     screenShareCollectionView.dequeueReusableCell(withReuseIdentifier: "ExchangersCollectionViewCell", for: indexPath) as! ExchangersCollectionViewCell
            exchangerCell.fillData(index: indexPath.row)
            return exchangerCell
            
        }
        
        
        
        
    }
    
    
}




