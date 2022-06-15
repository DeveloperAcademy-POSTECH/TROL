//
//  AddTravelView.swift
//  TROL
//
//  Created by Chicken on 2022/06/08.
//

import SwiftUI

struct AddTravelView: View {
    
    //    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //    @Binding var isTravelExist: Bool
    @EnvironmentObject var travelData: TravelData
    @EnvironmentObject var roleData: RoleData
    
    @State var travelName: String = ""
    @State var travelStartDate = Date()
    @State var travelEndDate = Date()
    @State var selectedRoles: [Role] = []
    
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
                    DatePicker("", selection: $travelStartDate, displayedComponents: .date)
                        .labelsHidden()
                        .foregroundColor(Color("TrolGreen"))
                    
                    Text("~")
                    
                    DatePicker("", selection: $travelEndDate, displayedComponents: .date)
                        .labelsHidden()
                }
                
                HStack {
                    Text("이번 여행에 필요한 역할")
                        .font(.custom("Happiness-Sans-Bold", size: 22))
                    
                    Spacer()
                    NavigationLink(destination: {
                        RoleDictionaryView()
                    }, label: {
                        Image(systemName: "info.circle")
                            .foregroundColor(Color("TrolGreen"))
                            .padding(.horizontal, 10)
                    })
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
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(roleData.roles.indices, id: \.self) { i in
                        RoleGridView(role: $roleData.roles[i])
                            .onTapGesture {
                                //                                print("\(roleData.roles[i].name) called")
                                roleData.roles[i].isChecked.toggle()
                                //                                print("\(roles[i].name): \(roleData.roles[i].isCheck)")
                                
                                if roleData.roles[i].isChecked { selectedRoles.append(roleData.roles[i]) }
                                else {
                                    guard let index = selectedRoles.firstIndex(where: { $0.name == roleData.roles[i].name }) else { return }
                                    selectedRoles.remove(at: index)
                                }
                                
                                for i in 0..<selectedRoles.count {
                                    print("\(selectedRoles[i].name), ", terminator: "")
                                }
                                print()
                            }
                    }
                    
                    NavigationLink {
                        RoleCustomView()
                    } label: {
                        CustomGridView()
                    }
                }
                .padding(.horizontal)
                
                
                // 여행 저장 버튼
                Button {
                    //                    isTravelExist.toggle()
                    
                    travelData.saveTravel(isExist: true, name: travelName, startDate: travelStartDate, endDate: travelEndDate, usingRoles: selectedRoles)
                    
                    print("\(travelData.travel)")
                    print("\(travelData.travel.isExist)")
                    //                    print(travelData.travel.usingRoles)
                    //                    print(travelData.travel)
                    //                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("새로운 여행 저장하기")
                        .foregroundColor(.white)
                        .font(.custom("Happiness-Sans-Bold", size: 17))
                        .bold()
                        .frame(width: 354, height: 54)
                        .background(Color("TrolGreen"))
                        .cornerRadius(10)
                }
                
                
            }//scrollview
        }//vstack
        //        .padding()
    }
}

struct AddTravelView_Previews: PreviewProvider {
    static var previews: some View {
        AddTravelView()
            .environmentObject(TravelData())
            .environmentObject(RoleData())
    }
}
