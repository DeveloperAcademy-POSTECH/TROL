//
//  RoleModal.swift
//  TROL
//
//  Created by hurdasol on 2022/06/08.
//

import SwiftUI

struct RoleModal: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            ZStack{
                Rectangle()
                    .foregroundColor(Color("TrolYellow"))
                HStack{
                    VStack(alignment: .leading){
                        Text("돈관리는 내가 한다!")
                            .font(.system(size: 17))
                        Text("총무")
                            .font(.system(size: 28))
                            .bold()
                        
                    }.padding()
                    Image("TrolHi")
                        .resizable()
                        .frame(width: 152, height: 152)
                }
                
            }
            Text("역할 소개")
            HStack{
                Image(systemName: "quote.opening")
                Text("fdfd")
            }
            
            
        }.padding()
        
        
        
    }
}

struct RoleModal_Previews: PreviewProvider {
    static var previews: some View {
        RoleModal()
    }
}
