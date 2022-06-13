//
//  AddTravelView.swift
//  TROL
//
//  Created by Chicken on 2022/06/08.
//

import SwiftUI

struct AddTravelView: View {
    
    @State var travelName: String = ""
    @State var startDate = Date()
    @State var endDate = Date()
    
    @State var roles: [TravelRole] = [account, direction, driver, photographer, planner, communicator, crown, dj, cook, humanRouter, slave, maid]
    @State var selectedRoles: [TravelRole] = []
    
    let columns = [ GridItem(.adaptive(minimum: 100)) ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("새로운 여행 추가하기")
                .font(.custom("Happiness-Sans-Bold", size: 28))
            
            ScrollView() {
                Text("여행명")
                    .font(.custom("Happiness-Sans-Bold", size: 22))
                
                TextField("여행 명을 입력해주세요", text: $travelName)
                
                Text("여행 기간")
                    .font(.custom("Happiness-Sans-Bold", size: 22))
                
                HStack {
                    DatePicker("", selection: $startDate, displayedComponents: .date)
                        .labelsHidden()
                        .foregroundColor(Color("trolGreen"))
                    
                    Text("~")
                    
                    DatePicker("", selection: $endDate, displayedComponents: .date)
                        .labelsHidden()
                }
                
                HStack {
                    Text("이번 여행에 필요한 역할")
                        .font(.custom("Happiness-Sans-Bold", size: 22))
                    
                    Spacer()
                    
                    Button {
                        print("add this area later")
                    } label: {
                        Image(systemName: "info.circle")
                            .foregroundColor(Color("trolGreen"))
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
                .background(Color("trolIvory"))
                .cornerRadius(10)
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(roles.indices, id: \.self) { i in
                        RoleGridView(role: $roles[i])
                            .onTapGesture {
//                                print("\(roles[i].name) called")
                                roles[i].isCheck.toggle()
//                                print("\(roles[i].name): \(roles[i].isCheck)")
                                
                                if roles[i].isCheck { selectedRoles.append(roles[i]) }
                                else {
                                    guard let index = selectedRoles.firstIndex(where: { $0.name == roles[i].name }) else { return }
                                    selectedRoles.remove(at: index)
                                }
                                
                                for i in 0..<selectedRoles.count {
                                    print("\(selectedRoles[i].name), ", terminator: "")
                                }
                                print()
                            }
                    }
                    
                    CustomGridView()
                }
                .padding(.horizontal)
                
                NavigationLink {
                    EmptyView()
                } label: {
                    Text("새로운 여행 저장하기")
                        .foregroundColor(.white)
                        .font(.custom("Happiness-Sans-Bold", size: 17))
                        .bold()
                        .frame(width: 354, height: 54)
                        .background(Color("trolGreen"))
                        .cornerRadius(10)
                }
            }
        }
//        .padding()
    }
}
struct AddTravelView_Previews: PreviewProvider {
    static var previews: some View {
        AddTravelView()
    }
}
