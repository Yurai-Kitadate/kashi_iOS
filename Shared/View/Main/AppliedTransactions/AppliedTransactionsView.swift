//
//  LendListView.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/08/18.
//

import Foundation
import SwiftUI
@MainActor
class AppliedTransactionsStore: ObservableObject {
    @Published private(set) var transactions = [Transaction]()
    func loadTransactions() async {
        let url = URL(string: "http://localhost:8000/get/transactions/applied/" + String(LoginUser().userId))!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        do{
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let d = JSONDecoder()
            d.keyDecodingStrategy = .convertFromSnakeCase
            transactions = try d.decode([Transaction].self, from: data)
        }catch{
            print(error.localizedDescription)
            return
        }
    }
}

struct AppliedTransactionsView : View{
    @StateObject private var appliedTransactionsStore = AppliedTransactionsStore()
    var body : some View{
        ScrollView{
            Text("")
            if appliedTransactionsStore.transactions.isEmpty {
                ZStack(alignment: .center){
                    VStack{
                        ProgressView("now loding")
                        Spacer()
                    }
                }
            } else {
                ForEach((0..<appliedTransactionsStore.transactions.count), id: \.self) { i in
                    AppliedTransactionCardView(transaction: appliedTransactionsStore.transactions[i])
                }
            }
        }.task {
            await appliedTransactionsStore.loadTransactions()
        }
    }
}

