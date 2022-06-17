//
//  AddTravelView.swift
//  TROL
//
//  Created by Chicken on 2022/06/08.
//

import SwiftUI

struct AddTravelView: View {
    
    @EnvironmentObject var travelData: TravelData
    @EnvironmentObject var roleData: RoleData
    
    @State var travelName: String = ""
    @State var travelStartDate = Date()
    @State var travelEndDate = Date()
    @State var selectedRoles: [Role] = []
    
    let columns = [ GridItem(.adaptive(minimum: 100)) ]
    
    var body: some View {
        ScrollView() {
            VStack(alignment: .leading, spacing: 18) {
                HStack{
                Text("진행중인 여행")
                    .font(.system(size: 28))
                    .bold()
                    .padding()
                    Spacer()
                }
                // 여행명 & 여행명 입력
                VStack(alignment: .leading) {
                    Text("여행명")
                        .font(.custom("Happiness-Sans-Bold", size: 22))
                    
                    TextField(
                        "여행 명을 입력해주세요",
                        text: $travelName
                    ).modifier(ClearButton(text: $travelName))
                    .disableAutocorrection(true)
                    .padding(.trailing, -12)
                    
                    Rectangle()
                        .frame(width: 354, height: 1)
//                        .foregroundColor()
                        .offset(y: 5)
                }
                .padding(.bottom)
                
                // 여행 기간 설정
                VStack(alignment: .leading) {
                    Text("여행 기간")
                        .font(.custom("Happiness-Sans-Bold", size: 22))
                    
                    HStack(alignment: .top) {
                        DatePicker("", selection: $travelStartDate, displayedComponents: .date)
                            .labelsHidden()
                        
                        Text("~")
                            .offset(y: 5)
                        
                        DatePicker("", selection: $travelEndDate, displayedComponents: .date)
                            .labelsHidden()
                    }
                }
                .padding(.bottom)
                
                VStack {
                    HStack {
                        Text("이번 여행에 필요한 역할")
                            .font(.custom("Happiness-Sans-Bold", size: 22))
                        
                        Spacer()
                        
                        NavigationLink {
                            RoleDictionaryView()
                        } label: {
                            Image(systemName: "info.circle")
                                .foregroundColor(Color("TrolGreen"))
                                .padding(.trailing, 5)
                        }
                        
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
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
                    .padding(.bottom, 5)
                    
                    LazyVGrid(columns: columns, spacing: 13) {
                        ForEach(roleData.roles.indices, id: \.self) { i in
                            RoleGridView(role: $roleData.roles[i])
                                .onTapGesture {
                                    roleData.roles[i].isChecked.toggle()
                                    
                                    if roleData.roles[i].isChecked { selectedRoles.append(roleData.roles[i]) }
                                    else {
                                        guard let index = selectedRoles.firstIndex(where: { $0.name == roleData.roles[i].name }) else { return }
                                        selectedRoles.remove(at: index)
                                    }
                                }
                                .padding(.vertical, -20)
                        }
                        
                        NavigationLink {
                            RoleCustomView()
                        } label: {
                            CustomGridView()
                        }
                    }
                    
                    
                    // 여행 저장 버튼
                    Button {
                        travelData.saveTravel(isExist: true, name: travelName, startDate: travelStartDate, endDate: travelEndDate, usingRoles: selectedRoles)
                        
                        print("\(travelData.travel)")
                        print("\(travelData.travel.isExist)")
                        
                        for i in 0..<travelData.travel.usingRoles.count {
                            travelData.travel.usingRoles[i].isChecked = false
                        }
                    } label: {
                        Text("새로운 여행 저장하기")
                            .foregroundColor(.white)
                            .font(.custom("Happiness-Sans-Bold", size: 17))
                            .bold()
                            .frame(width: 354, height: 54)
                            .background(Color("TrolGreen"))
                            .cornerRadius(10)
                    }
                    .padding(.top, 10)
                }
            }
            .padding()
            .navigationBarHidden(true)
            
        }//scrollview
    }
}

struct AddTravelView_Previews: PreviewProvider {
    static var previews: some View {
        AddTravelView()
            .environmentObject(TravelData())
            .environmentObject(RoleData())
    }
}
