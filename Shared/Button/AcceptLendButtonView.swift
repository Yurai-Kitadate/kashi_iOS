//
//  AcceptLendView.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/08/18.
//

import Foundation
import SwiftUI
struct AcceptLendButtonView: View{
    var body : some View {
        Text("貸しました")
            .foregroundColor(Color.white)
            .padding(7)
            .background(Color.myPrimary)
            .cornerRadius(5)
    }
}

struct AcceptLendButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AcceptLendButtonView()
    }
}
