//
//  ConverterViewController.swift
//  Currency
//
//  Created by Mina Hany on 5/23/21.
//

import UIKit
import CoreData
import Foundation




class ConverterViewController: UIViewController {
    
    @IBOutlet weak var currenciesCollectionView: UICollectionView!
    @IBOutlet weak var convertsTableView: UITableView!
    @IBOutlet weak var valueTF: UITextField!
    @IBOutlet weak var convertBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setUpUI()
    }
    private func registerCells(){
        currenciesCollectionView.register(UINib(nibName: "ConverterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ConverterCollectionViewCell")
        convertsTableView.register(UINib(nibName: "ConverterTableViewCell", bundle: nil), forCellReuseIdentifier: "ConverterTableViewCell")
    }
    private func setUpUI(){
        valueTF.clipsToBounds = true
        convertBtn.clipsToBounds = true
        valueTF.layer.cornerRadius = 10
        convertBtn.layer.cornerRadius = 10
        convertsTableView.clipsToBounds = true
        convertsTableView.layer.cornerRadius = 10
        valueTF.layer.borderWidth = 1
        valueTF.layer.borderColor = UIColor.systemGray6.cgColor
        convertsTableView.layer.borderWidth = 2
        convertsTableView.layer.borderColor = UIColor.white.cgColor
        
    }
    private(set) var storedCurrencies = [CurrencyCD]()
    
    
    //MARK:- Core Data Methods
    
    private func getDataFromStorage(){
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequest : NSFetchRequest<CurrencyCD> = CurrencyCD.fetchRequest()
            do{
                storedCurrencies = try managedContext.fetch(fetchRequest)
            }catch let error as NSError{
                print(error)
            }
        }
    }
    //Add
//    func addCurrencyToStorage(_ currency: Currency){
//        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
//            let managedContext = appDelegate.persistentContainer.viewContext
//            
//            if currency.type != nil,!(isCurrencyFound(with: currency.id) ?? true){
//                let newCurrency = CurrencyCD(context: managedContext)
//                newCurrency.title = currency.relative
//                newCurrency.value = currency.last_sell
//                
//                storedCurrencies += [newCurrency]
//                
//                do{
//                    try managedContext.save()
//                    print("<<<<< SAVED")
//                }catch let error as NSError{
//                    print(error)
//                }
//            }
//        }
//    }
//    
    
    //Delete
    func deleteFromStorage(at index:Int ){
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            let managedContext = appDelegate.persistentContainer.viewContext
            managedContext.delete(storedCurrencies[index])
            storedCurrencies.remove(at: index)
            do{
                try managedContext.save();
                print("item Deleted")
            }catch let error as NSError{
                print(error);
            }
        }
    }
    //
    
    private func isCurrencyFound(with currencyID : Int?)->Bool?{
        guard let id = currencyID else{
            return nil
        }
        if storedCurrencies.count == 0{
            ()
        }
        for curr in storedCurrencies{
            if(curr.id == id){
                return true
            }
        }
        return false
    }
    
    
}

//MARK:- UICollectionView Delegate , CollectionView DataSource

extension ConverterViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    //    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: currenciesCollectionView.frame.width/3, height: currenciesCollectionView.frame.height - 16)
        
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConverterCollectionViewCell", for: indexPath) as! ConverterCollectionViewCell
        cell.fillData(index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = currenciesCollectionView.cellForItem(at: indexPath) as? ConverterCollectionViewCell
        {
            cell.currencyLBL.backgroundColor = .orange
            cell.currencyLBL.textColor = .white
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.item
        print(index)
    }
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = currenciesCollectionView.cellForItem(at: indexPath) as? ConverterCollectionViewCell
        {
            cell.currencyLBL.backgroundColor = .white
            
            cell.currencyLBL.textColor = .black
            
        }
    }
    
    
    
    
    
}
//MARK:- TableView Delegate , TableView DataSource
extension ConverterViewController : UITableViewDelegate,UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConverterTableViewCell", for: indexPath) as! ConverterTableViewCell
        cell.fillData(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(tableView.frame.height / 5  )
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: convertsTableView.frame.width, height: convertsTableView.frame.height / 5 - 16))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width , height: headerView.frame.height )
        label.text = "Results"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .orange
        headerView.addSubview(label)
        
        return headerView
    }
    
    
    
    
}
