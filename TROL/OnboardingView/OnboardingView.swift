//
//  OnboardingView.swift
//  TROL
//
//  Created by hurdasol on 2022/06/16.
//

import SwiftUI
struct OnboardingView: View {
    
    @Binding var ShowOnBoarding : Bool
    @State private var pageIndex = 0
    var body: some View {
        
        TabView(selection: $pageIndex){
            OnboardingPage1View(pageIndex: $pageIndex).tag(0)
            OnboardingPage2View(ShowOnBoarding: $ShowOnBoarding).tag(1)
                
        }.tabViewStyle(.page(indexDisplayMode: .never))
    }
}
struct OnboardingPage1View: View{
    @Binding var pageIndex : Int
    var body: some View{
        ZStack{
            GifImage("confetti")
                
            
                
        VStack{
        //로고
            Spacer()
        Image("LogoBig")
            .resizable()
            .frame(width: 267, height: 92)
        //환영인사
        VStack{
            Text("트롤에 오신 것을")
            Text("환영합니다!")
        }.font(.custom("Happiness-Sans-Bold", size: 28))
            Spacer()
            Spacer()
        //다음으로 버튼
        Button(action: {
            pageIndex = 1
        }) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("TrolGreen"))
                .frame(width: 354, height: 56)
                .overlay(
                    Text("다음으로")
                        .foregroundColor(Color.white)
                        .bold()
                )
        }
        .padding()
    }//vstack
            
        }//zstack
        .ignoresSafeArea(.all)
    }
}
struct OnboardingPage2View:View {
    @State var NickName: String = ""
    @Binding var ShowOnBoarding: Bool
    var body: some View {
        
        VStack(spacing: 16.5){
            //닉네임 설정하기 제목
            HStack{
                Text("닉네임 설정하기")
                    .font(.custom("Happiness-Sans-Bold", size: 28))
                    .padding()
                Spacer()
            }
            Spacer().frame(height: 50)
            Image("normalTROL")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .offset(y: 30)
                .background(.green)
                .frame(width: 153, height: 153)
                .clipShape(Circle())
                .padding(.bottom)
            //텍스트 필드
            TextField(
                "닉네임을 적어 주세요",
                text: $NickName
            ).modifier(ClearButton(text: $NickName))
                .disableAutocorrection(true)
                .padding([.leading], 18.5)
            //디바이더
            Divider()
            
            //닉네임 수정 불가입니다!
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text("닉네임 수정할 수 있나요?")
                        .font(.custom("Happiness-Sans-Bold", size: 12))
                    Text("한 번 정한 닉네임은 수정할 수 없으니 신중해주세요!")
                        .font(.custom("Happiness-Sans-Regular", size: 12))
                    
                }
                
                Spacer()
                
                Text("🧩").font(.system(size: 30))
            }
            .padding()
            .background(Color("TrolIvory"))
            .cornerRadius(10)
            Spacer()
            //시작 버튼
            Button(action: {
                ShowOnBoarding.toggle()
                
            }) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("TrolGreen"))
                    .frame(width: 354, height: 56)
                    .overlay(
                        Text("새로운 여행 시작하기")
                            .foregroundColor(Color.white)
                            .bold()
                    )
            }
        }.padding()
    }
}
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(ShowOnBoarding: .constant(true))
//        OnboardingPage2View(ShowOnBoarding: .constant(true))
    }
}
