//
//  chopsticks.swift
//  TROL
//
//  Created by MBSoo on 2022/06/12.
//

import SwiftUI
import UIKit

struct chopsticksView: View {
    @State private var isGameStarted: Bool = true
    @State private var isGameEnded: Bool = false
    @State private var isGameResult: Bool = false
    var temppeople: [String] = ["ocean", "Buckil", "Joon"]
    var tempRole: [String] = ["DJ", "길라잡이", "총무"]
    @State private var isTapped: [Bool] = [false, false, false]
    @State var chopStickPerson1 = ChopstickGame(name: "ocean", Role: "DJ")
    
    @State var chopStickPerson2 = ChopstickGame(name: "Buckil", Role: "길라잡이")
    
    @State var chopStickPerson3 = ChopstickGame(name: "Joon", Role: "총무")
    
    var tempChop: [ChopstickGame] {return [chopStickPerson1, chopStickPerson2, chopStickPerson3]}
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    var body: some View {
        if(isGameStarted){
        ZStack{
            VStack{
                Spacer()
            HStack(spacing: 40){
                ForEach(0..<tempChop.count){ index in
                    chopstick(tempperson: tempChop[index])
                        .onTapGesture {
                            isTapped[index] = true
                        }
                        .scaleEffect(isTapped[index] ? 1.2 : 1.0)
                        .animation(.default)
                }
            }
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
        else if(isGameEnded){
            
        }
    }
}

struct chopstick: View{
    @State var tempperson: ChopstickGame
    var randomAngle: [Double] {return [-0.3,-0.2, -0.1, 0, 0.1, 0.2, 0.3]}
    var randomHeight: Double {return [350.0, 330.0, 300.0, 400.0, 370.0].randomElement() ?? 400}
    var body: some View {
        VStack {
            Spacer().frame(height: 100)
        Rectangle()
                .frame(width: 40, height: CGFloat(tempperson.myHeight), alignment: .leading)
            .rotationEffect(Angle.radians(randomAngle.randomElement() ?? 0))
//            .overlay{
//                Circle()
//                    .foregroundColor(.white)
//            }
                
            Text("\(tempperson.myHeight, specifier: "%.0lf")")
            Spacer().frame(height: 200)
        }
        .onAppear {
            tempperson.changeHeight(randomHeight)
//            tempperson.myHeight = randomHeight
            print("\(tempperson.name): \(tempperson.myHeight)")
        }
            
        
    }
}

struct container: View{
    var body: some View{
        Rectangle()
            .foregroundColor(.blue)
    }
}

struct ChopstickGame: Hashable{
    let name: String
    var Role: String
    var isTransition: Bool
    var myHeight: Double = 4
    init(name: String, Role: String){
        self.name = name
        self.Role = Role
        self.isTransition = false
    }
    var isTransition2: Bool {
        get {
            return false
        }
        set {
            isTransition = newValue
        }
    }
    
    mutating func changeHeight(_ randomNumber: Double) {
        self.myHeight = randomNumber
    }
}


struct chopsticks_Previews: PreviewProvider {
    static var previews: some View {
        chopsticksView()
    }
}
