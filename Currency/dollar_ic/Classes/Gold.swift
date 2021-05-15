//
//  Gold.swift
//  Currency
//
//  Created by Mina Hany on 5/15/21.
//

import Foundation
struct Gold : Codable {
    let id : Int?
    let option1 : String?
    let option2 : String?
    let option3 : String?
    let last_sell : String?
    let last_buy : String?
    let relative : String?
    let type : String?
    let country : String?
    let state : Int?
    let created_at : String?
    let updated_at : String?

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
