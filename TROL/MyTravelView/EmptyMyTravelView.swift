//
//  EmptyMyTravelView.swift
//  TROL
//
//  Created by Chicken on 2022/06/07.
//

import SwiftUI

struct EmptyMyTravelView: View {
    
    @State private var isShowAddTravelView: Bool = false
    
    var body: some View {
        
        // 진행중인 여행이 없을때 띄울 뷰
        NavigationView {
            VStack() {
                Text("진행중인 여행")
                    .font(.system(size: 28))
                    .bold()
                    .frame(width: 354, height: 34, alignment: .leading)
                
                Spacer()
                
                Text("휑")
                    .font(.custom("Happiness-Sans-Title.", size: 270))
                    .bold()
                    .foregroundColor(Color("trolDimGray"))
                    .overlay(Image("LyingBear")
                        .offset(y: 120)
                    )
                    .padding()
                
                Spacer()
                
                Text("아직 진행 중인 여행이 없어요!")
                    .font(.system(size: 12))
                
                NavigationLink {
                    AddTravelView()
                } label: {
                    Text("새로운 여행 추가하기")
                        .foregroundColor(.white)
                        .font(.system(size: 17))
                        .bold()
                        .frame(width: 354, height: 54)
                        .background(Color("trolGreen"))
                        .cornerRadius(10)
                }

            }
        }
    }
}

struct EmptyMyTravelView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyMyTravelView()
    }
}
