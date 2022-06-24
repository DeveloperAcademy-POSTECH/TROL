//
//  MyTravelView.swift
//  TROL
//
//  Created by Chicken on 2022/06/13.
//

import SwiftUI

struct MyTravelView: View {
    
    @EnvironmentObject var travelData: TravelData
    @EnvironmentObject var roleData: RoleData
    
    var body: some View {
        NavigationView{
        if travelData.travel.isExist {
            ProgressingMyTravelView()
                .navigationBarHidden(true)
        } else {
            EmptyMyTravelView()
                .navigationBarHidden(true)
        }
        }
    }
}

struct MyTravelView_Previews: PreviewProvider {
    static var previews: some View {
        MyTravelView()
    }
}
