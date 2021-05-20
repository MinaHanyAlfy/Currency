//
//  Network.swift
//  Currency
//
//  Created by Mina Hany on 5/18/21.
//

//import Foundation
//import Alamofire
//class Network{
//    static var shared = Network()
//    
//    func getDataFromAPI(api:String, onCompletion handler : ((Any?,AFError?)->())?){
//        let request = AF.request(api)
//        request.responseJSON { (respose) in
//            switch respose.result {
//            case .success(let data):
//                handler?(data,nil)
//                
//            case .failure(let error):
//                handler?(nil,error)
//            }
//        }
//        
//        print("test")
//    }
//}
