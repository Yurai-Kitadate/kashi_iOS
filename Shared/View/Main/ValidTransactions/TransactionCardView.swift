//
//  TransactionCard.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/08/18.
//

import Foundation
import SwiftUI

@MainActor
class OtherSideStore: ObservableObject {
    @Published private(set) var otherside = [User]()
    func loadOtherSide(otherSideId : Int) async {
        let url = URL(string: "http://localhost:8000/get/user/" + String(otherSideId))!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        do{
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let d = JSONDecoder()
            d.keyDecodingStrategy = .convertFromSnakeCase
            otherside = try d.decode([User].self, from: data)
        }catch{
            print(error.localizedDescription)
            return
        }
        
        
    }
}

struct TransactionCardView : View{
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
                        if card == .lend{
                            AcceptLendButtonView()
                        }
                        if card == .borrow{
                            DoneTransactionButtonView(transactionId: transaction.id)
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
