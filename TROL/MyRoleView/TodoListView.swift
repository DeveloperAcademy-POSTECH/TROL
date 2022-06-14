//
//  TodoList.swift
//  TROL
//
//  Created by 김혜수 on 2022/06/08.
//

import SwiftUI

struct TodoListView: View {
    
    @EnvironmentObject var travelData: TravelData
    @EnvironmentObject var roleData: RoleData
    
    @State private var showTodoCreate = false
    @State private var showTodoUpdate = false
    
    struct ToDo: Identifiable{
        var id:Int
        var title: String
        var isChecked: Bool = false
    }
    
    private var todo = [
        ToDo(id: 0, title: "항공권 가격 비교하기", isChecked: true),
        ToDo(id: 1, title: "항공권 예약하기", isChecked: false),
        ToDo(id: 2, title: "숙소+항공권 가격 정산", isChecked: false),
        ToDo(id: 3, title: "숙소 알아보기", isChecked: true),
        ToDo(id: 4, title: "내 계좌 알려주기", isChecked: true)
    ]
    
    @State private var checked = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack(){
                Text("내가 할 일").bold().font(.system(size: 28))
                    .padding([.leading], 18.5)
            }
            
            Button(action: {
                self.showTodoCreate = true
            }) {
                Text("내가 할 일 추가하기")
                    .foregroundColor(Color("TrolGreen"))
                    .bold()
                    .font(.system(size: 17))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .sheet(isPresented: self.$showTodoCreate){
                        TodoCreateView()
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.gray, lineWidth: 1)
                            .frame(width: 354, height: 50)
                    )
                
            }
            ForEach(travelData.travel.users[0].toDoList!) { item in
                CheckView(isChecked: item.isChecked, title: item.title)
                    .onTapGesture {
                        showTodoUpdate.toggle()
                    }
            }
            Divider()
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
            .environmentObject(TravelData())
            .environmentObject(RoleData())
    }
}

struct CheckView: View {
    @State var isChecked:Bool = false
    var title:String
    func toggle(){isChecked = !isChecked}
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Divider()
            HStack() {
                Spacer().frame(width: 18)
                Button(action: toggle) {
                    Image(systemName: isChecked ? "square.fill" : "square").font(.system(size: 20)).foregroundColor(Color("TrolGreen"))
                }
                Spacer().frame(width: 12)
                isChecked ? Text(title).strikethrough().font(.system(size: 17)).padding(.top, 15)
                    .padding(.bottom, 15) : Text(title).font(.system(size: 17))
                    .padding(.top, 15)
                    .padding(.bottom, 15)
            }
        }
    }
}
