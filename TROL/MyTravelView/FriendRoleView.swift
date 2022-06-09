//
//  FriendRoleView.swift
//  TROL
//
//  Created by Chicken on 2022/06/07.
//

import SwiftUI

struct FriendRoleView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var testFriend: Friend
    
    var body: some View {
        
        // 나의 여행에서 친구들을 탭했을때 보여줄 뷰
        VStack {
            
            // 닫기 버튼
            HStack{
                Spacer()
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 50, height: 5)
                    .foregroundColor(.black)
                Spacer()
            }
            HStack{
                Spacer()
                Button() {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("닫기")
                        .font(.system(size: 17))
                        .padding(.horizontal)
                        .foregroundColor(.black)
                }
                
                
                
            }
            
            
            
            // 역할 이름 & 이미지
            RoleRectangleView(testFriend: $testFriend)
            
            // 역할 소개
            VStack(alignment: .leading) {
                Text("역할 소개")
                    .font(.system(size: 20))
                    .bold()
                    .padding(.vertical, 5)
                    .foregroundColor(.black)
                
                ForEach(testFriend.introduce.indices, id: \.self) { i in
                    VStack(alignment: .leading) {
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: "checkmark")
                                .foregroundColor(Color("trolGreen"))
                                .font(Font.body.weight(.bold))
                            
                            Text("\(testFriend.introduce[i])")
                                .frame(width: 300, alignment: .leading)
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(.bottom, 14)
                    }
                }
            }
            
            
            // 역할 가이드
            VStack(alignment: .leading) {
                Text("역할 가이드")
                    .font(.system(size: 20))
                    .bold()
                    .padding(.bottom, 5)
                    .foregroundColor(.black)
                
                ForEach(testFriend.guiding.indices, id: \.self) { i in
                    VStack(alignment: .leading) {
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: "quote.opening")
                                .foregroundColor(Color("trolGreen"))
                            
                            Text("\(testFriend.guiding[i])")
                                .frame(width: 300, alignment: .leading)
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(.bottom, 14)
                    }
                }
            }
            Spacer()
        }
        
    }
}

struct FriendRoleView_Previews: PreviewProvider {
    static var previews: some View {
        FriendRoleView(testFriend: .constant(Friend.friends[0]))
    }
}
