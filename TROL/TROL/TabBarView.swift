//
//  TabBarView.swift
//  TROL
//
//  Created by MBSoo on 2022/06/07.
//

import SwiftUI

struct TabBarView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection){
            MyRoleView()
                .tabItem{
                    MyRoleTab()
                }
                .tag(0)
            RoleGameView()
                .tabItem{
                    RoleGameTab()
                }
                .tag(1)
            MyTravelView()
                .tabItem{
                    MyTravelTab()
                }
                .tag(2)
            
        }
        .accentColor(Color("TrolGreen"))
    }
}


struct MyRoleTab:View{
    var body: some View{
        VStack{
        Image(systemName: "person.crop.square.fill")
            .resizable()
            .foregroundColor(.gray)
            Text("나의 역할")
                .font(.custom("Happiness-Sans-Regular", size: 20))
        }
    }
}

struct RoleGameTab: View{
    var body: some View{
        VStack{
        Image(systemName: "checkmark.seal.fill")
            .resizable()
            .foregroundColor(.gray)
            Text("역할 분배")
                .font(.custom("Happiness-Sans-Regular", size: 20))
        }
    }
}

struct MyTravelTab:View{
    var body: some View{
        VStack{
        Image(systemName: "square.grid.2x2")
            .resizable()
            .foregroundColor(.gray)
            Text("나의 여행")
                .font(.custom("Happiness-Sans-Regular", size: 20))
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
