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
//struct ChopstickGame {
//    let travelData: TravelData
//    var users: [User]
//    var Role: [String] = []
//    var isTransition: Bool
//    var isHeightSet: [Bool] = []
//    var heights: [Double] = []
//    var usersIndex: Int = 0
//
//    private var randomHeight: [Double] = [350.0, 330.0, 300.0, 400.0, 370.0]
//
//    init(travelData: TravelData){
//        self.travelData = travelData
//        self.users = travelData.travel.users
//        self.isTransition = false
//        for _ in 0..<users.count{
//            self.Role.append("")
//            self.heights.append(randomHeight.randomElement() ?? 400)
//            self.isHeightSet.append(false)
//        }
//    }
//    mutating func changeHeight(_ randomNumber: Double) {
//        self.heights[usersIndex] = randomNumber
//        self.isHeightSet[usersIndex] = true
//        self.usersIndex += 1
//    }
//    mutating func changeRole(_ role: String) {
//        if (isHeightSet[usersIndex]){
//            self.Role[self.usersIndex] = role
//            self.usersIndex += 1
//        }
//    }
//    mutating func changeTransition(_ isTransition: Bool){
//        self.isTransition = isTransition
//    }
//}
struct ChopsticksView: View {
    @EnvironmentObject var travelData: TravelData
    @EnvironmentObject var roleData: RoleData
    
    @Binding var isGameStarted: Bool
    @Binding var isGameEnded: Bool
    @Binding var isGameResult: Bool
    
    @State private var isTapped: [Bool] = [false,false,false,false,false,false]
    @State private var isMyTurn: [Bool] = [true,false,false,false,false,false, false]
    @State private var order: Int = 0
    
    @State var playingUsers: [PlayingUser] = [PlayingUser(name: "버킬"), PlayingUser(name: "오션"), PlayingUser(name: "밀키"), PlayingUser(name: "데일"), PlayingUser(name: "린다"), PlayingUser(name: "준")]
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var randomAngle: [Double] {return [-0.3,-0.2, -0.1, 0, 0.1, 0.2, 0.3].shuffled()}
    var randomHeight: [Double] {return [400.0, 430.0, 470.0, 450.0, 500.0, 480.0, 410.0, 530.0].shuffled()}
    
    @State var winner: String = ""
    @State var winnerHeight: Double = 0
    @State var winnerIndex: Bool = false
    var body: some View {
        ZStack{
            Section{
            VStack{
                VStack{
                Image("LogoBig")
                    .resizable()
                    .frame(width: 261, height: 90)
                Spacer().frame(height: screenHeight/115)
                if(!isGameResult){
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
//                        .padding()
                    Spacer().frame(height: screenHeight/15)
                }
                }
            }.position(x: screenWidth/2, y: screenHeight/15)
                HStack(spacing: 20){
                    ForEach(0..<playingUsers.count){ index in
                        VStack{
                            RoundedRectangle(cornerRadius: 17, style: .continuous)
                                .fill(Color("TrolYellow"))
                                .frame(width: 40, height: CGFloat(playingUsers[index].height), alignment: .leading)
                                .border(winnerIndex ? Color("TrolGreen") : Color.clear , width:6)
//                                .cornerRadius(17)
                                .opacity(!(order == 3) && isTapped[index] ? 0.3 : 1)
                                .rotationEffect(Angle.radians(randomAngle[index]))
                                .scaleEffect(isTapped[index] ? 1.2 : 1.0)
                                .animation(.default)
                                .onTapGesture {
                                    isTapped[index] = true
                                    isMyTurn[index] = false
                                    isMyTurn[index + 1] = true
//                                    if(order == 2){
//                                        winnerIndex = true
//                                    }
                                    if(order < playingUsers.count - 1){
                                        order += 1
                                    }
                                    
                                }
                                .disabled(isTapped[index])
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
                }.position(x: screenWidth/2, y: screenHeight/2)
            }
            VStack{
                Spacer()
                if(isTapped.contains(false)){
                    container()
                        .frame(width: screenWidth, height: screenHeight/2, alignment: .bottom)
                        .transition(.move(edge: .bottom))
                        .animation(.spring())
                }
                else{
                }
            }
            .ignoresSafeArea()
        }
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
