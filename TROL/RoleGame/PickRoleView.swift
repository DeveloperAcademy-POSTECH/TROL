//
//  PickRoleView.swift
//  TROL
//
//  Created by Chicken on 2022/06/15.
//

import SwiftUI

struct PickRoleView: View {

    @EnvironmentObject var travelData: TravelData
    @EnvironmentObject var tempUsers: TempUsers
    @State var selectedRole: Role = Role.defaultRoles[0]
    private let columns = [ GridItem(.adaptive(minimum: 100)) ]
    
    @State private var usingRoles: [Role] = [Role.defaultRoles[0], Role.defaultRoles[1],Role.defaultRoles[2],Role.defaultRoles[3],Role.defaultRoles[4],Role.defaultRoles[5]]
    @State var isTapped: [Bool] = [false, false, false, false, false, false]
    @State var userIndex: Int = 0
    var body: some View {
        VStack {

            HStack {
                Text("역할 선택하기")
                    .font(.custom("Happiness-Sans-Bold", size: 22))

                Spacer()

                Button {
                    print("add this area later")
                } label: {
                    Image(systemName: "info.circle")
                        .foregroundColor(Color("TrolGreen"))
                }
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


            LazyVGrid(columns: columns, spacing: 13) {
                ForEach(usingRoles.indices, id: \.self) { index in
                    Button {
//                        print("Role called")
                        self.selectedRole = usingRoles[index]
//                        print(selectedRole)

                        for idx in 0..<usingRoles.count {
                            if idx != index {
                                usingRoles[idx].isChecked = false
                            }
                        }
                        usingRoles[index].isChecked.toggle()
                    } label: {
                        ZStack{
                            RoleGridView(role: $usingRoles[index])
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                                    .frame(width: 110, height: 110)
                                    .opacity(0.3)
                                    .overlay{
                                        Text("\(travelData.travel.users[userIndex].name)")
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
                isTapped[userIndex] = true
                travelData.travel.users[userIndex].myRole = selectedRole
                if(userIndex < (travelData.travel.users.count - 1)){
                    userIndex += 1
                }
            }, label: {
                Text("확인")
                    .font(.custom("Happiness-Sans-Bold", size: 12))
                    .foregroundColor(.white)
                    .frame(width: 354, height: 54)
                    .background(Color("TrolGreen"))
                    .cornerRadius(10)
            })
        }
        .padding()
        .navigationBarHidden(true)
    }
}

struct PickRoleView_Previews: PreviewProvider {
    static var previews: some View {
        PickRoleView(selectedRole: Role.defaultRoles[0])
            .environmentObject(TravelData())
    }
}
