//
//  MyRoleView.swift
//  TROL
//
//  Created by MBSoo on 2022/06/07.
//

import SwiftUI

var dateformat: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY.MM.d"
    return formatter
}

struct MyRoleView: View {
    
    @EnvironmentObject var travelData: TravelData
    @EnvironmentObject var roleData: RoleData
 
    
    var body: some View {
        ScrollView {
            
            if let _ = travelData.travel.users[0].myRole{ //역할 O : 기존페이지
                VStack(alignment: .leading) {
                    VStack(alignment: .leading){
                    Text("나의 여행티켓").bold().font(.system(size: 28))
                        Spacer().frame(height: 13)
                    ZStack(alignment: .topLeading) {
                        TicketBackgroundView()
                        TicketContentView().padding(EdgeInsets(top: 21, leading: 18, bottom: 0, trailing: 0)) // 여행 이름 역할 등 티켓 내용
                    }
                        Spacer().frame(height: 14)
                    TicketInfoView()
                    }.padding(.leading,18)
                    Spacer().frame(height: 21)
                        TodoListView()
                    
                }
            } else { //역할X
                VStack(spacing: 0) {
                    VStack(alignment: .leading){
                        Text("나의 여행티켓").bold().font(.system(size: 28))
                        Spacer().frame(height: 203)
                        ZStack(alignment: .topLeading) {
                            TicketBackgroundView()
                            TicketContentView().padding(EdgeInsets(top: 21, leading: 18, bottom: 0, trailing: 0)) // 여행 이름 역할 등 티켓 내용
                        }
                    }
                    Spacer().frame(height: 149)
                    VStack(alignment: .center){
                        Text("아직 나의 역할이 분배되지 않았어요!").font(.system(size: 12))
                        //역할 분배하러가기 버튼(TabBar) RoleGameView
                        Button {

                        } label: {
                            Text("역할 분배 하러가기")
                                .foregroundColor(.white)
                                .font(.custom("Happiness-Sans-Bold", size: 17))
                                .bold()
                                .frame(width: 354, height: 54)
                                .background(Color("TrolGreen"))
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

struct TicketBackgroundView: View{
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("TrolYellow"))
                .frame(width: 354, height: 174)
            
            
            Image("HiBear")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 174)
                .offset(x: 110, y: 30)
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 354, height: 174)
                )
            TicketPunchingView()
        }
    }
}

struct TicketContentView: View{
    
    @EnvironmentObject var travelData: TravelData
    @EnvironmentObject var roleData: RoleData
    
    var body: some View{
        VStack(alignment:.leading, spacing: 32){
            VStack(alignment:.leading){
                Text("\(travelData.travel.name)")
                    .font(.system(size: 20))
                    .bold()
                Text("\(travelData.travel.startDate, formatter: dateformat) ~ \(travelData.travel.endDate, formatter: dateformat)")
                    .font(.system(size: 12))
            }
            HStack(spacing: 41){
                VStack(alignment:.leading) {
                    Text("이름")
                        .font(.system(size: 12))
                    Text("\(travelData.travel.users[0].name)")
                        .bold()
                        .font(.system(size: 20))
                }
                VStack(alignment:.leading){
                    Text("역할")
                        .font(.system(size: 12))
                    if let realTempRole = travelData.travel.users[0].myRole {
                        Text("\(realTempRole.name)")
                            .bold()
                            .font(.system(size: 20))
                    } else {
                        Text("-")
                            .bold()
                            .font(.system(size: 20))
                    }
                }
            }
        }
        
    }
}

struct MyRoleView_Previews: PreviewProvider {
    static var previews: some View {
        MyRoleView()
            .environmentObject(TravelData())
            .environmentObject(RoleData())
    }
}
