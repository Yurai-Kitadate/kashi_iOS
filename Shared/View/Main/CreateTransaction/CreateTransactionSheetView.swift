//
//  AddTransactionSheetView.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/08/23.
//

import Foundation
import SwiftUI

struct CreateTransactionSheetView: View{
    @Environment(\.presentationMode) var presentationMode
    @State var text = "借りを返した"
    @State var otherside_id = 0
    @State var yen = 0
    @State var _description = ""
    @State var lend = false
    var body : some View {
        VStack{
            Form {
                Toggle("lend", isOn : $lend)
                TextField("borrower_id", value: $otherside_id, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                TextField("yen", value: $yen, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                TextField("description", text: $_description)
            }
            Text("Add")
                .onTapGesture {
                    if lend{
                        createTransaction(transaction: InsertedTransaction(borrowerId: otherside_id, lenderId: LoginUser().userId, yen: yen, _description: _description, isDone: 0, isAccepted: 0))
                    }else{
                        createTransaction(transaction: InsertedTransaction(borrowerId: LoginUser().userId, lenderId: otherside_id, yen: yen, _description: _description, isDone: 0, isAccepted: 0))
                    }
                    presentationMode.wrappedValue.dismiss()
                    //sheetを閉じる処理
                }
                .foregroundColor(.myPrimary)
                .padding(7)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.myPrimary, lineWidth: 1)
                )
        }
    }
}

func createTransaction(transaction:InsertedTransaction){
    Task {
        let url = URL(string: "http://localhost:8000/create/transaction")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        let data: [String: Any] = ["borrower_id" :transaction.borrowerId,
                                   "lender_id" : transaction.lenderId,
                                   "yen"    : transaction.yen,
                                   "description" : transaction._description,
                                   "is_done"     : transaction.isDone,
                                   "is_accepted" : transaction.isAccepted]
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
