//
//  LendListView.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/08/18.
//

import Foundation
import SwiftUI
@MainActor
class BothTransactionsStore: ObservableObject {
    @Published private(set) var transactions = [Transaction]()
    func loadTransactions() async {
        let url1 = URL(string: "http://localhost:8000/get/transactions/both/" + String(LoginUser().userId))!
        var urlRequest1 = URLRequest(url: url1)
        urlRequest1.httpMethod = "GET"
        let (data1, _) = try! await URLSession.shared.data(for: urlRequest1)
        let d = JSONDecoder()
        d.keyDecodingStrategy = .convertFromSnakeCase
        transactions = try! d.decode([Transaction].self, from: data1)
    }
}

struct BothTransactionCardListView : View{
    @StateObject var bothTransactionsStore:  BothTransactionsStore
    
    init() {
        _bothTransactionsStore = StateObject(wrappedValue:  BothTransactionsStore())
    }
    var body : some View{
        ScrollView{
            Text("")
            if bothTransactionsStore.transactions.isEmpty {
                ZStack(alignment: .center){
                    VStack{
                        ProgressView("now loding")
                        Spacer()
                    }
                }
            } else {
                ForEach((0..<bothTransactionsStore.transactions.count), id: \.self) { i in
                    TransactionCardView(trans: bothTransactionsStore.transactions[i])
                }
            }
        }.task {
            await bothTransactionsStore.loadTransactions()
        }
    }
}
