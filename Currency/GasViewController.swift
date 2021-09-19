//
//  GasViewController.swift
//  Currency
//
//  Created by Mina Hany on 7/12/21.
//

import UIKit
import SDWebImage
class GasViewController: UIViewController {
    @IBOutlet weak var gasTableView: UICollectionView!
    
    @IBOutlet weak var adImageView: UIImageView!
    
    
    private var data: BaseGasModel?{
        didSet{
            DispatchQueue.main.async { [self] in
                self.gasTableView.reloadData()
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        gasTableView.delegate = self
        gasTableView.dataSource = self
        fetchData()
        // Do any additional setup after loading the view.
    }
    func registerCell(){
        gasTableView.register(UINib(nibName: "GasCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GasCollectionViewCell")
        
    }
    private func fetchData(){
        NetworkLayer.shared.getGas( decodingModel: BaseGasModel.self, completed: {
            [weak self] (response) in
            switch response {
            case .success(let data):
                self?.data = data
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    )}
}
extension GasViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.data?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gasTableView.dequeueReusableCell(withReuseIdentifier: "GasCollectionViewCell", for: indexPath) as! GasCollectionViewCell
        let price = data?.data?[indexPath.row].price ?? ""
        let curr = data?.data?[indexPath.row].currency ?? "curr"
        cell.titleLabel.text = data?.data?[indexPath.row].name
        cell.priceLabel.text = String(curr+price)
        cell.gasImageView.sd_setImage(with: URL(string: data?.data?[indexPath.row].img ?? ""), completed: nil)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: gasTableView.frame.width / 2 - 16 , height: gasTableView.frame.height / 3)
    }
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 0
    //    }
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //        return 0
    //    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
    
}
