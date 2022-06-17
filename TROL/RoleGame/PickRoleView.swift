//
//  PickRoleView.swift
//  TROL
//
//  Created by Chicken on 2022/06/15.
//

import SwiftUI

struct PickRoleView: View {
    
    @EnvironmentObject var travelData: TravelData
    @EnvironmentObject var roleData: RoleData
    @EnvironmentObject var tempUsers: TempUsers
    
    @State var selectedRole: Role = Role.defaultRoles[0]
    private let columns = [ GridItem(.adaptive(minimum: 100)) ]
    
    @State private var usingRoles: [Role] = [Role.defaultRoles[0], Role.defaultRoles[1],Role.defaultRoles[2],Role.defaultRoles[3],Role.defaultRoles[4],Role.defaultRoles[5]]
    
    @State var isTapped: [Bool] = [false, false, false, false, false, false]
    @State var userIndex: Int = 0
    
    @State var tempIndex: Int = 0
    @State var order: Int = 0
    @Binding var isSheetShowing: Bool
    var body: some View {
        VStack {
            
            HStack {
                Text("역할 선택하기")
                    .font(.custom("Happiness-Sans-Bold", size: 22))
                
                Spacer()
                NavigationLink(destination: {
                    RoleDictionaryView()
                }, label: {
                    Image(systemName: "info.circle")
                        .foregroundColor(Color("TrolGreen"))
                })
            }
            .padding()
            
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
            
            VStack {
                Text("지금 역할을 고를 사람은?")
                    .font(.custom("Happiness-Sans-Title", size: 17))
                    .foregroundColor(Color("TrolGreen"))

                Text("\(travelData.travel.users[order].name)")
                    .font(.custom("Happiness-Sans-Title", size: 50))
                    .foregroundColor(Color("TrolGreen"))
            }
            
            
            LazyVGrid(columns: columns, spacing: 13) {
                ForEach(travelData.travel.usingRoles.indices, id: \.self) { index in
                    Button {
                        
                        self.selectedRole = travelData.travel.usingRoles[index]
                        
                        for idx in 0..<travelData.travel.usingRoles.count {
                            if idx != index {
                                travelData.travel.usingRoles[idx].isChecked = false
                            }
                        }
                        
                        travelData.travel.usingRoles[index].isChecked.toggle()
                        
                        tempIndex = index
                        
                        travelData.travel.users[0].myRole = selectedRole
                        
                    } label: {
                        ZStack{
                            RoleGridView(role: $travelData.travel.usingRoles[index])
                            if isTapped[index] {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                                    .frame(width: 110, height: 110)
                                    .opacity(0.5)
//                                    .overlay{
//                                        Text("\(travelData.travel.users[order-1].name)")
//                                            .font(.custom("Happiness-Sans-Bold", size: 28))
//                                            .foregroundColor(.white)
//                                    }
                            }
                        }
                    }
                }
            }
            
            Spacer()
            
            
            //            NavigationLink(isActive: Binding<Bool>(get: {
            //                isTapped
            //            }, set: { isTapped = $0; print("asd")
            //            })) {
            //                EmptyView()
            //            } label: {
            //                Text("확인")
            //                    .font(.custom("Happiness-Sans-Bold", size: 12))
            //                    .foregroundColor(.white)
            //                    .frame(width: 354, height: 54)
            //                    .background(Color("TrolGreen"))
            //                    .cornerRadius(10)
            //            }
            
            
            Button(action: {
                travelData.travel.users[order].myRole = selectedRole
                
//                print(travelData.travel.users[order].name, travelData.travel.users[order].myRole!.name)
                
                userIndex = tempIndex
                isTapped[userIndex] = true
//                travelData.travel.usingRoles[userIndex].isChecked.toggle()
                isSheetShowing = false
                var tempRole: Role = Role.defaultRoles[0]
                if order < travelData.travel.users.count - 1 { order += 1 }
                for index in 0..<travelData.travel.users.count{
                    if(travelData.travel.usingRoles[index].isChecked){
                        travelData.travel.users[0].myRole = selectedRole
                        
                    }
                    else{
                        if(index == 0){
                            tempRole = travelData.travel.usingRoles[0]
                        }
                        else{
                            travelData.travel.users[index].myRole = travelData.travel.usingRoles[index]
                        }
                    }
                }
                for index in 0..<travelData.travel.users.count{
                    if let _ = travelData.travel.users[index].myRole{} else{
                        travelData.travel.users[index].myRole = tempRole
                    }
                }
//                if(userIndex < (travelData.travel.users.count - 1)){
//                    userIndex += 1
//                }
                
            }, label: {
                Text("확인")
                    .font(.custom("Happiness-Sans-Bold", size: 12))
                    .foregroundColor(.white)
                    .frame(width: 354, height: 54)
                    .background(Color("TrolGreen"))
                    .cornerRadius(10)
            })
        }
        .navigationBarHidden(true)
        .padding()
    }
}

//struct PickRoleView_Previews: PreviewProvider {
//    static var previews: some View {
//        PickRoleView(selectedRole: Role.defaultRoles[0])
//            .environmentObject(TravelData())
//    }
//}
