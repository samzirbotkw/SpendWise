//
//  Item.swift
//  SpendWise
//
//  Created by George Zirbo on 17.12.2023.
//

import Foundation
import RealmSwift


class Transaction: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var type: String
    @Persisted var amount: Double
    @Persisted var date: Date
    @Persisted var details: String?

    
}
//
//enum TransactionType: String, Codable, CaseIterable {
//    case Income
//    case Expense
//
//    //overwriting the default string value
//    var description: String {
//        switch self {
//            case .Income: return "Income"
//            case .Expense: return "Expense"
//        }
//    }
//}
