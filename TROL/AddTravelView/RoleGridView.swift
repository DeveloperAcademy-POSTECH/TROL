//
//  RoleGridView.swift
//  TROL
//
//  Created by Chicken on 2022/06/09.
//

import SwiftUI

struct RoleGridView: View {
    
    @Binding var role: Role
    
    var body: some View {
        ZStack {
            if role.isChecked {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("TrolGreen"), lineWidth: 3)
                    .frame(width: 110, height: 110)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("TrolDimGray"))
                    .frame(width: 110, height: 110)
            }
            
            Image("HiBear")
                .resizable()
                .scaledToFill()
                .offset(x: 15, y: 30)
                .frame(width: 110, height: 110)
                .clipped()
            
            
            switch role.name.count {
            case 1:
                Text("\(role.name)")
                    .font(.custom("Happiness-Sans-Regular", size: 12))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .offset(x: -33, y: 38)
            case 2:
                Text("\(role.name)")
                    .font(.custom("Happiness-Sans-Regular", size: 12))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .offset(x: -28, y: 38)
            case 3:
                Text("\(role.name)")
                    .font(.custom("Happiness-Sans-Regular", size: 12))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .offset(x: -23, y: 38)
            case 4:
                Text("\(role.name)")
                    .font(.custom("Happiness-Sans-Regular", size: 12))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .offset(x: -18, y: 38)
            case 5:
                Text("\(role.name)")
                    .font(.custom("Happiness-Sans-Regular", size: 12))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .offset(x: -13, y: 38)
            case 6:
                Text("\(role.name)")
                    .font(.custom("Happiness-Sans-Regular", size: 12))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .offset(x: -10, y: 38)
            default:
                Text("\(role.name)")
                    .font(.custom("Happiness-Sans-Regular", size: 12))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .offset(x: 0, y: 40)
            }
        }
    }
}

struct RoleGridView_Previews: PreviewProvider {
    static var previews: some View {
        RoleGridView(role: .constant(Role.defaultRoles[0]))
    }
}
