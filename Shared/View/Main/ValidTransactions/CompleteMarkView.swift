import Foundation
import SwiftUI

struct CompleteMarkView: View{
    var body : some View {
        Text("完了")
            .foregroundColor(.myPrimary)
            .padding(7)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.myPrimary, lineWidth: 1)
            )
    }
}


