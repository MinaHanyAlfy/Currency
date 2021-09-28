////
////  CoreDataLayer.swift
////  Currency
////
////  Created by Mina Hany on 5/28/21.
////
//
//
import Foundation
import UIKit
import CoreData

//
@available(iOS 13.0, *)
@available(iOS 13.0, *)
class CoreDataLayer {
    private(set) var storedCurrencies = [CurrencyCD]()
    
    private static var coreDataObj = CoreDataLayer()
    static var shared : CoreDataLayer {
        get{
            coreDataObj.getDataFromStorage()
            return coreDataObj
        }
    }
    //
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
    
    var i = 0
    func addCurrencyToStorage(_ currency: CurrencyModel){
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            let managedContext = appDelegate.persistentContainer.viewContext
            i = 0
            print("Core Data \(currency)")
            for curr in currency.data {
                if currency.data[i].relative != nil,!(isCurrencyFound(with: currency.data[i].id as? Int64) ?? true){
                let newCurrency = CurrencyCD(context: managedContext)
                newCurrency.id = (currency.data[i].id as? Int64)!
                newCurrency.option1 = currency.data[i].option1
                newCurrency.option2 = currency.data[i].option2
                newCurrency.option3 = currency.data[i].option3
                newCurrency.last_buy = currency.data[i].last_buy
                newCurrency.last_sell = currency.data[i].last_sell
                newCurrency.relative = currency.data[i].option1
                newCurrency.created_at = currency.data[i].created_at
                newCurrency.updated_at = currency.data[i].updated_at
                newCurrency.type = currency.data[i].type
                newCurrency.state = currency.data[i].state as! Int64
                
                storedCurrencies += [newCurrency]
                i += 1
            }
                do{
                    try managedContext.save()
                    print("<<<<< SAVED")
                }catch let error as NSError{
                    print(error)
                }
            }
        }
    }
    
    private func isCurrencyFound(with currencyID : Int64?)->Bool?{
        guard let id = currencyID else{
            return nil
        }
        if storedCurrencies.count == 0{
            getDataFromStorage()
        }
        for currency in storedCurrencies{
            if(currency.id == id){
                return true
            }
        }
        return false
    }
    //
    
    
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
    
    
}
//
