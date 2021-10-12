//
//  ConverterViewController.swift
//  Currency
//
//  Created by Mina Hany on 5/23/21.
//

import UIKit
import CoreData
import Foundation
//import Reachability
//import a
class ConverterViewController: UIViewController  {
    var dPrice : Double = 0.0
    var tPrice : Double = 0.0
    var rPrice : Double = 0.0
    var ePrice : Double = 0.0
    var mMoney : Double = 100.0
    var selectedCurr : String?
    private var data: CurrencyModel?{
        didSet{
            DispatchQueue.main.async {
                self.convertsTableView.reloadData()
            }
            
        }
    }
    var currencies : [Currency] = []
    var arrCurrency: [Currency] = []{
        didSet{
            DispatchQueue.main.async {
                self.convertsTableView.reloadData()
            }
        }
    }
    @IBOutlet weak var currenciesCollectionView: UICollectionView!
    @IBOutlet weak var convertsTableView: UITableView!
    @IBOutlet weak var valueTF: UITextField!
    @IBOutlet weak var convertBtn: UIButton!
    var delegate : SendCoreData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setUpUI()
//        deleteSavedCurrencies()
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
    
    @IBAction func convertActionbtn(_ sender: Any) {
        if (valueTF.text != nil){
            getDataFromStorage(id: Int(valueTF.text ?? "") ?? 0)
          
            print(arrCurrency)
            calc()
            self.convertsTableView.reloadData()
            print(currencies)
        }
        
    }
    
