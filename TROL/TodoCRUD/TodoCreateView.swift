//
//  TodoCreate.swift
//  TROL
//
//  Created by 김혜수 on 2022/06/10.
//

import SwiftUI

struct TodoCreateView: View {
    
    @State private var newTodo: String = ""
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Button() {
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("닫기")
                        .font(.system(size: 17))
                        .padding(.horizontal)
                        .foregroundColor(.black)
                }
            }

            Text("할 일 추가하기").font(.system(size: 28)).foregroundColor(Color.black).bold().padding([.leading], 18.5)

            TextField(
                "내용을 적어 주세요!",
                text: $newTodo
            ).modifier(ClearButton(text: $newTodo))
            .disableAutocorrection(true)
            .padding([.leading], 18.5)
            
            Divider()
             .frame(height: 1)
             .frame(width: 354)
             .background(Color.black)
             .padding(18.5)
            
            TodoInfoView().padding(EdgeInsets(top: 0, leading: 18.5, bottom: 0, trailing: 0))
            
            Spacer()
            
            Button(action: {
                presentation.wrappedValue.dismiss()
            }) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("trolGreen"))
                    .frame(width: 354, height: 50)
                    .overlay(
                        Text("저장하기")
                            .foregroundColor(Color.white)
                            .bold()
                    )
            }.padding([.leading], 18.5)
            
        }
    }
}

struct ClearButton: ViewModifier {
    @Binding var text: String

    public func body(content: Content) -> some View {
        HStack {
            content
            Button(action: {
                self.text = ""
            }) {
                Image(systemName: "multiply")
                    .foregroundColor(.secondary)
                    .padding([.trailing], 18.5)
            }
        }
    }
}

struct TodoInfoView: View {
    var body: some View {
            HStack{
                VStack(alignment: .leading){
                Text("뭐부터 해야할 지 모르겠다면 책을 눌러보세요!")
                    .font(.system(size: 12))
                    .foregroundColor(Color.black)
                    .bold()
                    .padding(.leading, 10)
                
                Text("역할 도감에서 가이딩 받을 수 있어요.")
                    .font(.system(size: 12))
                    .foregroundColor(Color.black)
                    .padding(.leading, 10)
                }
                Spacer()
                Text("📒")
                    .font(.system(size: 30))
                    .padding(.trailing, 10)
                
            }
            .frame(width: 354, height: 60)
            .background(Color("trolIvory"))
            .cornerRadius(10)
            
            
    }
}

struct TodoCreateView_Previews: PreviewProvider {
    static var previews: some View {
        TodoCreateView()
    }
}
