//
//  UndoTransactionButtonView.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/08/18.
//

import Foundation
import SwiftUI

struct UndoTransactionButtonView: View{
    var body : some View {
        Text("取り消し")
            .foregroundColor(.myPrimary)
            .padding(7)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.myPrimary, lineWidth: 1)
            )
    }
}

struct UndoTransactionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        UndoTransactionButtonView()
    }
}
