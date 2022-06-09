//
//  GridView.swift
//  TROL
//
//  Created by Chicken on 2022/06/08.
//

import SwiftUI

struct GridView: View {
    
    @Binding var testFriend: Friend
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("trolDimGray"))
                .frame(width: 110, height: 110)
            
            Text(testFriend.name)
                .foregroundColor(.black)
                .offset(x: -33, y: 40)
            
            Image("HiBear")
                .resizable()
                .scaledToFill()
                .offset(x: 15, y: 30)
                .frame(width: 110, height: 110)
                .clipped()
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(testFriend: .constant(Friend.friends[0]))
    }
}
