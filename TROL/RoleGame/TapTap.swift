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
        NavigationView{//임시 네비게이션 뷰
            VStack(spacing: 35){
                //게임 남은 시간 체크
                Text("남은 시간 \(timeRemaining)")
                    .font(.system(size: 50))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 7).fill(Color("TrolYellow")))
                    .foregroundColor(Color("TrolGreen"))
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
                //북 모양
                ZStack{
                    Circle().fill(Color("TrolYellow")).frame(width: 250, height: 250)
                    Circle().fill(.green).frame(width: 200, height: 200)
                    VStack{
                        HStack{
                            Spacer()
                            Circle().fill(.black).frame(width:40, height: 40)
                            Spacer().frame(width:35)
                            Circle().fill(.black).frame(width:40, height: 40)
                            Spacer()
                        }
                        Circle().trim(from: 0.0,to: 0.5).fill(.red).opacity(0.75).frame(width:150, height:60)
                        
                    };
                    
                }.navigationTitle("TapTap!")
                
                
                //게임 탭 한 횟수 표시
                Text("you tap \(CountTap) !")
                //.foregroundColor(Color("TrolGreen"))
                    .font(.system(size: 30))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 7).fill(Color("TrolYellow")))
                NavigationLink(destination:AfterGame(CountTap: CountTap),isActive: $isGameEnd, label: {
                    Text("")
                })
            }
            .frame(width: screenWidth, height: screenHeight)
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now()+3){
                    print("Start~")
                    isGameStart = true                }
            })
            .contentShape(Rectangle()).ignoresSafeArea(.all)  //전체 화면 터치 위해
            .onTapGesture {
                if isGameStart{
                    CountTap += 1   //화면 터치시 CountTap +1
                }
            }
            .background(Color("TrolIvory"))
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
            Text("you got \(CountTap) point!")
                .multilineTextAlignment(.center)
                .font(.system(size: 50))
                .frame(width:300, height:300 )
                .padding()
                .background(RoundedRectangle(cornerRadius: 7).fill(Color("TrolYellow")))
                .foregroundColor(Color("TrolGreen"))
                .navigationBarHidden(true)
            
            Spacer()
            //다음으로 가기
            NavigationLink(destination: GameResult(),isActive: $confirmResult, label:{
                Text("")})
            //선택하러 가기 버튼
            Button(action: {
                confirmResult = true
            }, label:{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("TrolGreen"))
                    .frame(width: 354, height: 50)
                    .overlay(
                        Text("선택하러 가기")
                            .foregroundColor(Color.white)
                            .bold()
                    )
                
            })
            
        }//vstack
        .navigationTitle("TapTap결과창")
        
        
    }
}
//순위대로 역할 선택하기 //추후 버킬코드로 갈아 끼울 예정
struct GameResult: View{
    @State private var tempRole = ["총무", "드라이버", "광대", "요리사"]
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View{
        
        ScrollView{
            VStack{
                HStack(alignment: .center, spacing: 200) {
                    Text("역할 선택하기")
                        .font(.custom("Happiness-Sans-Bold", size: 22))
                    
                    
                    Button {
                        print("add this area later")
                    } label: {
                        Image(systemName: "info.circle")
                            .foregroundColor(Color("TrolGreen"))
                    }
                    
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text("각 역할들의 디테일이 궁금할 땐?")
                            .font(.custom("Happiness-Sans-Bold", size: 12))
                        
                        HStack {
                            Image(systemName: "info.circle")
                                .font(Font.subheadline.weight(.light))
                            
                            Text("를 클릭하면 역할 도감을 볼 수 있어요!")
                                .font(.custom("Happiness-Sans-Regular", size: 12))
                                .offset(x: -8)
                        }
                    }
                    
                    Spacer()
                    
                    Text("👀")
                }
                .padding()
                .background(Color("TrolIvory"))
                .cornerRadius(10)
                
                
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
            }
        }.navigationBarHidden(true)
    }
}

struct TapTap_Previews: PreviewProvider {
    static var previews: some View {
                        TapTap()
        //        AfterGame(CountTap: 3)
//        GameResult()
    }
}
