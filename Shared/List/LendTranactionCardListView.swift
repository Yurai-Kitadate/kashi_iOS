//
//  LendListView.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/08/18.
//

import Foundation
import SwiftUI
@MainActor
class LendTransactionsStore: ObservableObject {
    @Published private(set) var transactions = [Transaction]()
    func loadTransactions() async {
        let url = URL(string: "http://localhost:8000/get/transactions/lend/" + String(LoginUser().userId))!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let (data, _) = try! await URLSession.shared.data(for: urlRequest)
        let d = JSONDecoder()
        d.keyDecodingStrategy = .convertFromSnakeCase
        transactions = try! d.decode([Transaction].self, from: data)
    }
}

struct LendTransactionCardListView : View{
    @StateObject var lendTransactionsStore:  LendTransactionsStore
    
    init() {
        _lendTransactionsStore = StateObject(wrappedValue:  LendTransactionsStore())
    }
    var body : some View{
        ScrollView{
            Text("")
            if lendTransactionsStore.transactions.isEmpty {
                ZStack(alignment: .center){
                    VStack{
                        ProgressView("now loding")
                        Spacer()
                    }
                }
            } else {
                ForEach((0..<lendTransactionsStore.transactions.count), id: \.self) { i in
                    TransactionCardView(trans: lendTransactionsStore.transactions[i])
                }
            }
        }.task {
            await lendTransactionsStore.loadTransactions()
        }
    }
}

