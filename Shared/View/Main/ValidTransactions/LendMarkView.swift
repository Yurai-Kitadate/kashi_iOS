import Foundation
import SwiftUI

struct LendMarkView: View{
    var body : some View {
        Text("貸した")
            .foregroundColor(.myPrimary)
            .padding(7)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.myPrimary, lineWidth: 1)
            )
    }
}


