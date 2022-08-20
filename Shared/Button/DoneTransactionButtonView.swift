import Foundation
import SwiftUI

struct DoneTransactionButtonView: View{
    var body : some View {
        Text("借りを返した")
            .foregroundColor(.myPrimary)
            .padding(7)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.myPrimary, lineWidth: 1)
            )
    }
}

struct DoneTransactionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DoneTransactionButtonView()
    }
}

