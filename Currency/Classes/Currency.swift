//
//  Currency.swift
//  Currency
//
//  Created by Mina Hany on 5/15/21.
//

import Foundation

struct Currency : Codable {
    var id : Int?
    var option1 : String?
    var option2 : String?
    var option3 : String?
    var last_sell : String?
    var last_buy : String?
    var relative : String?
    var type : String?
    var country : String?
    var state : Int?
    var created_at : String?
    var updated_at : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case option1 = "option1"
        case option2 = "option2"
        case option3 = "option3"
        case last_sell = "last_sell"
        case last_buy = "last_buy"
        case relative = "relative"
        case type = "type"
        case country = "country"
        case state = "state"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}


struct CurrencyModel: Codable{
    var currentPage: Int?
    var data: [Currency] = []
    var firstPageURL: String?
    var from: Int?
    var lastPage: Int?
    var lastPageURL: String?
    var nextPageURL: String?
    var path: String?
    var perPage: Int?
    var pervPageUrl: String?
    var to: Int?
    var total: Int?
    
    enum CodingKeys: String,CodingKey{
        case data, from, path, to, total
        case currentPage = "current_page"
        case firstPageURL = "first_page_url"
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case nextPageURL = "next_page_url"
        case perPage = "per_page"
        case pervPageUrl = "prev_page_url"
    }
}

//{
//   "first_page_url":"https:\/\/win1withus.com\/del\/api\/currency_by_type-4?page=1",
//   "from":1,
//   "last_page":1,
//   "last_page_url":"https:\/\/win1withus.com\/del\/api\/currency_by_type-4?page=1",
//   "next_page_url":null,
//   "path":"https:\/\/win1withus.com\/del\/api\/currency_by_type-4",
//   "per_page":30,
//   "prev_page_url":null,
//   "to":2,
//   "total":2
//}
