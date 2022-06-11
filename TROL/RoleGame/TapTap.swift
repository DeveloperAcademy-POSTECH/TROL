//
//  TapTap.swift
//  ChopstickGame
//
//  Created by hurdasol on 2022/06/09.
//
import Foundation
import SwiftUI
import UIKit

struct TapTap: View {
    
    @State private var CountTap = 0 //누른 횟수
    
    @State private var isGameEnd : Bool = false
    @State private var isGameStart : Bool = false
    
    //타임 매니저 사용
    @State private var timeRemaining = 5 //게임 남은 시간
    @State private var startTime = 3 //게임 시작되는 시간
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //화면의 크기를 받아옴
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView{
            ScrollView{//임시 스크롤 뷰
                VStack{
                    //게임 남은 시간 체크
                    Text("남은 시간 \(timeRemaining)")
                        .fontWeight(.bold)
                        .onReceive(timer){_ in
                            if isGameStart{
                                timeRemaining -= 1
                                if timeRemaining == 0{
                                    isGameEnd = true
                                }
                            }
                        }
                    //게임 시작 시간 표시
                    Text(startTime >= 1 ? "\(startTime)초 후 시작합니다!" : "탭하세요!")
                        .onReceive(timer){_ in
                            startTime -= 1
                            
                        }
                }
                //게임 탭 한 횟수 표시
                Text("you tap \(CountTap) !")
                    .frame(width: screenWidth, height: screenHeight)
                NavigationLink(destination:AfterGame(CountTap: CountTap),isActive: $isGameEnd, label: {
                    Text("")
                })
                
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now()+3){
                    print("Start~")
                    isGameStart = true
                    
                }
            })
            .contentShape(Rectangle())  //전체 화면 터치 위해
            .onTapGesture {
                if isGameStart{
                    CountTap += 1   //화면 터치시 CountTap +1
                }
            }
        }
    }
}
//게임이 끝나고 결과 확인
struct AfterGame:View{
    var CountTap: Int
    @State private var confirmResult :Bool = false
    var body: some View{
        VStack{
            Spacer()
            Text("you tap \(CountTap)!")
                .navigationBarHidden(true)
            Spacer()
            Button("선택하러 가기"){
                //순위 뷰로 넘어가기
                confirmResult = true
                
            }.buttonStyle(.bordered)
            NavigationLink(destination: GameResult(),isActive: $confirmResult, label:{
                Text("")
            })
        }
    }
}
//순위대로 역할 선택하기
struct GameResult: View{
    @State private var tempRole = ["총무", "드라이버", "광대", "요리사"]
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View{
        
        ScrollView{
            VStack{
                Text("역할을 선택하세요")
                
                LazyVGrid(columns: columns, alignment: .center, spacing: 20){
                    ForEach(tempRole, id:\.self){i in
                        Button(action: {
                            
                        }, label: {
                            ZStack(alignment:.bottomLeading){
                                Image("HiBear").resizable()
                                    .frame(width: 150)
                                
                                Text(i)
                                    .padding()
                                    .foregroundColor(.black)
                            }
                        })
                        
                    }
                }
            }.navigationBarHidden(true)
        }
    }
}
struct TapTap_Previews: PreviewProvider {
    static var previews: some View {
        TapTap()
    }
}
