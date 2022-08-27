import Foundation
import SwiftUI
@MainActor
class UsersStore: ObservableObject {
    @Published private(set) var users = [User]()
    func loadUsers() async {
        let url = URL(string: "http://localhost:8000/get/users")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let (data, _) = try! await URLSession.shared.data(for: urlRequest)
        let d = JSONDecoder()
        d.keyDecodingStrategy = .convertFromSnakeCase
        users = try! d.decode([User].self, from: data)
    }
}

struct UserListView : View{
    @StateObject var usersStore = UsersStore()
    var body : some View{
        ScrollView{
            if usersStore.users.isEmpty {
                ZStack(alignment: .center){
                    VStack{
                        ProgressView("now loding")
                        Spacer()
                    }
                }
            } else {
                ForEach((0..<usersStore.users.count), id: \.self) { i in
                    Text(usersStore.users[i].userName)
                }
            }
        }.task {
            await usersStore.loadUsers()
        }
    }
}

