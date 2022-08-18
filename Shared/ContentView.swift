//
//  ContentView.swift
//  Shared
//
//  Created by 北舘友頼 on 2022/08/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: LendListView()){
                    Text("transaction")
                }
                NavigationLink(destination: UserListView()){
                    Text("user")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
