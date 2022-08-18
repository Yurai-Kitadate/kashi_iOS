import Foundation
import SwiftUI
struct RejectLendButtonView: View{
    var body : some View {
        Text("認めません")
            .foregroundColor(Color.white)
            .padding(7)
            .background(Color.myGray)
            .cornerRadius(5)
    }
}

struct RejectLendButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RejectLendButtonView()
    }
}
