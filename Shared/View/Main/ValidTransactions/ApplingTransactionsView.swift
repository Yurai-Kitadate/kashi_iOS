//import Foundation
//import SwiftUI
//@MainActor
//class ApplingTransactionsStore: ObservableObject {
//    @Published private(set) var transactions = [Transaction]()
//    func loadTransactions() async {
//        let url = URL(string: "http://localhost:8000/get/transactions/appling/" + String(LoginUser().userId))!
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "GET"
//        do{
//            let (data, _) = try await URLSession.shared.data(for: urlRequest)
//            let d = JSONDecoder()
//            d.keyDecodingStrategy = .convertFromSnakeCase
//            transactions = try d.decode([Transaction].self, from: data)
//        }catch{
//            print(error.localizedDescription)
//            return
//        }
//    }
//}
//
//struct ApplingTransactionsView : View{
//    @StateObject private var applingTransactionsStore = ApplingTransactionsStore()
//    var body : some View{
//        ScrollView{
//            Text("")
//            if applingTransactionsStore.transactions.isEmpty {
//                ZStack(alignment: .center){
//                    VStack{
//                        ProgressView("now loding")
//                        Spacer()
//                    }
//                }
//            } else {
//                ForEach((0..<applingTransactionsStore.transactions.count), id: \.self) { i in
//                    ApplingTransactionCardView(transaction: applingTransactionsStore.transactions[i])
//                }
//            }
//        }.task {
//            await applingTransactionsStore.loadTransactions()
//        }
//    }
//}
//
//
