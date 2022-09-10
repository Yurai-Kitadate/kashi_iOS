//
//  TransactionCard.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/08/18.
//

import Foundation
import SwiftUI

struct ApplingTransactionCardView : View{
    var transaction :Transaction
    let screen: CGRect = UIScreen.main.bounds
    @State var card : cardType = .none
    @StateObject var otherSideStore = OtherSideStore()
    var body : some View{
        ZStack{
            Rectangle()
                .fill(Color.white)
                .cornerRadius(5)
                .shadow(color: .gray, radius: 3, x: 0, y: 0)
                .frame(width:screen.width / 1.05)
            HStack{
                Rectangle()
                    .fill(Color.white)
                    .frame(width:1,height: 0)
                VStack{
                    HStack{
                        Text(transaction._description)
                            .font(.custom("Times-Roman", size: 25))
                        Spacer()
                        Text("2022/12/25")
                            .font(.custom("Times-Roman", size: 20))
                            .foregroundColor(.myGray)
                    }
                    Text("")
                    HStack{
                        if otherSideStore.otherside.isEmpty{
                            Text("loading...")
                                .font(.custom("Times-Roman", size: 20))
                            
                        }else{
                            Text(String(otherSideStore.otherside[0].userName))
                                .font(.custom("Times-Roman", size: 20))
                        }
                        Spacer()
                        Text(String(transaction.yen) + "円  ")
                            .font(.custom("Times-Roman", size: 25))
                    }
                    HStack{
                        Spacer()
                        if LoginUser().userId == transaction.borrowerId{
                            Text("借り")
                                .foregroundColor(.myRed)
                                .padding(7)
                                .cornerRadius(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.myRed, lineWidth: 1)
                                )
                        }else{
                            Text("貸し")
                                .foregroundColor(.myPrimary)
                                .padding(7)
                                .cornerRadius(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.myPrimary, lineWidth: 1)
                                )
                            
                        }
                    }
                }.padding(15)
                    .task {
                        if LoginUser().userId == transaction.borrowerId{
                            card = .borrow
                            await otherSideStore.loadOtherSide(otherSideId: transaction.lenderId)
                        }else{
                            card = .lend
                            await otherSideStore.loadOtherSide(otherSideId: transaction.borrowerId)
                        }
                    }
                Rectangle()
                    .fill(Color.white)
                    .frame(width:1,height: 0)
            }
        }
    }
}

