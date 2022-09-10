//
//  func.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/09/05.
//


func createTransaction(transaction:InsertedTransaction){
    Task {
        let url = URL(string: "http://localhost:8000/create/transaction")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        let data: [String: Any] = ["borrower_id" :transaction.borrowerId,
                                   "lender_id" : transaction.lenderId,
                                   "applier_id" : transaction.applierId,
                                   "yen"    : transaction.yen,
                                   "description" : transaction._description,
                                   "is_valid" : transaction.isValid,
                                   "is_done"     : transaction.isDone,
                                   "is_accepted" : transaction.isAccepted,
                                   "date_time"  : transaction.dateTime]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: data, options: []) else { return }
        urlRequest.httpBody = httpBody
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                print("エラー")
                return
            }
            
            print("成功")
        }
        task.resume()
    }
}

import Foundation
func doneTransaction(transaction:Transaction){
    Task {
        Task {
            let url = URL(string: "http://localhost:8000/done/transaction/" + String(transaction.id))!
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "PUT"
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
            let data: [String: Any] = ["borrower_id" :transaction.borrowerId,
                                       "lender_id" : transaction.lenderId,
                                       "applier_id" : transaction.applierId,
                                       "yen"    : transaction.yen,
                                       "description" : transaction._description,
                                       "is_valid" : transaction.isValid,
                                       "is_done"     :1,
                                       "is_accepted" : transaction.isAccepted,
                                       "date_time" : transaction.dateTime]
            guard let httpBody = try? JSONSerialization.data(withJSONObject: data, options: []) else { return }
            urlRequest.httpBody = httpBody
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if error != nil {
                    print("エラー")
                    return
                }
                
                print("成功")
            }
            task.resume()
        }
    }
}


func validTransaction(transaction:Transaction){
    Task {
        let url = URL(string: "http://localhost:8000/validate/transaction/" + String(transaction.id))!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        let data: [String: Any] = ["borrower_id" :transaction.borrowerId,
                                   "lender_id" : transaction.lenderId,
                                   "applier_id" : transaction.applierId,
                                   "yen"    : transaction.yen,
                                   "description" : transaction._description,
                                   "is_valid" : 1,
                                   "is_done"     : transaction.isDone,
                                   "is_accepted" : transaction.isAccepted,
        "date_time" : transaction.dateTime]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: data, options: []) else { return }
        urlRequest.httpBody = httpBody
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                print("エラー")
                return
            }
            
            print("成功")
        }
        task.resume()
    }
}


func acceptTransaction(transaction:Transaction){
    Task {
        let url = URL(string: "http://localhost:8000/accept/transaction/" + String(transaction.id))!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        let data: [String: Any] = ["borrower_id" :transaction.borrowerId,
                                   "lender_id" : transaction.lenderId,
                                   "applier_id" : transaction.applierId,
                                   "yen"    : transaction.yen,
                                   "description" : transaction._description,
                                   "is_valid" : transaction.isValid,
                                   "is_done"     : transaction.isDone,
                                   "is_accepted" : 1,
                                   "date_time" : transaction.dateTime]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: data, options: []) else { return }
        urlRequest.httpBody = httpBody
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                print("エラー")
                return
            }
            
            print("成功")
        }
        task.resume()
    }
}
func deleteTransaction(transaction:Transaction){
    Task {
        let url = URL(string: "http://localhost:8000/delete/transaction/" + String(transaction.id))!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        let (data, _) = try! await URLSession.shared.data(for: urlRequest)
    }
}
