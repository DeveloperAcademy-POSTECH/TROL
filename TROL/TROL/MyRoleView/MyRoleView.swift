//
//  MyRoleView.swift
//  TROL
//
//  Created by MBSoo on 2022/06/07.
//

import SwiftUI

struct MyRoleView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Text("나의 여행티켓").bold().font(.system(size: 28))
                ZStack(alignment: .topLeading) {
                    TicketBackgroundView()
                    TicketContentView().padding(EdgeInsets(top: 21, leading: 18, bottom: 0, trailing: 0))
                }
            }
            TicketInfoView()
        }
    }
}

struct TicketBackgroundView: View{
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("trolYellow"))
                .frame(width: 354, height: 174)
            
            Image("HiBear")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 174)
                .offset(x: 110, y: 30)
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 354, height: 174)
                )
            TicketPunchingView()
        }
    }
}

struct TicketContentView: View{
    var body: some View{
        VStack(alignment:.leading, spacing: 32){
            VStack(alignment:.leading){
                Text("졸업여행")
                    .font(.system(size: 20))
                    .bold()
                Text("2022.06.26~2022.07.01")
                    .font(.system(size: 12))
            }
            HStack(spacing: 41){
                VStack(alignment:.leading){
                    Text("이름")
                        .font(.system(size: 12))
                    Text("바밤바")
                        .bold()
                        .font(.system(size: 20))
                }
                VStack(alignment:.leading){
                    Text("역할")
                        .font(.system(size: 12))
                    Text("총무")
                        .bold()
                        .font(.system(size: 20))
                }
            }
        }

    }
}

struct MyRoleView_Previews: PreviewProvider {
    static var previews: some View {
        MyRoleView()
    }
}
