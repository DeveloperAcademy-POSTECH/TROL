//
//  GridView.swift
//  TROL
//
//  Created by Chicken on 2022/06/08.
//

import SwiftUI

struct GridView: View {
    
    @Binding var testFriend: User
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("TrolDimGray"))
                .frame(width: 110, height: 110)
            
            Image("\(testFriend.myRole?.trolImage ?? "normalTROL")")
                .resizable()
                .scaledToFill()
                .offset(x: 10, y: 20)
                .frame(width: 150, height: 150)
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 110, height: 110)
                )
            
            Text(testFriend.name)
                .font(.custom("Happiness-Sans-Regular", size: 17))
                .foregroundColor(.black)
                .offset(x: -33, y: 40)
        }
    }
}

//struct GridView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridView(testFriend: .constant(Friend.friends[0]))
//    }
//}
