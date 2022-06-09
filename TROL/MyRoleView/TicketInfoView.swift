//
//  TicketInfoView.swift
//  TROL
//
//  Created by 김혜수 on 2022/06/08.
//

import SwiftUI

struct TicketInfoView: View {
    var body: some View {
            HStack{
                VStack(alignment: .leading){
                Text("나의 역할이 궁금하다면?")
                    .font(.system(size: 12))
                    .bold()
                    .padding(.leading, 10)
                
                Text("티켓에 있는 트롤을 클릭! 해보세요.")
                    .font(.system(size: 12))
                    .padding(.leading, 10)
                }
                Spacer()
                Text("👀")
                    .padding(.trailing, 10)
                
            }
            .frame(width: 354, height: 60)
            .background(Color("trolIvory"))
            .cornerRadius(10)
            
            
    }
}

struct TicketInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TicketInfoView()
    }
}
