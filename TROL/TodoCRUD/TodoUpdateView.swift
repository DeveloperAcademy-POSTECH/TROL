//
//  TodoUpdateView.swift
//  TROL
//
//  Created by 김혜수 on 2022/06/15.
//

import SwiftUI

struct TodoUpdateView: View {
    @EnvironmentObject var travelData: TravelData
    @EnvironmentObject var roleData: RoleData
    
    @State private var updateTodo: String = ""
    @State private var tempText: String = ""
    @Environment(\.presentationMode) var presentation
    @Binding var todoId: Int
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack{
                Spacer()
                Capsule()
                    .fill(Color.black)
                    .frame(width: 50, height: 5)
                    .padding(.top, 10)
                Spacer()
            }
            HStack{
                Spacer()
                Button() {
                    travelData.travel.users[0].toDoList.remove(at: todoId)
                    todoId -= 1
                    print(todoId)
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("삭제하기")
                        .font(.system(size: 17))
                        .padding(.trailing, 18)
                        .padding(.top, 1)
                        .foregroundColor(.red)
                }
            }
            
            Text("할 일 수정하기").font(.system(size: 28)).foregroundColor(Color.black).bold().padding(.leading, 17.5).padding(.top, 16)
            TextField(
                "\(tempText)",
                text: $updateTodo
            )
                .disableAutocorrection(true)
                .padding(.leading, 18)
                .padding(.top, 8)
                .font(.system(size: 17))
                .task{
                    tempText = travelData.travel.users[0].toDoList[todoId].title
                }
//            TextField(
//                "\(travelData.travel.users[0].toDoList[todoId].title)",
//                text: $updateTodo
//            )
//                .disableAutocorrection(true)
//                .padding(.leading, 18)
//                .padding(.top, 8)
//                .font(.system(size: 17))
            Divider()
                .frame(height: 1)
                .frame(width: .infinity)
                .background(Color("Divider"))
                .padding(.top, 5.5)
                .padding(.leading)
                .padding(.trailing)
            
          
            Spacer().frame(height: 291.5)
            
            Button(action: {
                travelData.travel.users[0].toDoList[todoId].title = updateTodo
                presentation.wrappedValue.dismiss()
            }) {
                RoundedRectangle(cornerRadius: 7)
                    .fill(Color("TrolGreen"))
                    .frame(width: 354, height: 50)
                    .overlay(
                        Text("저장하고 나가기")
                            .foregroundColor(Color.white)
                            .bold()
                    )
            }.padding([.leading], 18.5)
            
            Spacer()
        }
    }
}

//struct TodoUpdateView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoUpdateView()
//    }
//}
