
import Foundation
import SwiftUI
@MainActor
class TestStore: ObservableObject {
    @Published private(set) var tests = Hello(name:"")
    func loadTests() async {
        let url = URL(string: "http://localhost:8080/h")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let (data, _) = try! await URLSession.shared.data(for: urlRequest)
        let d = JSONDecoder()
        d.keyDecodingStrategy = .convertFromSnakeCase
        print(data)
        tests = try! d.decode(Hello.self, from: data)
    }
    
}

struct TestView : View{
    @StateObject private var testStore = TestStore()
    var body : some View{
        Text("a")
        ScrollView{
            Text("")
            if testStore.tests.name != "yuurai" {
                ZStack(alignment: .center){
                    VStack{
                        ProgressView("now loding")
                        Spacer()
                    }
                }
            } else {
                Text(testStore.tests.name)
            }
        }.task {
            await testStore.loadTests()
        }
    }
}

struct Hello : Decodable{
    var name:String
}
