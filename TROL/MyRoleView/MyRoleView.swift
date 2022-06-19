//
//  MyRoleView.swift
//  TROL
//
//  Created by MBSoo on 2022/06/07.
//

import SwiftUI

var dateformat: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY.MM.dd"
    return formatter
}

struct MyRoleView: View {
    
    @EnvironmentObject var travelData: TravelData
    @EnvironmentObject var roleData: RoleData
    
    @Binding var selection: Int
    
    var body: some View {
        NavigationView{
            if let _ = travelData.travel.users[0].myRole{ //역할 O : 기존페이지
                ScrollView{
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading){
                            HStack{
                            Image("LogoSingle")
                                .resizable()
                                .frame(width: 97, height: 23)
                                .padding(.horizontal)
                                Spacer()
                            }
                            HStack{
                                Text("나의 여행티켓")
                                    .font(.system(size: 28))
                                    .bold()
                                    .padding()
                                Spacer()
                            }
                            Spacer().frame(height: 13)
                            ZStack(alignment: .topLeading) {
                                TicketBackgroundView(travelData: travelData)
                                TicketContentView().padding(EdgeInsets(top: 21, leading: 18, bottom: 0, trailing: 0))
                            }
                            Spacer().frame(height: 14)
                            TicketInfoView()
                        }
                        .padding(.leading,18)
                        Spacer().frame(height: 21)
                        TodoListView(index: 0)
                    }
                    
                }
                .navigationBarHidden(true)} else { //역할X
                    VStack(spacing: 0) {
                        VStack(){
                            HStack{
                            Image("LogoSingle")
                                .resizable()
                                .frame(width: 97, height: 23)
                                .padding(.horizontal)
                                Spacer()
                            }
                            HStack{
                                Text("나의 여행티켓")
                                    .font(.system(size: 28))
                                    .bold()
                                    .padding()
                                Spacer()
                            }
                            Spacer()//.frame(height: 203)
                            ZStack(alignment: .topLeading) {
                                TicketBackgroundView(travelData: travelData)
                                TicketContentView().padding(EdgeInsets(top: 21, leading: 18, bottom: 0, trailing: 0))
                            }
                            Spacer()
                        }
                        Spacer()//.frame(height: 149)
                        VStack(alignment: .center){
                            Text("아직 나의 역할이 분배되지 않았어요!")
                                .font(.custom("Happiness-Sans-Regular", size: 12))
                            //역할 분배하러가기 버튼(TabBar) RoleGameView
                            Button {
                                selection = 1
                                
                            } label: {
                                Text("역할 분배 하러가기")
                                    .foregroundColor(.white)
                                    .font(.custom("Happiness-Sans-Bold", size: 17))
                                    .bold()
                                    .frame(width: 354, height: 54)
                                    .background(Color("TrolGreen"))
                                    .cornerRadius(7)
                                    .padding(.bottom)
                            }
                        }
                        
                    }.navigationBarHidden(true)
                }
        }
    }
}

struct TicketBackgroundView: View{
    var travelData : TravelData
    @State private var tempImage: String = ""
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 7)
                .fill(Color("TrolYellow"))
                .frame(width: 354, height: 174)
            
            //travelData.travel.users[0].myRole?.trolImage를 부르고 싶은데
            //travelData.travel.users[0].myRole의 name이 Role.defuaultRoles[]의 name과 일치하는 trolImage를 불러야함
            
            Image(travelData.travel.users[0].myRole == nil ? "normalTROL" : tempImage)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 200)
                .offset(x: 110, y: 30)
                .mask(
                    RoundedRectangle(cornerRadius: 7)
                        .frame(width: 354, height: 174)
                )
                .onAppear(){
                    if travelData.travel.users[0].myRole != nil{
                    for i in 0..<Role.defaultRoles.count {
                        if travelData.travel.users[0].myRole?.name == Role.defaultRoles[i].name{
                            tempImage = Role.defaultRoles[i].trolImage
                        }
                        }
                    }
                }
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
                    .padding(.top, 7)
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
        MyRoleView(selection: .constant(0))
            .environmentObject(TravelData())
            .environmentObject(RoleData())
    }
}
