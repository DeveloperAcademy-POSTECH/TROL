//
//  chopsticks.swift
//  TROL
//
//  Created by MBSoo on 2022/06/12.
//

import SwiftUI
import UIKit

struct ChopsticksView: View {
    @EnvironmentObject var travelData: TravelData
    @EnvironmentObject var roleData: RoleData

    @Binding var isGameStarted: Bool
    @Binding var isGameEnded: Bool
    @Binding var isGameResult: Bool

    @State private var isTapped: [Bool] = [false]

    var chopstickUsers: ChopstickGame {
        return ChopstickGame(travelData: travelData)
    }
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    var randomAngle: [Double] {return [-0.3,-0.2, -0.1, 0, 0.1, 0.2, 0.3]}
    var randomHeight: [Double] = [350.0, 330.0, 300.0, 400.0, 370.0]
    var body: some View {
//        if(isGameStarted){
        ZStack{
            VStack{
                Spacer().frame(height: 100)
                HStack(spacing: 40){
                    ForEach(0..<chopstickUsers.users.count){ index in
                        VStack{
                            Text("\(chopstickUsers.heights[index])")
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: 40, height: CGFloat(chopstickUsers.heights[index]), alignment: .leading)
                                .rotationEffect(Angle.radians(randomAngle.randomElement() ?? 0))
                                .scaleEffect(isTapped[index] ? 1.2 : 1.0)
                                .animation(.default)
                                .onTapGesture {
                                    isTapped[index] = true
                                }
//                            Text("\(tempChop[index].name):\(tempChop[index].myHeight, specifier: "%.0lf")")
                            Spacer().frame(height: 50)
                        }
//                        .onAppear {
////                            chopstickUsers.heights[index] = randomHeight.randomElement() ?? 400.0
//                            chopstickUsers.changeHeight(randomHeight.randomElement() ?? 400.0)
//                        }
                    }

                    }

//            HStack(spacing: 40){
//                ForEach(0..<tempChop.count){ index in
//                    chopstick(tempperson: tempChop[index])
//                        .onTapGesture {
//                            isTapped[index] = true
//                        }
//                        .scaleEffect(isTapped[index] ? 1.2 : 1.0)
//                        .animation(.default)
//                }
//            }
            }
            VStack(alignment:.trailing){
                Spacer()
                if(isTapped.contains(false)){
                container()
                        .frame(width: screenWidth, height: screenHeight/2, alignment: .bottom)
                    .transition(.move(edge: .bottom))
                    .animation(.spring())
                }
                else{
                    Button(action: {
                        isGameEnded = true
                    }, label: {
                        Text("결과 확인하러 가기 !")
                            .bold()
                    })
                }
            }
            .ignoresSafeArea()
        }
        }
//    }
}

//struct chopstick: View{
//    @State var tempperson: ChopstickGame
//    var randomAngle: [Double] {return [-0.3,-0.2, -0.1, 0, 0.1, 0.2, 0.3]}
//    var randomHeight: Double {return [350.0, 330.0, 300.0, 400.0, 370.0].randomElement() ?? 400}
//    var body: some View {
//        VStack {
//            Spacer().frame(height: 100)
//            Rectangle()
//                .frame(width: 40, height: CGFloat(tempperson.myHeight), alignment: .leading)
//                .rotationEffect(Angle.radians(randomAngle.randomElement() ?? 0))
//            Text("\(tempperson.name):\(tempperson.myHeight, specifier: "%.0lf")")
//            Spacer().frame(height: 200)
//        }
//        .onAppear {
//            tempperson.changeHeight(randomHeight)
//        }
//    }
//}

struct container: View{
    var body: some View{
        Rectangle()
            .foregroundColor(.blue)
    }
}

struct ChopstickGame {
    let travelData: TravelData
    var users: [User]
    var Role: [String] = []
    var isTransition: Bool
    var isHeightSet: [Bool] = []
    var heights: [Double] = []
    var usersIndex: Int = 0

    private var randomHeight: [Double] = [350.0, 330.0, 300.0, 400.0, 370.0]
    
    init(travelData: TravelData){
        self.travelData = travelData
        self.users = travelData.travel.users
        self.isTransition = false
        for _ in 0..<users.count{
            self.Role.append("")
            self.heights.append(randomHeight.randomElement() ?? 400)
            self.isHeightSet.append(false)
        }
    }
//    var isTransition2: Bool {
//        get {
//            return false
//        }
//        set {
//            isTransition = newValue
//        }
//    }
    mutating func changeHeight(_ randomNumber: Double) {
        self.heights[usersIndex] = randomNumber
        self.isHeightSet[usersIndex] = true
        self.usersIndex += 1
    }
    mutating func changeRole(_ role: String) {
        if (isHeightSet[usersIndex]){
            self.Role[self.usersIndex] = role
            self.usersIndex += 1
        }
    }
    mutating func changeTransition(_ isTransition: Bool){
        self.isTransition = isTransition
    }
}

//
//struct chopsticks_Previews: PreviewProvider {
//    static var previews: some View {
//        ChopsticksView()
//            .environmentObject(TravelData())
//    }
//}
