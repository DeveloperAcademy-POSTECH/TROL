//
//  RoleDictionaryView.swift
//  TROL
//
//  Created by hurdasol on 2022/06/14.
//

import SwiftUI

struct RoleDictionaryView: View {
    
    @EnvironmentObject var roleData: RoleData

    let columns = [ GridItem(.adaptive(minimum: 100)) ]
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(roleData.roles.indices, id: \.self) { i in
                        NavigationLink(destination:{
                            RoleDictionaryDetailView(selection: i)
                        }, label: {
                            RoleGridView(role: $roleData.roles[i])
                        })
                    }
                    
                }.navigationTitle("역할 도감")
            }
        }
    }
}

struct RoleDictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        RoleDictionaryView()
            .environmentObject(RoleData())
    }
}
