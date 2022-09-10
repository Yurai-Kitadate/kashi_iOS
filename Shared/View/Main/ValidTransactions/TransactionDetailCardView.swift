//
//  TransactionCard.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/08/18.
//

import Foundation
import SwiftUI

struct TransactionDetailCardView : View{
    var transaction :Transaction
    var otherSide : User
    let screen: CGRect = UIScreen.main.bounds
    @StateObject var otherSideStore = OtherSideStore()
    var body : some View{
        ZStack{
            Rectangle()
                .fill(Color.white)
                .cornerRadius(5)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                .frame(width:screen.width / 1.1,height: screen.height/2)
            VStack{
                HStack{
                    Text("a")
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
