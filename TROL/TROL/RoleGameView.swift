//
//  RoleGameView.swift
//  TROL
//
//  Created by MBSoo on 2022/06/07.
//

import SwiftUI

struct RoleGameView: View {
    
    @EnvironmentObject var travelData: TravelData
    @EnvironmentObject var roleData: RoleData
    
    var body: some View {
        if travelData.travel.isExist {
            VStack{
                Image("LogoBig")
                    .resizable()
                    .frame(width: 249, height: 86, alignment: .center)
                    .padding(.top,48)

                Text("게임을 통해 역할을 정해요!")
                    .font(.body)
                    .padding(12)

                Spacer()

                VStack{
                    HStack{

                        Button("사다리타기"){
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }.frame(width: 170, height: 150)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
                        Button("젓가락 뽑기"){
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }.frame(width: 170, height: 150)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
                    }

                    HStack{
                        Button("반사속도"){
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }.frame(width: 170, height: 150)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
                        Button("무한탭"){
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }.frame(width: 170, height: 150)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
                    }

                    HStack{
                        Button("업다운"){
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }.frame(width: 170, height: 150)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
                        Button("키워드"){
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }.frame(width: 170, height: 150)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
                    }
                }

                Spacer()

            }
        } else {
            EmptyMyTravelView()
        }
    }
}
