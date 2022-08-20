//
//  ContentView.swift
//  Shared
//
//  Created by 北舘友頼 on 2022/08/18.
//

import SwiftUI

struct ContentView: View {
    @State private var selectionViewIndex = 0
    let views = [
        "借りた",
        "貸した",
        "履歴"
    ]
    var body: some View {
        VStack{
            Picker(selection: $selectionViewIndex, label: Text("")) {
                ForEach(0..<self.views.count) { index in
                    Text(self.views[index])
                }
            }.pickerStyle(SegmentedPickerStyle())
            Spacer()
            showView()
            Spacer()
        }
    }
    private func showView() -> AnyView {
        switch self.selectionViewIndex {
        case 0:
            return AnyView(BorrowTransactionCardListView())
        case 1:
            return AnyView(LendTransactionCardListView())
        default:
            return AnyView(BothTransactionCardListView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
