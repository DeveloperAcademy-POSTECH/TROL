//
//  RoleDictionaryDetailView.swift
//  TROL
//
//  Created by hurdasol on 2022/06/14.
//

import SwiftUI

struct RoleDictionaryDetailView: View {
    @EnvironmentObject var roleData: RoleData
    var body: some View{
        TabView{
            
            ForEach(roleData.roles.indices, id: \.self) { i in
                //역할 이름 & 이미지
                VStack(alignment: .leading, spacing: 33){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 354, height: 160)
                            .foregroundColor(Color("TrolYellow"))
                            .padding(.horizontal)
                        
                        Image("HiBear")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 160)
                            .offset(x: 80, y: 30)
                            .mask {
                                VStack {
                                    Rectangle()
                                        .frame(width: 350, height: 160)
                                }
                            }
                        
                        VStack(alignment: .leading) {
                            Text("\(roleData.roles[i].introducingSentence)")
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                            
                            Text("\(roleData.roles[i].name)")
                                .font(.system(size: 28))
                                .bold()
                                .foregroundColor(.black)
                        }
                        .offset(x: -90, y: 40)
                    }//zstack
                    // 역할 소개
                    VStack(alignment: .leading){
                        Text("역할 소개")
                            .font(.system(size: 20))
                            .bold()
                            .padding(.vertical, 5)
                            .foregroundColor(.black)
                        
                        ForEach(roleData.roles[i].info.indices, id: \.self) { k in
                            VStack(alignment: .leading) {
                                HStack(alignment: .firstTextBaseline) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(Color("TrolGreen"))
                                        .font(Font.body.weight(.bold))
                                    
                                    Text("\(roleData.roles[i].info[k])")
                                        .frame(width: 300, alignment: .leading)
                                        .font(.system(size: 17))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.leading)
                                }
                                .padding(.bottom, 14)
                            }
                        }
                        
                    }.padding(.horizontal)
                    //가이드
                    VStack(alignment: .leading) {
                        Text("역할 가이드")
                            .font(.system(size: 20))
                            .bold()
                            .padding(.bottom, 5)
                            .foregroundColor(.black)
                        
                        ForEach(roleData.roles[i].guide.indices, id: \.self) { p in
                            VStack(alignment: .leading) {
                                HStack(alignment: .firstTextBaseline) {
                                    Image(systemName: "quote.opening")
                                        .foregroundColor(Color("TrolGreen"))
                                    
                                    Text("\(roleData.roles[i].guide[p])")
                                        .frame(width: 300, alignment: .leading)
                                        .font(.system(size: 17))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.leading)
                                }
                                .padding(.bottom, 14)
                            }
                        }
                    }.padding(.horizontal)
                    
                    
                    Spacer()
                }//vstack
                
            }//foreach
            
        }//tabview
        .tabViewStyle(.page(indexDisplayMode: .never))
        .navigationTitle("역할 도감")
        
        
    }
}

struct RoleDictionaryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RoleDictionaryDetailView()
            .environmentObject(RoleData())
    }
}
