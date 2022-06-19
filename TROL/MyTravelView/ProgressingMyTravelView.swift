//
//  ProgressingMyTravelView.swift
//  TROL
//
//  Created by MBSoo on 2022/06/07.
//

import SwiftUI
import UIKit

//
//var dateformat: DateFormatter {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "YYYY.MM.dd"
//    return formatter
//}

struct ProgressingMyTravelView: View {
    
    @EnvironmentObject var travelData: TravelData
    @EnvironmentObject var roleData: RoleData
    
    
    let screenWidth = UIScreen.main.bounds.size.width   //화면 width
    @State private var travelName : String = "졸업여행" //여행 이름
    @State private var isShowModal = false
    @State private var isTravel: Bool = false
    @State private var myCode : String = "3BF5GKS"  //나의 코드
    @State private var FriendCode = ""
    
    @State var tempAddUser: [String] = ["오션", "린다", "데일", "버킬", "준"]
    @State var selectedFriend: User = User.myself
    
    var pasteBoard = UIPasteboard.general //나의 코드 누르면 복사
    
    let columns = [ GridItem(.adaptive(minimum: 100)) ]
    
    var body: some View {
        ScrollView {
            // 타이틀
            VStack() {
                HStack{
                Image("LogoSingle")
                    .resizable()
                    .frame(width: 97, height: 23)
                    .padding(.horizontal)
                    Spacer()
                }
                HStack{
                Text("진행중인 여행")
                    .font(.system(size: 28))
                    .bold()
                    .padding()
                    Spacer()
                }
                //티켓
                VStack {
                    // 티켓 상단
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(travelData.travel.name)
                                    .font(.custom("Happiness-Sans-Bold", size: 20))
                                //                                .bold()
                                
                                Text("\(travelData.travel.startDate, formatter: dateformat) ~ \(travelData.travel.endDate, formatter: dateformat)")
                                    .font(.system(size: 12))
                            }
                            Spacer()
                            //설정 들어가기 버튼
                            NavigationLink(destination:{
                                AddTravelView()
                            }, label:{
                                Image(systemName: "gearshape.fill")
                                    .foregroundColor(.black)
                            })
                        }
                        
                        Spacer()
                        VStack(alignment: .leading){
                            Text("나의 코드")
                                .padding(.top, 20)
                                .font(.custom("Happiness-Sans-Bold", size: 12))
                            //나의 코드 누르면 복사
                            Button(action: {
                                pasteBoard.string = self.myCode
                            }, label: {
                                Text(myCode)
                                    .bold()
                                    .padding()
                                    .foregroundColor(.black)
                                    .frame(width: screenWidth - 39*2, height: 44, alignment: .leading)
                                    .background(.white)
                                    .cornerRadius(7)
                            })
                        }
                        
                        
                        
                    }
                    //                    .padding(25)
                    //                    .frame(width: screenWidth-19*2, height: 176)
                    //                    .background(Color("TrolYellow"))
                    //                    .cornerRadius(7)
                    
                    //선
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [0.1,10]))
                        .foregroundColor(.white)
                        .padding(-50)
                        .overlay(Circle()
                            .frame(width: 20)
                            .foregroundColor(.white)
                            .offset(x: -(screenWidth/2 - 19)))
                        .overlay(Circle()
                            .frame(width: 20)
                            .foregroundColor(.white)
                            .offset(x: +(screenWidth/2 - 19))
                        )
                    
                    // 티켓 하단
                    VStack(alignment: .leading) {
                        Text("친구코드 추가하기")
                            .font(.system(size: 12))
                            .font(.custom("Happiness-Sans-Bold", size: 12))
                            .bold()
                            .padding(.top)
                        
                        TextField("+ 친구코드 추가하기", text: $FriendCode)
                            .padding()
                            .frame(width: screenWidth - 39*2, height: 44)
                            .background(.white)
                            .cornerRadius(7)
                            .disableAutocorrection(true) //자동수정 막기
                            .font(.custom("Happiness-Sans-Regular", size: 15))
                        
                            .padding(.bottom)
                            .onSubmit {
                                FriendCode = ""
                                travelData.travel.users.append(User(name: tempAddUser[0], myRole: nil, toDoList: []))
                                tempAddUser.removeFirst()
                            }
                        
                    }
                    //                    .padding(25)
                    //                    .frame(width: screenWidth - 19*2, height: 104)
                    //                    .background(Color("TrolYellow"))
                    //                    .cornerRadius(7)
                    
                }.padding(25)
                    .frame(width: screenWidth - 19*2, height: 280)
                    .background(Color("TrolYellow"))
                    .cornerRadius(7)
                   
                
                // 친구들의 역할
                VStack(alignment: .leading) {
                    Text("친구들의 역할")
                        .font(.system(size: 22))
                        .bold()
                        .padding(.top)
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(travelData.travel.users.indices, id: \.self) { i in
                            
                            Button {
//                                print("\(travelData.travel.users[i].name) called")
                                
                                // 역할 배정이 됐는가? 검사
                                if let _ = travelData.travel.users[i].myRole {
                                    self.isShowModal = true
                                }
                                
//                                print("\(travelData.travel.users[i])")
//                                print("\(travelData.travel.users)")
//                                print("\(travelData.travel.usingRoles)")
                                
//                                travelData.travel.users[0].myRole = travelData.travel.usingRoles[0]
                                
                                
                                self.selectedFriend = self.travelData.travel.users[i]
                            } label: {
                                GridView(testFriend: $travelData.travel.users[i])
                                    .sheet(isPresented: self.$isShowModal) {
                                        FriendRoleView(testFriend: $selectedFriend)
                                    }
                                    .padding(.vertical, -20)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

//선그리기 함수
struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        let start = CGPoint(x: rect.minX, y: rect.midY)
        let end = CGPoint(x: rect.maxX, y: rect.midY)
        
        return Path { p in
            p.move(to: start)
            p.addLine(to: end)
        }
    }
}


struct ProgressingTravelView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressingMyTravelView(selectedFriend: User.myself)
            .environmentObject(TravelData())
    }
}
