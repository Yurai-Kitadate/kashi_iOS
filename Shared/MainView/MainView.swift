//
//  MainView.swift
//  kashi_kashi
//
//  Created by 北舘友頼 on 2022/08/26.
//
import SwiftUI
import Foundation
struct MainView : View{
    @State private var showingSheet = false
    @State private var selectionViewIndex = 0
    let views = [
        "借りた",
        "貸した",
        "履歴"
    ]
    var body: some View{
        VStack{
            Picker("",selection: $selectionViewIndex) {
                ForEach(0..<self.views.count) { index in
                    Text(self.views[index])
                }
            }
            .pickerStyle(.segmented)
            Spacer()
            AppliedTransactionCardView(transaction: Transaction(id: 100, borrowerId: 1, lenderId: 1, yen: 10000, _description: "aaaaa", isDone: 0, isAccepted: 0))
            switch self.selectionViewIndex {
            case 0:
                BorrowTransactionCardListView()
            case 1:
                LendTransactionCardListView()
            default:
                BothTransactionCardListView()
            }
            Spacer()
            Image(systemName: "plus.circle")
                .onTapGesture {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet){
                    CreateTransactionSheetView()
                }
                .foregroundColor(.myPrimary)
                .padding(7)
                .cornerRadius(5)
        }
    }
}
