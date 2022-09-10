//
//  model.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/08/18.
//

import Foundation
import SwiftUI

struct Transaction : Decodable,Identifiable{
    var id: Int
    var borrowerId :Int
    var lenderId : Int
    var applierId : Int
    var yen       :Int
    var _description : String
    var isValid : Int
    var isDone     : Int
    var isAccepted : Int
    var dateTime : String
    private enum CodingKeys: String, CodingKey {
        case id = "transactionId"
        case borrowerId
        case lenderId
        case applierId
        case yen
        case _description = "description"
        case isValid
        case isDone
        case isAccepted
        case dateTime
    }
}
struct User : Decodable,Identifiable{
    var id: Int
    var userName : String
    var mailAddress : String
    private enum CodingKeys: String, CodingKey {
        case id = "userId"
        case userName
        case mailAddress
    }
}

struct InsertedTransaction: Encodable{
    var borrowerId :Int
    var lenderId : Int
    var applierId : Int
    var yen       :Int
    var _description : String
    var isValid : Int
    var isDone     : Int
    var isAccepted : Int
    var dateTime : String
    private enum CodingKeys: String, CodingKey {
        case borrowerId
        case lenderId
        case applierId
        case yen
        case _description = "description"
        case isValid
        case isDone
        case isAccepted
        case dateTime
    }
}
enum cardType{
    case lend
    case borrow
    case none
}
struct Card{
    var isLend : Bool
    var isDone : Bool
}
