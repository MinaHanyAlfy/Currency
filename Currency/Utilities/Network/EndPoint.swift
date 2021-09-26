//
//  EndPoint.swift
//  Currency
//
//  Created by Moca on 5/20/21.
//

import Foundation

enum HTTPMethod: String{
    case get = "GET"
}

protocol EndPoint{
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
}
