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
    let gameNames: [String] = ["젓가락 뽑기", "랜덤 다이스","탭탭 무한탭", "업 앤 다운"]
    let columns = [GridItem(.flexible()),
                            GridItem(.flexible())]
    var body: some View {
        if !travelData.travel.isExist {
            NavigationView{
            VStack{
                Image("LogoBig")
                    .resizable()
                    .frame(width: 249, height: 86, alignment: .center)
                    .padding(.top,48)

                Text("게임을 통해 역할을 정해요!")
                    .font(.custom("Happiness-Sans-Regular", size: 17))
                    .padding(12)

                Spacer()
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(gameNames, id:\.self){ name in
                        NavigationLink(destination: GameCollectionView(gameName: name), label: {
                            GameTap(gameName: name)
                        })
                        
                    }
                }
                Spacer()
//                VStack{
//                    HStack{
//
//                        Button("사다리타기"){
//                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//                        }.frame(width: 170, height: 150)
//                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
//                        Button("젓가락 뽑기"){
//                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//                        }.frame(width: 170, height: 150)
//                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
//                    }
//
//                    HStack{
//                        Button("반사속도"){
//                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//                        }.frame(width: 170, height: 150)
//                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
//                        Button("무한탭"){
//                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//                        }.frame(width: 170, height: 150)
//                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
//                    }
//
//                    HStack{
//                        Button("업다운"){
//                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//                        }.frame(width: 170, height: 150)
//                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
//                        Button("키워드"){
//                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//                        }.frame(width: 170, height: 150)
//                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
//                    }
//                }
//                GameTap()
//                Spacer()

            }
            .navigationBarHidden(true)
            }
        } else {
            EmptyMyTravelView()
        }
    }
}

struct GameTap:View{
    let gameName: String
    var body: some View{
        ZStack{
            Rectangle()
                .cornerRadius(7)
                .foregroundColor(Color("TrolIvory"))
                .frame(width: 170, height: 150)
            VStack{
                Spacer()
                HStack(){
            Text("\(gameName)")
                        .foregroundColor(.black)
                        .padding()
                Spacer()
            }
        }
        }
    }
}


struct RoleGameView_Previews: PreviewProvider {
    static var previews: some View {
        RoleGameView()
            .environmentObject(TravelData())
    }
}
