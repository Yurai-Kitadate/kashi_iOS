//
//  AppliedTransactionsCardView.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/08/23.
//

import Foundation
import SwiftUI
struct AppliedTransactionCardView: View{
    var transaction : Transaction
    let screen: CGRect = UIScreen.main.bounds
    @State var selected = false
    var body: some View{
        
        ZStack{
            Rectangle()
                .fill(Color.white)
                .cornerRadius(5)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                .frame(width:screen.width / 1.05)
            VStack{
                Text(transaction.dateTime)
                    .font(.custom("Times-Roman", size: 20))
                    .foregroundColor(.myGray)
                Text(String(transaction.id))
                Text(transaction._description)
                Text(String(transaction.yen) + "円")
                Spacer()
                HStack{
                    Spacer()
                    Text(" 承認 ")
                        .onTapGesture {
                            if transaction.isDone == 1{
                                acceptTransaction(transaction: transaction)
                                selected = true
                            }else{
                                validTransaction(transaction: transaction)
                                selected = true
                            }
                        }
                        .foregroundColor(.myPrimary)
                        .padding(7)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.myPrimary, lineWidth: 1)
                        )
                    Text(" 拒絶 ")
                        .onTapGesture {
                            deleteTransaction(transaction: transaction)
                            selected = true
                        }
                        .foregroundColor(.myRed)
                        .padding(7)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.myRed, lineWidth: 1)
                        )
                    Text("")
                    
                }
            }
            .padding(15)
        }
        
        
        
    }
}
