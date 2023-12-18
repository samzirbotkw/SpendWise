//
//  ViewModel.swift
//  SpendWise
//
//  Created by George Zirbo on 17.12.2023.
//

import Foundation
import SwiftUI
import RealmSwift

class ViewModel: ObservableObject {
    private(set) var localDB: Realm?
    @Published var transactions: [Transaction] = []
    
    init(){
        openRealm()
    }
    
    func openRealm() {
        do {
            // Setting the schema version
            let config = Realm.Configuration(schemaVersion: 1)

            // Letting Realm know we want the defaultConfiguration to be the config variable
            Realm.Configuration.defaultConfiguration = config

            // Trying to open a Realm and saving it into the localRealm variable
            localDB = try Realm()
        } catch {
            print("Error opening Realm", error)
        }
    }
    
    func addTransaction(name: String, type: String, amount: Double, date: Date, details: String?){
        if let localDB = localDB {
            do {
                try localDB.write {
                    let newTransaction = Transaction(value:[
                        "name": name,
                        "type": type,
                        "amount": amount,
                        "date": date,
                        "details": details ?? ""
                    ])
                    localDB.add(newTransaction)
                    getTransactions()
                    print("Added new transaction :", newTransaction)
                }
            } catch {
                print("Error adding transaction: \(error)")
            }
        }
    }
    
    func getTransactions(){
        if let localDB = localDB {
            let allTransactions = localDB.objects(Transaction.self).sorted(byKeyPath: "date", ascending: false)
            transactions = []
            allTransactions.forEach{ transaction in
                transactions.append(transaction)
            }
        }
    }
    
    func updateTransaction(id: ObjectId, name: String, type: String, amount: Double, date: Date, details: String?){
        if let localDB = localDB {
            do {
                let transaction = localDB.objects(Transaction.self).filter(NSPredicate(format: "id == %@", id))
                guard !transaction.isEmpty else { return }
                
                try localDB.write {
                    transaction[0].name = name
                    transaction[0].type = type
                    transaction[0].amount = amount
                    transaction[0].date = date
                    transaction[0].details = details
                    getTransactions()
                    print("Updated transaction with id \(id): \(name) \(type) \(amount) \(date) \(details ?? "")")
                }
                
            } catch {
                print("Error updating transaction: \(error)")
            }
        }
    }
    
    func deleteTransaction(id: ObjectId) {
        if let localDB = localDB {
            do {
                let transaction = localDB.objects(Transaction.self).filter(NSPredicate(format: "id == %@", id))
                guard !transaction.isEmpty else { return }
                
                try localDB.write {
                    localDB.delete(transaction)
                    getTransactions()
                    print("Deleted task: \(transaction)")
                }
            } catch {
                print("Error deleting transaction: \(error)")
            }
        }
    }
    
}
    
