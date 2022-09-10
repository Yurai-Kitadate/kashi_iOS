//
//  TextFieldCardView.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/09/08.
//

import Foundation
import SwiftUI

struct TextFieldCardView : View{
    let screen: CGRect = UIScreen.main.bounds
    @StateObject var otherSideStore = OtherSideStore()
    var body : some View{
        ZStack{
            Rectangle()
                .fill(Color.white)
                .cornerRadius(5)
                .shadow(color: .gray, radius: 3, x: 0, y: 0)
                .frame(width:screen.width / 1.05)
            HStack{
                Text("Hello")
                Text("a")
                Spacer()
            }
            
        }
    }
}
