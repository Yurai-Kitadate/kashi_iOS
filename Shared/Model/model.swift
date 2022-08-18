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
    var yen       :Int
    var _description : String
    var isDone     : Int
    var isAccepted : Int
    private enum CodingKeys: String, CodingKey {
        case id = "transactionId"
        case borrowerId
        case lenderId
        case yen
        case _description = "description"
        case isDone
        case isAccepted
    }
}
