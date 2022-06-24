//
//  RoleDictionaryView.swift
//  TROL
//
//  Created by hurdasol on 2022/06/14.
//

import SwiftUI

struct RoleDictionaryView: View {
    
    @EnvironmentObject var roleData: RoleData

    let columns = [ GridItem(.adaptive(minimum: 116, maximum: 116)) ]
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(roleData.roles.indices, id: \.self) { i in
                        NavigationLink(destination:{
                            RoleDictionaryDetailView(selection: i)
                        }, label: {
                            RoleGridView(role: $roleData.roles[i])
                                .padding(.vertical, -20)
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
