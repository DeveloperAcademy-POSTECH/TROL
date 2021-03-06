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
    @Binding var gameName: String
    @State var isGameStarted: Bool = true
    @State var isGameEnded: Bool = false
    @State var isGameResult: Bool = false
    @State private var isTimeEnded: Bool = false
    @Binding var isSheetShowing: Bool
    var body: some View {
        NavigationView{
        ZStack{
        switch gameName{
        case "젓가락 뽑기":
            ChopsticksView(isGameStarted: $isGameStarted, isGameEnded: $isGameEnded, isGameResult: $isGameResult, isSheetShowing: $isSheetShowing)
                .disabled(isGameStarted)
            VStack{
                Spacer().frame(height: screenHeight / 1.2)
            if(isGameStarted){
            Button(action: {
                isGameStarted.toggle()
            }, label: {
                GameButton()
                    .overlay{
                        Text("시작하기")
                            .foregroundColor(Color("TrolGreen"))
                    }
            })
            }
//            if(isGameEnded){
//                Text("")
//                    .frame(width: 0, height: 0)
//                    .task(delayTime)
//            }
//            if(isGameResult){
//                NavigationLink(destination: ChopsticksResultView(Height: winne, isSheetShowing: <#T##Binding<Bool>#>), isActive: $isGameResult, label: {Text("")})
//            }
            }
        case "랜덤 다이스":
            EmptyView()
        case "탭탭 무한탭":
            BeforeTap(isSheetShowing: $isSheetShowing)
        case "업 앤 다운":
            EmptyView()
        default:
            EmptyView()
        }
            
        }
        .navigationBarHidden(true)
        }
//        .navigationTitle(Text("\(gameName)"))
    }
//    func delayTime() async {
//        try? await Task.sleep(nanoseconds: 2_500_000_000)
//                isTimeEnded = true
//        isGameResult.toggle()
//    }
}

//struct GameCollectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameCollectionView(gameName: "젓가락 뽑기")
//            .environmentObject(TravelData())
//    }
//}

struct GameButton: View {
    var body: some View {
        Rectangle()
            .cornerRadius(7)
            .foregroundColor(Color(.white))
            .frame(width: 354, height: 54)
            
    }
}
