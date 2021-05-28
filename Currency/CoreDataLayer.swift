////
////  CoreDataLayer.swift
////  Currency
////
////  Created by Mina Hany on 5/28/21.
////
//
//
//import Foundation
//import UIKit
//import CoreData
//
//
//class CoreDataLayer {
//    private(set) var storedCurrencies = [Curr]()
//
//    private static var coreDataObj = CoreDataLayer()
//    static var shared : CoreDataLayer {
//        get{
//            coreDataObj.getDataFromStorage()
//            return coreDataObj
//        }
//    }
//    //
//    //MARK:- Core Data Methods
//    private func getDataFromStorage(){
//        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
//            let managedContext = appDelegate.persistentContainer.viewContext
//            let fetchRequest : NSFetchRequest<CurrencyCD> = LeagueCore.fetchRequest()
//            do{
//                storedCurrencies = try managedContext.fetch(fetchRequest)
//            }catch let error as NSError{
//                print(error)
//            }
//        }
//    }
//
//
//    func addCurrencyToStorage(_ currency: Currency){
//        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
//            let managedContext = appDelegate.persistentContainer.viewContext
//
//            //if currency.relative != nil,!(isLeagueFound(with: league.leagueID) ?? true){
//            //                let newLeague = LeagueCore(context: managedContext)
//            //                newLeague.idLeague = league.leagueID
//            //                newLeague.leagueName = league.leagueName
//            //                newLeague.sportName = league.sportName
//            //                newLeague.youtubeLink = league.youtubeLink
//            //                newLeague.leagueBadge = league.leagueBadge
//            //                newLeague.isFavourite = league.isFavourite
//            //                newLeague.leagueAlternate = league.leagueAlternate
//            //
//            //                storedLeagues += [newLeague]
//            //
//            //                do{
//            //                    try managedContext.save()
//            //                    print("<<<<< SAVED")
//            //                }catch let error as NSError{
//            //                    print(error)
//            //                }
//            //            }
//            //        }
//            //    }
//            //
//            //    private func isLeagueFound(with leagueID : String?)->Bool?{
//            //        guard let id = leagueID else{
//            //            return nil
//            //        }
//            //        if storedLeagues.count == 0{
//            //            getDataFromStorage()
//            //        }
//            //        for league in storedLeagues{
//            //            if(league.idLeague == id){
//            //                return true
//            //            }
//            //        }
//            //        return false
//            //    }
//            //
//            //
//            //
//            //    func deleteFromStorage(at index:Int ){
//            //        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
//            //            let managedContext = appDelegate.persistentContainer.viewContext
//            //            managedContext.delete(storedLeagues[index])
//            //            storedLeagues.remove(at: index)
//            //            do{
//            //                try managedContext.save();
//            //                print("item Deleted")
//            //            }catch let error as NSError{
//            //                print(error);
//            //            }
//            //        }
//            //    }
//            //
//
//        }
////
