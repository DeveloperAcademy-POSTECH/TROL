//
//  chopsticks.swift
//  TROL
//
//  Created by MBSoo on 2022/06/12.
//

import SwiftUI
import UIKit

struct PlayingUser{
    let name: String
    var myRole: Role?
    var height: Double = 300.0
    
    init(name:String){
        self.name = name
    }
    mutating func changeHeight(_ randomNumber: Double) {
        self.height = randomNumber
    }
    mutating func changeRole(_ role: Role) {
        self.myRole = role
    }
}

struct ChopsticksView: View {
    @EnvironmentObject var travelData: TravelData
    @EnvironmentObject var roleData: RoleData
    
    @Binding var isGameStarted: Bool
    @Binding var isGameEnded: Bool
    @Binding var isGameResult: Bool
    
    @State private var isTapped: [Bool] = [false,false,false,false,false,false]
    @State private var isMyTurn: [Bool] = [true,false,false,false,false,false, false]
    @State private var order: Int = 0
    @State var playingUsers: [PlayingUser] = [PlayingUser(name: "밀키"), PlayingUser(name: "오션"), PlayingUser(name: "버킬"), PlayingUser(name: "데일"), PlayingUser(name: "린다"), PlayingUser(name: "준")]
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var randomAngle: [Double] {return [-0.3,-0.2, -0.1, 0, 0.1, 0.2, 0.3].shuffled()}
    var randomHeight: [Double] {return [400.0, 430.0, 470.0, 450.0, 500.0, 480.0, 410.0, 530.0].shuffled()}
    
    @State var winner: String = ""
    @State var winnerHeight: Double = 0
    @State var winnerIndex: Bool = false
    @State private var isTimeEnded: Bool = false
    @Binding var isSheetShowing: Bool
    var body: some View {
        ZStack{
            Section{
                VStack{
                    VStack{
                        Spacer().frame(height: screenHeight/5)
                        Image("Cloud")
                            .resizable()
                            .frame(width: 261, height: 90)
                            .overlay{
                                Text("젓가락뽑기")
                                    .font(.custom("Happiness-Sans-Bold", size: 28) )
                                    .foregroundColor(Color("TrolGreen"))
                            }
                        Spacer().frame(height: screenHeight/70)
                        if(isTapped.contains(false)){
                            Text("정해진 순서에 젓가락을 뽑아주세요")
                                .font(.custom("Happiness-Sans-Bold", size: 17))
                                .foregroundColor(Color.gray)
                                .padding()
                            Text("지금 순서는?")
                                .font(.custom("Happiness-Sans-Bold", size: 17))
                                .foregroundColor(Color("TrolGreen"))
                            Text("\(playingUsers[order].name)")
                                .font(.custom("Happiness-Sans-Bold", size: 50))
                                .foregroundColor(Color("TrolGreen"))
                        }
                        else{
                            Text("가장 긴 젓가락은")
                                .font(.custom("Happiness-Sans-Bold", size: 17))
                                .foregroundColor(Color.gray)
                            Text("'밀키'의 젓가락입니다!")
                                .font(.custom("Happiness-Sans-Bold", size: 17))
                                .foregroundColor(Color.gray)
                                .frame(width: screenWidth)
                            Spacer().frame(height: screenHeight/15)
                        }
                    }
                }.position(x: screenWidth/2, y: screenHeight/15)
                HStack(spacing: 20){
                    ForEach(0..<playingUsers.count){ index in
                        VStack{
                            if(index == 0){
                            RoundedRectangle(cornerRadius: 17, style: .continuous)
                                .fill(Color("TrolYellow"))
                                .frame(width: 40, height: CGFloat(playingUsers[index].height), alignment: .leading)
                                .border(isTapped[index] ? Color("TrolGreen") : Color.clear , width:6)
                                .opacity(isTapped[index] ? 0.3 : 1)
                                .rotationEffect(Angle.radians(randomAngle[index]))
                                .scaleEffect(isTapped[index] ? 1.2 : 1.0)
                                .animation(.default)
                                .onTapGesture {
                                    isTapped[index] = true
                                    isMyTurn[index] = false
                                    isMyTurn[index + 1] = true
                                    if(order < playingUsers.count - 1){
                                        order += 1
                                    }
                                    
                                }
                                .disabled(isTapped[index])
                            }
                            else{
                                RoundedRectangle(cornerRadius: 17, style: .continuous)
                                    .fill(Color("TrolYellow"))
                                    .frame(width: 40, height: CGFloat(playingUsers[index].height), alignment: .leading)
//                                    .border(isTapped[index] ? Color("TrolGreen") : Color.clear , width:6)
                                    .opacity(isTapped[index] ? 0.3 : 1)
                                    .rotationEffect(Angle.radians(randomAngle[index]))
                                    .scaleEffect(isTapped[index] ? 1.2 : 1.0)
                                    .animation(.default)
                                    .onTapGesture {
                                        isTapped[index] = true
                                        isMyTurn[index] = false
                                        isMyTurn[index + 1] = true
                                        if(order < playingUsers.count - 1){
                                            order += 1
                                        }
                                        
                                    }
                                    .disabled(isTapped[index])
                            }
                        }
                        .onAppear{
                            playingUsers[index].changeHeight(randomHeight[index])
                            for winnerindex in 0...index{
                                if(winnerHeight < playingUsers[winnerindex].height){
                                    winnerHeight = playingUsers[winnerindex].height
                                    winner = playingUsers[winnerindex].name
                                }
                            }
                        }
                    }
                }.position(x: screenWidth/2, y: screenHeight/1.5)
            }
            VStack{
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
                if(isGameEnded){
                    Text("")
                        .frame(width: 0, height: 0)
                        .task(delayTime)
                }
                if(isGameResult){
                    NavigationLink(destination: ChopsticksResultView(isSheetShowing: $isSheetShowing, randomHeight: randomHeight, winnerHeight: winnerHeight), isActive: $isGameResult, label: {Text("")})
                }
                Spacer()
                if(isTapped.contains(false)){
                    container()
                        .frame(width: screenWidth, height: screenHeight/2.5, alignment: .bottom)
                        .transition(.move(edge: .bottom))
                        .animation(.spring())
                        .onDisappear(){
                            isGameEnded = true
                        }
                }
            }
            .ignoresSafeArea()
        }
    }
    func delayTime() async {
        try? await Task.sleep(nanoseconds: 2_500_000_000)
                isTimeEnded = true
        isGameResult.toggle()
    }
}
struct container: View{
    var body: some View{
        Rectangle()
            .foregroundColor(Color("TrolGreen"))
    }
}


//
//struct chopsticks_Previews: PreviewProvider {
//    static var previews: some View {
//        ChopsticksView()
//            .environmentObject(TravelData())
//    }
//}
