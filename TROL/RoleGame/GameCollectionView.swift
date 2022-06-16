//
//  GameCollectionView.swift
//  TROL
//
//  Created by MBSoo on 2022/06/15.
//

import SwiftUI
import UIKit

struct GameCollectionView: View {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    let gameName: String
    @State var isGameStarted: Bool = true
    @State var isGameEnded: Bool = false
    @State var isGameResult: Bool = false
    var body: some View {
        NavigationView{
        ZStack{
        switch gameName{
        case "젓가락 뽑기":
            ChopsticksView(isGameStarted: $isGameStarted, isGameEnded: $isGameEnded, isGameResult: $isGameResult)
                .disabled(isGameStarted)
        case "랜덤 다이스":
            EmptyView()
        case "탭탭 무한탭":
            TapTap()
        case "업 앤 다운":
            EmptyView()
        default:
            EmptyView()
        }
            VStack{
                Spacer().frame(height: screenHeight / 1.5)
            if(isGameStarted){
            Button(action: {
                isGameEnded.toggle()
                isGameStarted.toggle()
            }, label: {
                GameButton()
                    .overlay{
                        Text("시작하기")
                            .foregroundColor(Color("TrolGreen"))
                    }
            })
            }
            else if(isGameEnded){
                Button(action: {
                    isGameEnded.toggle()
                    isGameResult.toggle()
                }, label: {
                    GameButton()
                        .overlay{
                            Text("결과 보기")
                                .foregroundColor(Color.white)
                        }
                })
            }
            else if(isGameResult){
                Button(action: {
                    isGameResult.toggle()
                }, label: {
                    GameButton()
                        .overlay{
                            Text("역할 선정하러 가기")
                                .foregroundColor(Color.white)
                        }
                })
            }
            }
        }
        .navigationTitle(Text("\(gameName)"))
    }
    }
}

struct GameCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        GameCollectionView(gameName: "젓가락 뽑기")
            .environmentObject(TravelData())
    }
}

struct GameButton: View {
    var body: some View {
        Rectangle()
            .cornerRadius(7)
            .foregroundColor(Color(.white))
            .frame(width: 354, height: 54)
            
    }
}
