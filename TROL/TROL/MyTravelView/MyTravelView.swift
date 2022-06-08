//
//  MyTravelView.swift
//  TROL
//
//  Created by MBSoo on 2022/06/07.
//

import SwiftUI

struct MyTravelView: View {
    
    @State private var isShowModal = false
    @State private var isTrvael: Bool = false
    
    @State var testFriends: [Friend] = [ocean, milky, rinda, dale, buckil, joon]
    @State var selectedFriend: Friend
    
    let columns = [ GridItem(.adaptive(minimum: 100)) ]
    
    var body: some View {
        // 타이틀
        VStack(alignment: .leading) {
            Text("진행중인 여행")
                .font(.system(size: 28))
                .bold()
                .padding()
            
            ScrollView {
                // 티켓 상단
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("졸업여행")
                                .font(.system(size: 20))
                                .bold()
                            Text("2022.06.26~2022.07.01")
                                .font(.system(size: 12))
                        }
                        
                        Spacer()
                        
                        Image(systemName: "gearshape.fill")
                    }
                    
                    Spacer()
                    
                    Text("+ 친구코드 추가하기")
                        .padding()
                        .frame(width: 312, height: 44)
                        .background(.white)
                        .cornerRadius(10)
                }
                .padding(25)
                .frame(width: 354, height: 176)
                .background(Color("trolYellow"))
                .cornerRadius(10)
                
                // 티켓 하단
                VStack(alignment: .leading) {
                    Text("나의 코드")
                        .font(.system(size: 12))
                        .bold()
                    
                    Text("3BF5GKS")
                        .bold()
                        .padding()
                        .frame(width: 312, height: 44, alignment: .leading)
                        .background(.white)
                        .cornerRadius(10)
                    
                }
                .padding(25)
                .frame(width: 354, height: 104)
                .background(Color("trolYellow"))
                .cornerRadius(10)
                
                // 친구들의 역할
                VStack(alignment: .leading) {
                    Text("친구들의 역할")
                        .font(.system(size: 22))
                        .bold()
                        .padding(.top)
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(testFriends.indices, id: \.self) { i in
                            
                            Button {
                                print("\(testFriends[i].name) called")
                                self.isShowModal = true
                                self.selectedFriend = self.testFriends[i]
                            } label: {
                                GridView(testFriend: $testFriends[i])
                                    .sheet(isPresented: self.$isShowModal) {
                                        FriendRoleView(testFriend: $selectedFriend)
                                    }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct MyTravelView_Previews: PreviewProvider {
    static var previews: some View {
        MyTravelView(selectedFriend: ocean)
    }
}
