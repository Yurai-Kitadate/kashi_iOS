//
//  MainView.swift
//  kashi_kashi
//
//  Created by 北舘友頼 on 2022/08/26.
//
import SwiftUI
import Foundation
struct ValidTransactionsView : View{
    @State private var selectionViewIndex = 0
    let screen: CGRect = UIScreen.main.bounds
    var body: some View{
        ScrollView{
            VStack(spacing: 0){
                ZStack{
                    Rectangle()
                        .frame(width: screen.width, height: screen.height/8)
                        .foregroundColor(.myLightPrimary)
                    VStack{
                        Text("ヤンキー")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold, design: .default))
                        Text("@young")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .bold, design: .default))
                    }
                    
                }
                Rectangle()
                    .frame(width: screen.width, height: 1)
                    .foregroundColor(.white)
                ZStack{
                    Rectangle()
                        .frame(width: screen.width, height: screen.height/14)
                        .foregroundColor(.white)
                    HStack(spacing:0){
                        if selectionViewIndex == 0{
                            ZStack{
                                Rectangle()
                                    .frame(width: (screen.width - 1)/2, height: screen.height/14)
                                    .foregroundColor(.white)
                                Text("貸し")
                                    .foregroundColor(.myGray)
                                    .font(.system(size: 15, weight: .bold, design: .default))
                                
                            }.onTapGesture {
                                selectionViewIndex = 0
                            }
                            
                        }else{
                            ZStack{
                                Rectangle()
                                    .frame(width: (screen.width - 1)/2, height: screen.height/14)
                                    .foregroundColor(.myLightPrimary)
                                Text("貸し")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .bold, design: .default))
                            }.onTapGesture {
                                selectionViewIndex = 0
                            }
                        }
                        Rectangle()
                            .frame(width: 1, height:screen.height/14)
                            .foregroundColor(.white)
                        if selectionViewIndex == 1{
                            ZStack{
                                Rectangle()
                                    .frame(width: (screen.width - 1)/2, height: screen.height/14)
                                    .foregroundColor(.white)
                                VStack{
                                    Text("借り")
                                        .foregroundColor(.myGray)
                                        .font(.system(size: 15, weight: .bold, design: .default))
                                }
                                
                            }
                            .onTapGesture {
                                selectionViewIndex = 1
                            }
                        }else{
                            ZStack{
                                Rectangle()
                                    .frame(width: (screen.width - 1)/2, height: screen.height/14)
                                    .foregroundColor(.myLightPrimary)
                                VStack{
                                    Text("借り")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .bold, design: .default))
                                }
                            }
                            .onTapGesture {
                                selectionViewIndex = 1
                            }
                        }
                    }.padding(1)
                }
                Rectangle()
                    .frame(width: screen.width, height: 1)
                    .foregroundColor(.white)
                    .shadow(color: .gray, radius: 2, x: 0, y: 1)
                if selectionViewIndex == 0{
                    LendTransactionsView()
                }else{
                    BorrowTransactionsView()
                }
            }
        }
    }
}
