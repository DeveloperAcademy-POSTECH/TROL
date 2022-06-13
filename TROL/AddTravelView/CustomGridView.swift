//
//  CustomGridView.swift
//  TROL
//
//  Created by Chicken on 2022/06/09.
//

import SwiftUI

struct CustomGridView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("trolDimGray"))
                .frame(width: 110, height: 110)
            
            Text("원하는 역할이 없다면?")
                .frame(width: 70, alignment: .leading)
                .font(.custom("Happiness-Sans-Regular", size: 12))
                .offset(y: -25)
            
            Text("+ 커스텀하기")
                .frame(width: 70, alignment: .leading)
                .font(.custom("Happiness-Sans-Bold", size: 12))
                .offset(y: 35)
        }
    }
}

struct CustomGridView_Previews: PreviewProvider {
    static var previews: some View {
        CustomGridView()
    }
}
