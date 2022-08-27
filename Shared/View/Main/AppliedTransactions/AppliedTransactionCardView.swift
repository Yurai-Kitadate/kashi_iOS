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
    var body: some View{
        
        VStack{
            Text("2022/12/25")
                .font(.custom("Times-Roman", size: 20))
                .foregroundColor(.myGray)
            Text(String(transaction.id))
            Text(transaction._description)
            Text(String(transaction.yen) + "円")
            Spacer()
            HStack{
                RejectLendButtonView()
                AcceptLendButtonView()

            }
        }
        .overlay(
            Rectangle()
                .stroke(Color.myPrimary, lineWidth: 1)
        )
        
        
        
        
    }
}
