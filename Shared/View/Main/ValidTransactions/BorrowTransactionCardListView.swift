import Foundation
import SwiftUI
@MainActor
class BorrowTransactionsStore: ObservableObject {
    @Published private(set) var transactions = [Transaction]()
    func loadTransactions() async {
        let url = URL(string: "http://localhost:8000/get/transactions/borrow/" + String(LoginUser().userId))!
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

struct BorrowTransactionCardListView : View{
    @StateObject private var borrowTransactionsStore = BorrowTransactionsStore()
    var body : some View{
        ScrollView{
            Text("")
            if borrowTransactionsStore.transactions.isEmpty {
                ZStack(alignment: .center){
                    VStack{
                        ProgressView("now loding")
                        Spacer()
                    }
                }
            } else {
                ForEach((0..<borrowTransactionsStore.transactions.count), id: \.self) { i in
                    TransactionCardView(transaction: borrowTransactionsStore.transactions[i])
                }
            }
        }.task {
            await borrowTransactionsStore.loadTransactions()
        }
    }
}

