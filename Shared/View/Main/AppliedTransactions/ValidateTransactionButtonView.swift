////
////  ValidateTransactionButtonView.swift
////  kashi_kashi (iOS)
////
////  Created by 北舘友頼 on 2022/08/28.
////
//
//import Foundation
//import SwiftUI
//struct ValidateTransactionButtonView: View{
//    var transaction : Transaction
//    var body: some View{
//        HStack{
//            Text("承認")
//                .onTapGesture {
//                    validTransaction(transaction: transaction)
//                }
//                .foregroundColor(.myPrimary)
//                .padding(7)
//                .cornerRadius(5)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 5)
//                        .stroke(Color.myPrimary, lineWidth: 1)
//                )
//            Text("拒絶")
//                .onTapGesture {
//                    deleteTransaction(transactionId: transaction.id)
//                }
//                .foregroundColor(.myPrimary)
//                .padding(7)
//                .cornerRadius(5)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 5)
//                        .stroke(Color.myPrimary, lineWidth: 1)
//                )
//        }
//    }
//}
//
//
//func deleteTransaction(transactionId:Int){
//    Task {
//        let url = URL(string: "http://localhost:8000/delete/transaction/" + String(transactionId))!
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "DELETE"
//        let (data, _) = try! await URLSession.shared.data(for: urlRequest)
//    }
//}
