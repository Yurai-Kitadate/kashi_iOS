import Foundation
import SwiftUI

struct DoneTransactionButtonView: View{
    var transaction : Transaction
    @State var text = "借りを返した"
    @State var selected = false
    var body : some View {
        if selected{
            Text(text)
                .onTapGesture {
                    text = "処理済み"
                    doneTransaction(transaction: transaction)
                    selected = true
                }
                .foregroundColor(.myPrimary)
                .padding(7)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.myPrimary, lineWidth: 1)
                )
        }else{
            Text(text)
                .onTapGesture {
                    text = "done"
                    doneTransaction(transaction: transaction)
                    selected = true
                }
                .foregroundColor(.myRed)
                .padding(7)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.myRed, lineWidth: 1)
                )
        }
    }
}
