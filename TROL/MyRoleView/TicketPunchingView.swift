//
//  TicketPunchingView.swift
//  TROL
//
//  Created by 김혜수 on 2022/06/08.
//

import SwiftUI

struct TicketPunchingView: View {
    var body: some View {
        VStack{
            Circle()
                .fill(Color.white)
                .frame(width: 20, height: 20)
            ForEach(0..<11){ num in
                Circle()
                    .fill(Color.white)
                    .frame(width: 5, height: 5)
            }
            Circle()
                .fill(Color.white)
                .frame(width: 20, height: 20)
        }.frame(width: 120, height: 100, alignment: .trailing)
        
    }
}

struct TicketPunchingView_Previews: PreviewProvider {
    static var previews: some View {
        TicketPunchingView()
    }
}
