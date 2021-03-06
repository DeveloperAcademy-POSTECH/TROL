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
    let columns = [GridItem(.adaptive(minimum: 180, maximum: 180)),
                   GridItem(.adaptive(minimum: 180, maximum: 180))]
    @State var isSheetShowing: Bool = false
    @State var gameName: String = ""
    var body: some View {
        NavigationView{
        if travelData.travel.isExist {
            VStack{
                Image("LogoBig")
                    .resizable()
                    .frame(width: 249, height: 86, alignment: .center)
                    .padding(.top,48)
                
                Text("게임을 통해 역할을 정해요!")
                    .font(.custom("Happiness-Sans-Regular", size: 17))
                    .padding(12)
                
                Spacer()
                LazyVGrid(columns: columns, spacing: 15){
                    ForEach(gameNames, id:\.self){ name in
                        Button {
                            isSheetShowing = true
                            gameName = name
                        } label: {
                            GameTap(gameName: name)
                        }
                        .fullScreenCover(isPresented: $isSheetShowing, content:{ GameCollectionView(gameName: $gameName, isSheetShowing: $isSheetShowing)})
                    }
                }
                Spacer()
                
            }
            .navigationBarHidden(true)} else {
                EmptyMyTravelView().navigationBarHidden(true)
            }
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
                        .font(.custom("Happiness-Sans-Regular", size: 17))
                        .foregroundColor(.black)
                        .padding()
                        .padding(.horizontal, 14)
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
