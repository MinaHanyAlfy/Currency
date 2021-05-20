//
//  Gold.swift
//  Currency
//
//  Created by Mina Hany on 5/15/21.
//

//import Foundation
//struct Gold : Codable {
//    var id : Int?
//    var option1 : String?
//    var option2 : String?
//    var option3 : String?
//    var last_sell : String?
//    var last_buy : String?
//    var relative : String?
//    var type : String?
//    var country : String?
//    var state : Int?
//    var created_at : String?
//    var updated_at : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case option1 = "option1"
//        case option2 = "option2"
//        case option3 = "option3"
//        case last_sell = "last_sell"
//        case last_buy = "last_buy"
//        case relative = "relative"
//        case type = "type"
//        case country = "country"
//        case state = "state"
//        case created_at = "created_at"
//        case updated_at = "updated_at"
//    }
//
//}
//
//
//{
//   "current_page":1,
//   "data":[
//      {
//         "id":2,
//         "option1":"12875",
//         "option2":"12825",
//         "option3":"0",
//         "last_sell":"7700",
//         "last_buy":"7650",
//         "relative":"0.98",
//         "type":"\u0627\u0644\u0644\u064a\u0631\u0629 \u0627\u0644\u0644\u0628\u0646\u0627\u0646\u064a\u0629",
//         "country":"\u0627\u062f\u0644\u0628",
//         "state":4,
//         "created_at":"2019-02-19 05:00:00",
//         "updated_at":"2021-05-19 20:45:33"
//      },
//      {
//         "id":358,
//         "option1":"3150",
//         "option2":"3125",
//         "option3":"1",
//         "last_sell":"7700",
//         "last_buy":"7650",
//         "relative":"-2.50",
//         "type":"\u0627\u0644\u0644\u064a\u0631\u0629 \u0627\u0644\u0633\u0648\u0631\u064a\u0629",
//         "country":"\u0627\u062f\u0644\u0628",
//         "state":4,
//         "created_at":"2019-02-19 05:00:00",
//         "updated_at":"2021-05-16 15:44:45"
//      }
//   ],
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
//
//{
//   "current_page":1,
//   "data":[
//      {
//         "id":4,
//         "option1":"52.4",
//         "option2":"52.4",
//         "option3":"3",
//         "last_sell":"52.4",
//         "last_buy":"52.4",
//         "relative":"0.60",
//         "type":"\u0627\u0644\u0630\u0647\u0628 ( \u0639\u064a\u0627\u0631 21 )",
//         "country":"\u0627\u062f\u0644\u0628",
//         "state":7,
//         "created_at":"2019-01-29 07:00:00",
//         "updated_at":"2020-09-25 12:57:57"
//      },
//      {
//         "id":197,
//         "option1":"35.12",
//         "option2":"35.12",
//         "option3":"1",
//         "last_sell":"34.93",
//         "last_buy":"34.93",
//         "relative":"0.64",
//         "type":"\u0627\u0644\u0630\u0647\u0628 ( \u0639\u064a\u0627\u0631 14 )",
//         "country":"\u0627\u062f\u0644\u0628",
//         "state":7,
//         "created_at":"2019-01-27 00:00:00",
//         "updated_at":"2021-05-19 20:45:33"
//      },
//      {
//         "id":198,
//         "option1":"60.21",
//         "option2":"60.21",
//         "option3":"1",
//         "last_sell":"59.88",
//         "last_buy":"59.88",
//         "relative":"0.60",
//         "type":"\u0627\u0644\u0630\u0647\u0628 ( \u0639\u064a\u0627\u0631 24 )",
//         "country":"\u0627\u062f\u0644\u0628",
//         "state":7,
//         "created_at":"2019-01-31 00:00:00",
//         "updated_at":"2021-05-19 20:45:33"
//      },
//      {
//         "id":199,
//         "option1":"55.19",
//         "option2":"55.19",
//         "option3":"1",
//         "last_sell":"54.89",
//         "last_buy":"54.89",
//         "relative":"0.65",
//         "type":"\u0627\u0644\u0630\u0647\u0628 ( \u0639\u064a\u0627\u0631 22 )",
//         "country":"\u0627\u062f\u0644\u0628",
//         "state":7,
//         "created_at":"2019-01-30 00:00:00",
//         "updated_at":"2021-05-19 20:45:33"
//      },
//      {
//         "id":200,
//         "option1":"45.16",
//         "option2":"45.16",
//         "option3":"1",
//         "last_sell":"44.91",
//         "last_buy":"44.91",
//         "relative":"0.00",
//         "type":"\u0627\u0644\u0630\u0647\u0628 ( \u0639\u064a\u0627\u0631 18 )",
//         "country":"\u0627\u062f\u0644\u0628",
//         "state":7,
//         "created_at":"2019-01-28 00:00:00",
//         "updated_at":"2021-05-19 20:45:33"
//      }
//   ],
//   "first_page_url":"https:\/\/win1withus.com\/del\/api\/currency_by_type-7?page=1",
//   "from":1,
//   "last_page":1,
//   "last_page_url":"https:\/\/win1withus.com\/del\/api\/currency_by_type-7?page=1",
//   "next_page_url":null,
//   "path":"https:\/\/win1withus.com\/del\/api\/currency_by_type-7",
//   "per_page":30,
//   "prev_page_url":null,
//   "to":5,
//   "total":5
//}
