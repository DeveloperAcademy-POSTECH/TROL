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
//    var chopstickUsers: ChopstickGame {
//        return ChopstickGame(travelData: travelData)
//    }
//    @State var ChopstickUsers: [User] = [User(name: "오션"), User(name: "버킬"), User(name: "밀키"),User(name: "데일"),User(name: "린다"),User(name: "준")]
    @State var playingUsers: [PlayingUser] = [PlayingUser(name: "버킬"), PlayingUser(name: "오션"), PlayingUser(name: "밀키"), PlayingUser(name: "데일"), PlayingUser(name: "린다"), PlayingUser(name: "준")]
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var randomAngle: [Double] {return [-0.3,-0.2, -0.1, 0, 0.1, 0.2, 0.3].shuffled()}
    var randomHeight: [Double] {return [350.0, 330.0, 300.0, 400.0, 370.0, 360.0, 410.0, 280.0].shuffled()}
    
    @State var winner: String = ""
    @State var winnerHeight: Double = 0
    @State var userIndex: Int = 0
    var body: some View {
//        ZStack{
//            VStack{
//                Spacer().frame(height: screenHeight/5)
//                HStack(spacing: 40){
//                    ForEach(0..<chopstickUsers.users.count){ index in
//                        VStack{
//                            if(isGameResult){
//                                Text("\(chopstickUsers.heights[index], specifier: "%.0lf")")
//                                    .foregroundColor(Color("TrolGreen"))
//                            }
//
//                                RoundedRectangle(cornerRadius: 10)
//                                    .foregroundColor(Color("TrolYellow"))
//                                    .frame(width: 40, height: CGFloat(chopstickUsers.heights[index]), alignment: .leading)
//                                    .border(isTapped[index] ? Color("TrolGreen") : Color("TrolIvory") ,width:3)
//                                    .cornerRadius(9)
//                                    .rotationEffect(Angle.radians(randomAngle[index]))
//                                    .scaleEffect(isTapped[index] ? 1.2 : 1.0)
//                                    .animation(.default)
//                                    .onTapGesture {
//                                        isTapped[index] = true
//                                    }
//
//
//                            //                            Spacer().frame(height: 50)
//                        }
//                    }
//                }
//            }
//            VStack{
//                Spacer()
//            if(isTapped.contains(false)){
//                container()
//                    .frame(width: screenWidth, height: screenHeight/3, alignment: .bottom)
//                    .transition(.move(edge: .bottom))
//                    .animation(.spring())
//            }
//            }
//            .ignoresSafeArea()
//        }
        ZStack{
            VStack{
                Spacer().frame(height: screenHeight/5)
                Text("지금 순서는?")
                    .font(.custom("Happiness-Sans-Regular", size: 17))
                    .foregroundColor(Color("TrolGreen"))
                if(isMyTurn[userIndex]){
                    Text("\(playingUsers[userIndex].name)")
                        .font(.custom("Happiness-Sans-Bold", size: 50))
                        .foregroundColor(Color("TrolGreen"))
                }
                HStack(spacing: 20){
                    ForEach(0..<playingUsers.count){ index in
                        VStack{
                            if(isGameResult){
                                Text("\(playingUsers[index].height, specifier: "%.0lf")")
                                    .foregroundColor(Color("TrolGreen"))
                            }
                            
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color("TrolYellow"))
                                    .frame(width: 40, height: CGFloat(playingUsers[index].height), alignment: .leading)
                                    .border(isTapped[index] ? Color("TrolGreen") : Color("TrolIvory") ,width:3)
                                    .cornerRadius(9)
                                    .rotationEffect(Angle.radians(randomAngle[index]))
                                    .scaleEffect(isTapped[index] ? 1.2 : 1.0)
                                    .animation(.default)
                                    .onTapGesture {
                                        isTapped[index] = true
                                        isMyTurn[index].toggle()
                                        isMyTurn[index + 1].toggle()
                                        userIndex += 1
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
                }
            }
            VStack{
                Spacer()
            if(isTapped.contains(false)){
                container()
                    .frame(width: screenWidth, height: screenHeight/3, alignment: .bottom)
                    .transition(.move(edge: .bottom))
                    .animation(.spring())
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
