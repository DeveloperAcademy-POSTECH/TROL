//
//  ChopsticksResultView.swift
//  TROL
//
//  Created by MBSoo on 2022/06/17.
//

import SwiftUI

struct ChopsticksResultView:View{
    //임시 유저
    @StateObject var tempUsers = TempUsers()
    @State private var confirmResult :Bool = false
    @Binding var isSheetShowing: Bool
    var randomHeight: [Double]
    var winnerHeight: Double
    var body: some View{
        VStack{
            Text("젓가락뽑기")
                .foregroundColor(Color("TrolGreen"))
                .font(.custom("Happiness-Sans-Bold", size: 28))
                .bold()
                .background(Image("Cloud")
                    .resizable().frame(width: 261, height: 90))
                .padding(.top, 100)
                .padding(.bottom, 50)
            HStack(alignment:.top, spacing:75){
                VStack{
                    Spacer().frame(height:25)
                    Text("내 젓가락 길이")
                        .font(.custom("Happiness-Sans-Title", size: 17))
                        
                }
                Text("\(Int(winnerHeight/10))")
                    .font(.custom("Happiness-Sans-Title", size: 120))
                    .lineLimit(20)
            }.foregroundColor(Color("TrolGreen"))
            
                .frame(width:354,height:146)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color("TrolIvory")))
            VStack{
                HStack{
                    Text("랭킹 살펴보기")
                        .padding()
                        .font(.custom("Happiness-Sans-Title", size: 28))
                    Spacer()
                }
                
                List{
                    
                    ForEach(tempUsers.sortedRank.indices, id: \.self){index in
                        HStack(spacing:15){
                            Text("\(index + 1)")
                            Text(tempUsers.sortedRank[index].name)
                            Spacer()
                            Text("\(tempUsers.sortedRank[index].countTap)")
                        }
                        .foregroundColor(tempUsers.sortedRank[index].name == "밀키" ? Color("TrolGreen") : Color.black)
                    }.font(.custom("Happiness-Sans-Regular", size: 17))
                    
                }.listStyle(.inset)
                
            }.onAppear(){
                for index in tempUsers.tempRank.indices{
                    if tempUsers.tempRank[index].name == "오션" {
//                        tempUsers.tempRank[index].countTap = CountTap
                    }
                }
            }
            Spacer()
                
            //다음으로 가기
            NavigationLink(destination: PickRoleView(isSheetShowing: $isSheetShowing),isActive: $confirmResult, label:{
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
                
            }).navigationBarHidden(true)
            
            }
        .onAppear(){
            for index in 0..<tempUsers.tempRank.count{
                if(randomHeight[index] == winnerHeight){
                    tempUsers.tempRank[0].countTap = Int(winnerHeight/10)
                }
                else{
                    tempUsers.tempRank[index].countTap = Int(randomHeight[index]/10)
                }
            }
            
        }//vstack
        
        
        
    }
}

//struct ChopsticksResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChopsticksResultView()
//    }
//}
