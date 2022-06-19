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
    @State private var checked = false
    
    @State var index: Int
    
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
                        RoundedRectangle(cornerRadius: 7)
                            .strokeBorder(Color.gray, lineWidth: 1)
                            .frame(width: 354, height: 50)
                    )

            }
            ForEach(0..<travelData.travel.users[0].toDoList.count, id:\.self) { i in
                
                CheckView(isChecked: travelData.travel.users[0].toDoList[i].isChecked, title: travelData.travel.users[0].toDoList[i].title)
                    .onTapGesture {
                        showTodoUpdate.toggle()
                        index = i
                    }
                    .sheet(isPresented: self.$showTodoUpdate){
//                        TodoUpdateView()
                        TodoUpdateView(todoId: $index)
                    }
            }
            Divider()
        }
    }
}

//struct TodoList_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoListView()
//            .environmentObject(TravelData())
//            .environmentObject(RoleData())
//    }
//}

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
