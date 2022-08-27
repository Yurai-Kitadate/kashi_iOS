//
//  MainView.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/08/27.
//

import Foundation
import SwiftUI
struct MainView : View{
    var body: some View{
        TabView{
            ValidTransactionsView()
                .tabItem {
                    Image(systemName: "dollarsign.square.fill")
                    Text("取引一覧")
                }
            FriendsView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("友達")
                }
            CreateTransactionSheetView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("申請")
                }
            AppliedTransactionsView()
                .tabItem {
                    Image(systemName: "envelope.fill")
                    Text("通知")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("設定")
                }
        }
        .accentColor(.myPrimary)
    }
}
