//
//  TodoList.swift
//  TROL
//
//  Created by 김혜수 on 2022/06/08.
//

import SwiftUI

struct TodoList: View {
    var body: some View {
        VStack{
            HStack{
                Text("내가 할 일").bold().font(.system(size: 28))
                Spacer()
                Button("편집하기"){
                    
                }
            }
            
            Button(action: {
                print("할 일 추가뷰 연결")
            }) {
                Text("내가 할 일 추가하기")
                    .foregroundColor(Color.green)
                    .bold()
                    .font(.system(size: 17))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                                    .strokeBorder(.gray, lineWidth: 1)
                                    .frame(width: 354, height: 50)
                    )

            }
           ListView()
        }
    }
}

struct Weather: Identifiable {
    var id = UUID()
    var image: String
    var temp: Int
    var city: String
}
struct ListView: View {
    
    let modelData: [Weather] =
    [
        Weather(image: "cloud.rain", temp: 21, city: "Amsterdam"),
        Weather(image: "cloud.sun.rain", temp: 18, city: "London"),
        Weather(image: "sun.max", temp: 25, city: "Paris"),
        Weather(image: "cloud.sun", temp: 23, city: "Tokyo")]
    
    var body: some View {
        List(modelData) { weather in
            HStack {
                // 2.
                Image(systemName: weather.image)
                    .frame(width: 50, height: 10, alignment: .leading)
                Text("\(weather.temp)º")
                    .frame(width: 50, height: 10, alignment: .leading)
                VStack {
                    Text(weather.city)
                }
            }.font(.title)
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}
