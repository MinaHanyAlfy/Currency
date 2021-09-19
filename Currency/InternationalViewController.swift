//
//  InternationalViewController.swift
//  Currency
//
//  Created by Mina Hany on 7/2/21.
//

import UIKit

class InternationalViewController: UIViewController {
    @IBOutlet weak var internationalCollectionView: UICollectionView!
    
    @IBOutlet weak var adBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        internationalCollectionView.delegate = self
        internationalCollectionView.dataSource = self
        fetchData()
        registerCell()
        // Do any additional setup after loading the view.
    }
    func registerCell()  {
        internationalCollectionView.register(UINib(nibName: "DollarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DollarCollectionViewCell")
    }
    private var internationalData: CurrencyModel?{
        didSet{
            DispatchQueue.main.async {
                self.internationalCollectionView.reloadData()
            }
            
        }
    }
 
}
extension InternationalViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return internationalData?.data.count ?? 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = internationalCollectionView.dequeueReusableCell(withReuseIdentifier: "DollarCollectionViewCell", for: indexPath) as! DollarCollectionViewCell
        cell.nameLBL.text = internationalData?.data[indexPath.row].option2
        cell.codeLBL.text = internationalData?.data[indexPath.row].type
    
        cell.priceLBL.text = internationalData?.data[indexPath.row].option1
        if internationalData?.data[indexPath.row].option3 == "1" {
            cell.priceLBL.textColor = .systemGreen
            
        }else {
            cell.priceLBL.textColor = .systemRed
        }
        return cell
    }
    
    
    
    
    
}
extension InternationalViewController {
    private func fetchData(){
        NetworkLayer.shared.getResults(clientRequest: .getInternationalPrice(), decodingModel: CurrencyModel.self) { [weak self] (response) in
            switch response{
            case .success(let data):
                self?.internationalData = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 4
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 4
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: internationalCollectionView.frame.width / 2 - 16 , height: internationalCollectionView.frame.height / 4)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
            
    }
}
