import Foundation
import SwiftUI

struct DoneTransactionButtonView: View{
    var transactionId : Int
    @State var text = "借りを返した"
    var body : some View {
        
        Text(text)
            .onTapGesture {
                text = "done"
                doneTransaction(transactionId: transactionId)
            }
            .foregroundColor(.myPrimary)
            .padding(7)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.myPrimary, lineWidth: 1)
            )
    }
}
func doneTransaction(transactionId:Int){
    Task {
        let url = URL(string: "http://localhost:8000/delete/transaction/" + String(transactionId))!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        let (data, _) = try! await URLSession.shared.data(for: urlRequest)
    }
}
struct DoneTransactionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DoneTransactionButtonView(transactionId: 1)
    }
}

