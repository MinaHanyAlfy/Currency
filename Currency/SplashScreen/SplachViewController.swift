//
//  SplachViewController.swift
//  Currency
//
//  Created by John Doe on 2021-09-26.
//

import UIKit
import SwiftyGif
import CoreData
import Alamofire
import Reachability
@available(iOS 13.0, *)
class SplachViewController: UIViewController,SwiftyGifDelegate {
   
    public var currArr = [Currency]()
    var internationalData: CurrencyModel?{
        didSet{
            print(internationalData)
        }
    }
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    var delegate : SendCoreData?
    override func viewDidLoad() {
        super.viewDidLoad()
//        let reachability = try! Reachability()
//        if let check = NetworkReachabilityManager()?.isReachable,check{
//            DispatchQueue.main.async {
//                self.fetchCurrencyData()
//                print("Success ")
//                print(self.internationalData)
//            }
//        }
        self.gifImageView.delegate = self
        do {
            let gif = try UIImage(gifName: "dollar.gif")
            
            self.gifImageView.setGifImage(gif, loopCount: 2)
        } catch {
            print(error)
        }
        // Do any additional setup after loading the view.
    }
    func gifURLDidFinish(sender: UIImageView) {
        print("gifURLDidFinish")
    }
    
    func gifURLDidFail(sender: UIImageView) {
        print("gifURLDidFail")
    }
    
    func gifDidStart(sender: UIImageView) {
        print("gifDidStart")
    }
    
    func gifDidLoop(sender: UIImageView) {
        print("gifDidLoop")
        DispatchQueue.main.async {
            let reachability = try! Reachability()
                   if let check = NetworkReachabilityManager()?.isReachable,check{
            self.fetchCurrencyData()
            print("Success ")
            print(self.internationalData)
//                    self.delegate?.fetchSavedGas(gas: <#T##Gas#>)
        }
       
               }
    }
    
    func gifDidStop(sender: UIImageView) {
        print("gifDidStop")
        //        let vc =   self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        ////        self.navigationController?.pushViewController(vc, animated: true)
        //                self.present(vc, animated: false, completion: nil)
        //        presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "NavigationControllerID")
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
        //               show(secondVC, sender: self)
    }
    
}
extension SplachViewController {
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
    func getCurrencies(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CurrencyCD")
        
        do {
            let currencies = try managedContext.fetch(fetchRequest)
            if currencies.count > 0 {
                for currency in currencies {
                    var objectCurr = Currency(id: currency.value(forKey: "id") as? Int, option1:  currency.value(forKey: "option1") as? String, option2:  currency.value(forKey: "option2") as? String, option3:  currency.value(forKey: "option3") as? String, last_sell:  currency.value(forKey: "last_sell") as? String, last_buy:  currency.value(forKey: "last_buy") as? String, relative:  currency.value(forKey: "relative") as? String, type:  currency.value(forKey: "type") as? String, country:  currency.value(forKey: "country") as? String, state:  currency.value(forKey: "state") as? Int, created_at:  currency.value(forKey: "created_at") as? String, updated_at:  currency.value(forKey: "updated_at") as? String)
                    
               currArr.append(objectCurr)
                }
            }
            
        }
        catch let error as NSError {
            print(error)
            print("error core data")
        }
    }
    
    func addCurrencyToStorage(_ currency: CurrencyModel){
        deleteSavedCurrencies()
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            let managedContext = appDelegate.persistentContainer.viewContext
            
            print("Core Data \(currency)")
            for curr in currency.data {
                
                let newCurrency = CurrencyCD(context: managedContext)
                newCurrency.id = (curr.id as? Int64)!
                newCurrency.option1 = curr.option1
                newCurrency.option2 = curr.option2
                newCurrency.option3 = curr.option3
                newCurrency.last_buy = curr.last_buy
                newCurrency.last_sell = curr.last_sell
                newCurrency.relative = curr.option1
                newCurrency.created_at = curr.created_at
                newCurrency.updated_at = curr.updated_at
                newCurrency.type = curr.type
                newCurrency.state = curr.state as! Int64
                
                //                storedCurrencies += [newCurrency]
                
                do{
                    try managedContext.save()
                    print("<<<<< SAVED")
                }catch let error as NSError{
                    print(error)
                }
            }
        }
    }
    
}
//Fetch Data
extension SplachViewController{
    public func fetchCurrencyData(){
        NetworkLayer.shared.getResults(clientRequest: .getInternationalPrice(), decodingModel: CurrencyModel.self) { [weak self] (response) in
            switch response{
            case .success(let data):
                DispatchQueue.main.async {
                    self?.internationalData = data
                }
               
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
protocol SendCoreData {
    func fetchSavedInternational(currencyInternational: Currency)
    func fetchSavedGas(gas: Gas)
    func fetchSavedLocalCurrency(currencyLocal: Currency)
    
}