    //MARK:- API Call When Connected
    private func fetchData(){
        NetworkLayer.shared.getResults(clientRequest: .getCurriencyPrice(), decodingModel: CurrencyModel.self) { [weak self] (response) in
            switch response{
            case .success(let data):
                self?.data = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    //MARK:- Core Data Methods
    
    private func getDataFromStorage(id: Int){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CurrencyCD")
            do{
                
                let stored = try managedContext.fetch(fetchRequest)
                if stored.count > 0 {
                    for curr in stored {
                        let localCurr = Currency(id:  curr.value(forKey: "id") as? Int, option1: curr.value(forKey: "option1") as? String, option2: curr.value(forKey: "option2") as? String, option3: curr.value(forKey: "option3") as? String, last_sell: curr.value(forKey: "last_sell") as? String, last_buy: curr.value(forKey: "last_buy") as? String, relative:  curr.value(forKey: "relative") as? String, type:  curr.value(forKey: "type") as? String, country:  curr.value(forKey: "country") as? String, state:  curr.value(forKey: "state") as? Int, created_at:  curr.value(forKey: "created_at") as? String, updated_at:  curr.value(forKey: "updated_at") as? String)
                        
                        if localCurr.id ==  65 || localCurr.id == 162  || localCurr.id == 103 || localCurr.id == 143
                        {
                            arrCurrency.append(localCurr)
                       
                        }
                        
                    }
                var curr = Currency.init(id: 2, option1: "1", option2: "دولار", option3: "1", last_sell: "", last_buy: "", relative: "", type: "Dollar", country: "عالمي", state: 5, created_at: "", updated_at: "")
            
                    arrCurrency.append(curr)
                    print(arrCurrency)
                check(id: id)
                }
            }catch let error as NSError{
                print(error)
            }
                
        }
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    func deleteSavedCurrencies(){
        let context = getContext()
        var fetchRequest: NSFetchRequest<CurrencyCD> = CurrencyCD.fetchRequest()
        let objects = try! context.fetch(fetchRequest)
        print(objects)
        for obj in objects {
            
            context.delete(obj)
        }
        
        do {
            try context.save()
            print(fetchRequest)
            print(objects)
            // <- remember to put this :)
        } catch {
            // Do something... fatalerror
        }
        
        
        
    }
    func check(id: Int)  {
        
        for i in 0...arrCurrency.count {
            
//            if arrCurrency[i].id == id {
//                self.arrCurrency.remove(at: i)
//            self.convertsTableView.reloadData()
//            }
        }
        print("asdasdasdasd")
        print(arrCurrency)
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
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: currenciesCollectionView.frame.width/3, height: currenciesCollectionView.frame.height - 16)
        
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConverterCollectionViewCell", for: indexPath) as! ConverterCollectionViewCell
        cell.fillData(index: indexPath.row)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let cell = currenciesCollectionView.cellForItem(at: indexPath) as? ConverterCollectionViewCell
        cell?.color()
        selectedCurr = cell?.currencyLBL.text
        print(selectedCurr ?? "")
//        collectionView.deselectItem(at: indexPath, animated: true)
           
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = currenciesCollectionView.cellForItem(at: indexPath) as? ConverterCollectionViewCell
        cell!.unColor()
    }
    

    
}
//MARK:- TableView Delegate , TableView DataSource
extension ConverterViewController : UITableViewDelegate,UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConverterTableViewCell", for: indexPath) as! ConverterTableViewCell
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .white
        }else{
            cell.backgroundColor = .systemGray6
        }
        var cuur = currencies[indexPath.row]
        if( valueTF.text != "0"){
//            cell.priceLBL.text = cuur.option1
//            cell.titleLBL.text = cuur.option2
            var x : Double = 0.0
//            var xD : Double = 0.0
//            var xR : Double = 0.0
//            var xL : Double = 0.0
//            var xE : Double = 0.0
            let value : Double = Double(valueTF.text ?? "0.0") ?? 0.0
            let valueCurr : Double = Double(cuur.option1 ?? "0.0") ?? 0.0
            
            print(value , valueCurr)
                        switch selectedCurr ?? "" {
            case "EURO":
                for cur in arrCurrency{
                    if cur.id ?? 0 == 65{
                        for cuur in arrCurrency{
                            if cuur.id ?? 0 == 65{
                                let valueCr : Double = Double(cuur.option1 ?? "0.0") ?? 0.0
                                x = value * valueCr
                            
                            }
                        }
                   
                    }
                }
                let  tot : Double = x / valueCurr
             
                cell.priceLBL.text = "\(tot.rounded(toPlaces: 4))"
                cell.titleLBL.text = cuur.option2
            case "LebanonLira":
                for cur in arrCurrency{
                    if cur.id ?? 0 == 103{
                        for cuur in arrCurrency{
                            if cuur.id ?? 0 == 103{
                                let valueCr : Double = Double(cuur.option1 ?? "0.0") ?? 0.0
                                x = value * valueCr
                            
                            }
                        }
                    }
                }
                let  tot : Double = x / valueCurr
                cell.priceLBL.text = "\(tot.rounded(toPlaces: 4))"
                cell.titleLBL.text = cuur.option2
            case "TRY":
                for cur in arrCurrency{
                    if cur.id ?? 0 == 162{
                        for cuur in arrCurrency{
                            if cuur.id ?? 0 == 162{
                                let valueCr : Double = Double(cuur.option1 ?? "0.0") ?? 0.0
                                x = value * valueCr
                            
                            }
                        }
                    }
                }
                let  tot : Double = x / valueCurr
                cell.priceLBL.text = "\(tot.rounded(toPlaces: 4))"
                cell.titleLBL.text = cuur.option2
                
            case "REL":
                for cur in arrCurrency{
                    if cur.id ?? 0 == 143{
                        for cuur in arrCurrency{
                            if cuur.id ?? 0 == 143{
                                let valueCr : Double = Double(cuur.option1 ?? "0.0") ?? 0.0
                                x = value * valueCr
                            
                            }
                        }
                    }
                }
                var tot : Double = x / valueCurr
                cell.priceLBL.text = "\(tot.rounded(toPlaces: 4))"
                cell.titleLBL.text = cuur.option2
//                print(x , val)
            default:
//                for cuur in arrCurrency{
//                    if cuur.id ?? 0 == 2{
//                        for cuur in arrCurrency{
//                            if cuur.id ?? 0 == 2{
//
//                        var valueC : Double = Double(cuur.option1 ?? "0.0" ) ?? 0.0
//                        x = value * valueC
//                            }
//
//                        }
//                    }
//                }
                let total : Double = value * valueCurr
                cell.priceLBL.text =  "\(total.rounded(toPlaces: 4))"
                cell.titleLBL.text = cuur.option2
              
              
            }

        }else{
            
            
            cell.priceLBL.text = "0"
            cell.titleLBL.text = "0"
        }
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
    
    func calc(){
        currencies = []
        self.convertsTableView.reloadData()
        if selectedCurr ?? "" == "EURO"{
            for cur in arrCurrency {
                if cur.id ?? 0 != 65{
                    currencies.append(cur)
                }
            }
        }
        if selectedCurr ?? "" == "Dollar"{
            for cur in arrCurrency {
                if cur.id ?? 0 != 2{
                    currencies.append(cur)
                }
            }
        }
        if selectedCurr ?? "" == "REL"{
            for cur in arrCurrency {
                if cur.id ?? 0 != 143{
                    currencies.append(cur)
                }
            }
        }
        if selectedCurr ?? "" == "TRY"{
            for cur in arrCurrency {
                if cur.id ?? 0 != 162{
                    currencies.append(cur)
                }
            }
        }
        if selectedCurr ?? "" == "LebanonLira"{
            for cur in arrCurrency {
                if cur.id ?? 0 != 103{
                    currencies.append(cur)
                }
            }
        }
        self.convertsTableView.reloadData()
    }
   
  
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
