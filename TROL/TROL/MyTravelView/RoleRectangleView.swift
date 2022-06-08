//
//  RoleRectangleView.swift
//  TROL
//
//  Created by Chicken on 2022/06/08.
//

import SwiftUI

struct RoleRectangleView: View {
    
    @Binding var testFriend: Friend
    
    var body: some View {
        
        // 친구 역할 설명 뷰
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 354, height: 160)
                .foregroundColor(Color("trolYellow"))
                .padding()
            
            Image("HiBear")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 160)
                .mask {
                    ZStack {
                        Circle()
                            .frame(width: 150, height: 150)
                    }
                }
                .offset(x: 30, y: 50)
            
            VStack(alignment: .leading) {
                Text("\(testFriend.introducingSentence)")
                    .font(.system(size: 17))
                    .foregroundColor(.black)
                
                Text("\(testFriend.role)")
                    .font(.system(size: 28))
                    .bold()
                    .foregroundColor(.black)
            }
            .offset(x: -90, y: 40)
        }
    }
}

struct RoleRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RoleRectangleView(testFriend: .constant(rinda))
    }
}
