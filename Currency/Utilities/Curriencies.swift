//
//  Curriencies.swift
//  Currency
//
//  Created by Moca on 5/20/21.
//

import Foundation

enum Curriencies{
    case getDefault(id: Int = 4)
    case getGoldPrice(id: Int = 7)
    case getCurriencyPrice(id: Int = 6)
    case getInternationalPrice(id: Int = 5)
  
}

extension Curriencies: EndPoint{
    var baseURL: String {
        return "https://win1withus.com/del/api/currency_by_type-"
        
    }
    var baseURL2: String {
        return "https://win1withus.com/del/api/diesel"
    }
    
    
    var path: String {
        switch self {
        case .getDefault(let id):
            return "\(id)"
        case .getGoldPrice(let id):
            return "\(id)"
        case .getCurriencyPrice(let id):
            return "\(id)"
        case .getInternationalPrice(let id):
            return "\(id)"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
}
