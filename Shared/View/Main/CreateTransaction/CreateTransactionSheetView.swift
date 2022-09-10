//
//  AddTransactionSheetView.swift
//  kashi_kashi (iOS)
//
//  Created by 北舘友頼 on 2022/08/23.
//

import Foundation
import SwiftUI

struct CreateTransactionSheetView: View{
    let dateFormatter = DateFormatter()
    @Environment(\.presentationMode) var presentationMode
    @State var text = "借りを返した"
    @State var otherside_id = 0
    @State var yen = 0
    @State var _description = ""
    @State var selectionViewIndex = 0
    @State private var showingAlert = false
    let screen: CGRect = UIScreen.main.bounds
    var views = ["貸した","借りた"]
    var body : some View {
        ScrollView{
            Text("")
            VStack{
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(5)
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        .frame(width:screen.width / 1.1)
                    
                    VStack{
                        Picker("",selection: $selectionViewIndex) {
                            ForEach(0..<views.count) { index in
                                Text(self.views[index])
                            }
                        }.foregroundColor(.myPrimary)
                            .pickerStyle(.segmented)
                            .accentColor(.myPrimary)
                        
                        HStack{
                            Text("取引相手")
                                .font(.custom("Times-Roman", size: 20))
                                .foregroundColor(.myPrimary)
                            Spacer()
                        }
                        TextField("", value: $otherside_id, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                        Divider()
                        
                        HStack{
                            Text("金額")
                                .font(.custom("Times-Roman", size: 20))
                                .foregroundColor(.myPrimary)
                            Spacer()
                        }
                        TextField("", value: $yen, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                        Divider()
                        
                        
                        HStack{
                            Text("内容")
                                .font(.custom("Times-Roman", size: 20))
                                .foregroundColor(.myPrimary)
                            Spacer()
                        }
                        TextField("", text: $_description)
                        
                    }.padding()
                }
                Text("")
                Text("")
                ZStack{
                    Rectangle()
                        .fill(Color.myLightPrimary)
                        .cornerRadius(5)
                        .frame(width:screen.width / 1.1,height: screen.height/20)
                    Text("申請")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .onTapGesture {
                            self.showingAlert = true
                            let date = Date()
                            
                            let formatter = DateFormatter()
                            formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMM", options: 0, locale: Locale(identifier: "ja_JP"))
                            if selectionViewIndex == 0{
                                
                                createTransaction(transaction: InsertedTransaction(borrowerId: otherside_id, lenderId: LoginUser().userId,
                                                                                   applierId : LoginUser().userId,yen: yen, _description: _description, isValid : 0,isDone: 0, isAccepted: 0,dateTime:
                                                                                    formatter.string(from: date)))
                                otherside_id = 0
                                yen = 0
                                _description = ""
                                selectionViewIndex = 0
                                
                            }else{
                                createTransaction(transaction: InsertedTransaction(borrowerId: LoginUser().userId, lenderId: otherside_id,applierId : LoginUser().userId, yen: yen, _description: _description, isValid : 0, isDone: 0,isAccepted: 0,dateTime:
                                                                                    formatter.string(from: date)
                                                                                  ))
                                otherside_id = 0
                                yen = 0
                                _description = ""
                                selectionViewIndex = 0
                            }
                            
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("取引を申請しました。"))
                        }
                        .foregroundColor(.myPrimary)
                        .padding(7)
                        .cornerRadius(5)
                }
            }
        }
    }
}
