//
//  Errors.swift
//  Currency
//
//  Created by Mina Hany on 5/18/21.
//

import Foundation
enum ErorrMessage : String,Error {
    case InvalidData = "Sorry ,Something went wrong try agian."
    case InvalidRequest = "Sorry ,This url isn't good enough ,Try agian later."
    case InvalidResponse = " Server Error ,Modify your search and try agian."
}
