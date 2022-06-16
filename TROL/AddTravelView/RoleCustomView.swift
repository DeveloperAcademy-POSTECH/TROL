//
//  RoleCustomView.swift
//  TROL
//
//  Created by Chicken on 2022/06/13.
//

import SwiftUI

struct RoleCustomView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var roleData: RoleData
    
    @State var roleName: String = ""
    @State var roleInfo: [String] = [""]
    @State var roleGuide: [String] = [""]
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                Text("역할명")
                    .font(.custom("Happiness-Sans-Bold", size: 22))
                    
                VStack {
                    TextField(
                        "6자 이내의 역할명을 입력해주세요",
                        text: $roleName
                    ).modifier(ClearButton(text: $roleName))
                    .disableAutocorrection(true)
                    .padding(.trailing, -12)
                    
                    Rectangle()
                        .frame(width: 354, height: 1)
                        .offset(y: 5)
                }
                .padding(.vertical)
            }
            
            VStack(alignment: .leading) {
                Text("역할 소개")
                    .font(.custom("Happiness-Sans-Bold", size: 22))
                    .padding(.vertical)
                
                ForEach(roleInfo.indices, id: \.self) { i in
                    VStack(alignment: .leading) {
                        HStack(alignment: .firstTextBaseline) {
                            if roleInfo[i].isEmpty {
                                Image(systemName: "checkmark")
//                                    .foregroundColor(Color("DeepGray"))
                                    .font(Font.body.weight(.bold))
                            } else {
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color("TrolGreen"))
                                    .font(Font.body.weight(.bold))
                            }
                            
                            
                            TextField("최대 4개의 소개까지 입력할 수 있어요", text: $roleInfo[i])
                                .onSubmit {
                                    if roleInfo.count < 4 {
                                        roleInfo.append("")
                                    }
                                }
                        }
                        .padding(.bottom, 14)
                    }
                }
            }
//            .padding(.bottom)
            
            VStack(alignment: .leading) {
                Text("역할 가이드")
                    .font(.custom("Happiness-Sans-Bold", size: 22))
                    .padding(.vertical)
                
                ForEach(roleGuide.indices, id: \.self) { i in
                    VStack(alignment: .leading) {
                        HStack(alignment: .firstTextBaseline) {
                            if roleGuide[i].isEmpty {
                                Image(systemName: "quote.opening")
//                                    .foregroundColor(Color("DeepGray"))
                                    .font(Font.body.weight(.bold))
                            } else {
                                Image(systemName: "quote.opening")
                                    .foregroundColor(Color("TrolGreen"))
                                    .font(Font.body.weight(.bold))
                            }
                            
                            
                            TextField("최대 4개의 가이드까지 입력할 수 있어요", text: $roleGuide[i])
                                .onSubmit {
                                    if roleGuide.count < 4 {
                                        roleGuide.append("")
                                    }
                                }
                        }
                        .padding(.bottom, 14)
                    }
                }
            }
            
            Spacer()
            
            Button {
                roleData.roles.append(Role(name: roleName, info: roleInfo, guide: roleGuide, introducingSentence: "", isChecked: false))
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("새로운 역할 저장하기")
                    .foregroundColor(.white)
                    .font(.system(size: 17))
                    .bold()
                    .frame(width: 354, height: 54)
                    .background(Color("TrolGreen"))
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("역할 커스텀하기")
    }
}

struct RoleCustomView_Previews: PreviewProvider {
    static var previews: some View {
        RoleCustomView()
            .environmentObject(RoleData())
    }
}
