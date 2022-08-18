//
//  LendListView.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/08/18.
//

import Foundation
import SwiftUI
@MainActor
class TransactionsStore: ObservableObject {
    @Published private(set) var transactions = [Transaction]()
    func loadTransactions() async {
        let url = URL(string: "http://localhost:8000/get/transactions")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let (data, _) = try! await URLSession.shared.data(for: urlRequest)
        let d = JSONDecoder()
        d.keyDecodingStrategy = .convertFromSnakeCase
        print(1)
        transactions = try! d.decode([Transaction].self, from: data)
    }
}

struct LendListView : View{
    @StateObject var transactionsStore: TransactionsStore
    
    init() {
        _transactionsStore = StateObject(wrappedValue: TransactionsStore())
    }
    var body : some View{
        ScrollView{
            if transactionsStore.transactions.isEmpty {
                ZStack(alignment: .center){
                    VStack{
                        ProgressView("now loding")
                        Spacer()
                    }
                }
            } else {
                ForEach((0..<transactionsStore.transactions.count), id: \.self) { i in
                    Text(transactionsStore.transactions[i]._description)
                }
            }
        }.task {
            await transactionsStore.loadTransactions()
        }
    }
}
