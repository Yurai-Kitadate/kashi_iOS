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
    @StateObject var otherSideStore = OtherSideStore()
    var body : some View{
            ZStack{
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(5)
                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                    .frame(width:screen.width / 1.1)
                HStack{
                    Rectangle()
                        .fill(Color.white)
                        .frame(width:20,height: 0)
                    HStack{
                        VStack{
                            HStack{
                                if otherSideStore.otherside.isEmpty{
                                    Text("loading...")
                                        .font(.system(size: 15, weight: .bold, design: .default))
                                        .foregroundColor(.myGray)
                                }else{
                                    Text(otherSideStore.otherside[0].userName)
                                        .font(.system(size: 15, weight: .bold, design: .default))
                                }
                                Text(" ")
                                Text(transaction.dateTime)
                                    .font(.system(size: 11, weight: .medium, design: .default))
                                    .foregroundColor(.myGray)
                                    .opacity(0.5)
                                Spacer()
                            }
                            Text("")
                            HStack{
                                Text(transaction._description)
                                    .font(.system(size: 22, weight: .bold, design: .default))
                                Spacer()
                            }
                        }
                        if transaction.borrowerId == LoginUser().userId{
                            
                            
                            Text(String(transaction.yen) + "円")
                                .font(.system(size: 22, weight: .black, design: .default))
                                .foregroundColor(.myRed)
                        }else{
                            Text(String(transaction.yen) + "円")
                                .font(.system(size: 22, weight: .black, design: .default))
                                .foregroundColor(.myGreen)
                        }
                        Image(systemName: "arrow.right")
                            .foregroundColor(.myGray)
                    }.padding(15)
                        .task {
                            if LoginUser().userId == transaction.borrowerId{
                                await otherSideStore.loadOtherSide(otherSideId: transaction.lenderId)
                            }else{
                                await otherSideStore.loadOtherSide(otherSideId: transaction.borrowerId)
                            }
                        }
                    Rectangle()
                        .fill(Color.white)
                        .frame(width:1,height: 0)
                }
            //}
        }
    }
    
}
