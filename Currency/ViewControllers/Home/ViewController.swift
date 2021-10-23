//
//  ViewController.swift
//  Currency
//
//  Created by IBRAM on 06/05/2021.
//

import UIKit
import SideMenu
@available(iOS 13.0, *)
class ViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var adView: UIImageView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCell()
    }
    override func viewWillAppear(_ animated: Bool) {
        setupUI()

    }
    private func setupUI(){
        
        self.navigationController?.navigationBar.backgroundColor = .orange
        
        
        headerView.layer.cornerRadius = 10
        headerView.clipsToBounds = true
        headerView.layer.borderWidth = 0.5
        headerView.layer.borderColor = UIColor.systemGray4.cgColor
        adView.layer.borderWidth = 2
        adView.layer.borderColor = UIColor.systemGray4.cgColor
        setUpDesignBar()
        
//        self.navigationController?
    }
    
    func setUpDesignBar(){


        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = .white

        let myimageRight = UIImage(named: "icons8-menu-48")?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: myimageRight, style: .plain, target: self,action: #selector(buttonTappedMenu))
     
    }
    @objc func buttonTappedMenu(){
        let menuVc = SideMenuViewController()
        let menu = SideMenuNavigationController(rootViewController: menuVc)
        present(menu, animated: true, completion: nil)
    }
    private func registerCell(){
        homeCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    
}

@available(iOS 13.0, *)
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.fillData(index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: homeCollectionView.frame.width / 2.1 , height: homeCollectionView.frame.height / 3.2)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView == homeCollectionView else {
            return
        }
        switch indexPath.row {
        
        case 1:
            let vc =   self.storyboard?.instantiateViewController(withIdentifier: "DollarViewController") as! DollarViewController
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
        let vc = GasViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = InternationalViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        
        case 4:
            let convertVC = self.storyboard?.instantiateViewController(identifier: "ConverterViewController") as! ConverterViewController
//            let vc = EmptyViewController()
            self.navigationController?.pushViewController(convertVC, animated: true)
        case 5:
            let vc = NewsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            let vc = ChattViewController()
            self.navigationController?.pushViewController(vc, animated: true)
     
        }
        
    }
    
}

