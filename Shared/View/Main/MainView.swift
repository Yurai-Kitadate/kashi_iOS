//
//  MainView.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/08/27.
//

import Foundation
import SwiftUI
struct MainView : View{
    @State private var selection : Int = 0
    var body: some View{
        VStack{
            TabView(selection: self.$selection){
                ValidTransactionsView()
                    .tag(0)
                CreateTransactionSheetView()
                    .tag(1)
                AppliedTransactionsView()
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
            .accentColor(.myPrimary)
            
            
            HStack {
                Button(action: {self.selection = 0}, label: {
                    if self.selection == 0{
                        Image(systemName: "dollarsign.square.fill")
                            .foregroundColor(.myPrimary)
                    }else{
                        Image(systemName: "dollarsign.square.fill")
                            .foregroundColor(.black)
                    }
                })
                .padding(20)
                Button(action: {self.selection = 1}, label: {
                    if self.selection == 1{
                        Image(systemName: "plus.circle")
                            .foregroundColor(.myPrimary)
                    }else{
                        Image(systemName: "plus.circle")
                            .foregroundColor(.black)
                    }
                })
                .padding(20)
                Button(action: {self.selection = 2}, label: {
                    if self.selection == 2{
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.myPrimary)
                    }else{
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.black)
                    }
                })
                .padding(20)
            }
        }
    }
}
