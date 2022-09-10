import Foundation
import SwiftUI

struct BorrowMarkView: View{
    var body : some View {
        Text("借りた")
            .foregroundColor(.myRed)
            .padding(7)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.myRed, lineWidth: 1)
            )
    }
}

