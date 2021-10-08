//
//  ConverterViewController.swift
//  Currency
//
//  Created by Mina Hany on 5/23/21.
//

import UIKit
import CoreData
import Foundation
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
                        
                        if localCurr.id ==  65 || localCurr.id == 162  || localCurr.id == 163 || localCurr.id == 43
                        {
                            self.arrCurrency.append(localCurr)
                       
                        }
                        
                    }
                var curr = Currency.init(id: 2, option1: "", option2: "دولار", option3: "1", last_sell: "", last_buy: "", relative: "", type: "Dollar", country: "عالمي", state: 5, created_at: "", updated_at: "")
            
                self.arrCurrency.append(curr)
                check(id: id)
                }
            }catch let error as NSError{
                print(error)
            }
                
        }
    
    func check(id: Int)  {
        
        for i in 0...arrCurrency.count {
            
//            if arrCurrency[i].id == id {
//                self.arrCurrency.remove(at: i)
//            }
        }
        print("asdasdasdasd")
        print(arrCurrency)
    }

//    func getQuestions(){
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CurrencyCD")
//        quests = []
//        do {
//            let questions = try managedContext.fetch(fetchRequest)
//            //            let result = questions.last
//            if questions.count > 0 {
//                var questionsRepeat = [Datum]()
//                for question in questions {
//                    var questsw = Datum()
//                    questsw.answerIDS = question.value(forKey: "answer_ids") as? String
//                    questsw.qID = question.value(forKey: "q_id") as? Int
//                    questsw.qQuestionText = question.value(forKey: "q_question_text") as? String
//                    questsw.rates = question.value(forKey: "rates") as? Int
//                    questsw.qRate = question.value(forKey: "q_rate") as? Double
//                    questsw.qTypeID = question.value(forKey: "q_type_id") as? Int
//                    questsw.qtName = question.value(forKey: "qt_name") as? String
//                    questsw.answers = question.value(forKey: "answers") as? String
//                    //                    questsw.allAnswer =
//                    questsw.qgID = question.value(forKey: "qg_id") as? Int
//                    questsw.qgName = question.value(forKey: "qg_name") as? String
//                    questsw.totalAnswers = question.value(forKey: "total_answers") as? Int
//                    quests.append(questsw)
//                    //                    }
//
//                }
//                print("Questions Number\(quests.count)")
//                let questsNew = unique(source: quests)
//                AppDelegate.questionsStored = questsNew
//                print("Questions Number\(questsNew.count)")
//
//                print( AppDelegate.questionsStored)
//                print("asdasdsadsadasd")
//            }
//
//
//        }catch let error as NSError {
//            print(error)
//            print("error core data")
//        }
//    }
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
        return arrCurrency.count
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConverterTableViewCell", for: indexPath) as! ConverterTableViewCell
        
        if( valueTF.text != "0"){
        
//            let value = Double(valueTF.text!)
            cell.priceLBL.text = arrCurrency[indexPath.row].option1
            cell.titleLBL.text = arrCurrency[indexPath.row].option2
//            let secValue = Double(data?.data[indexPath.row].option2 ?? "0.0")
//            print(data?.data[indexPath.row].option2)
//            print(secValue)
//            cell.priceLBL.text = String(value! * secValue!)
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
    
    
   
  
}

