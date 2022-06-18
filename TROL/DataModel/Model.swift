//
//  Model.swift
//  TROL
//
//  Created by Chicken on 2022/06/09.
//

import Foundation

// 전체적인 Travel 관리
final class TravelData: ObservableObject {
    @Published var travel: Travel = Travel(isExist: false, name: "여행", startDate: Date(), endDate: Date(), users: [User(name: "밀키", myRole: nil, toDoList: [])], usingRoles: [], travelCode: "3BF67A")
    
    func saveTravel(isExist: Bool, name: String, startDate: Date, endDate: Date, usingRoles: [Role]) {
        self.travel.isExist = true
        self.travel.name = name
        self.travel.startDate = startDate
        self.travel.endDate = endDate
        self.travel.usingRoles = usingRoles
    }
}

// 앱이 기본적으로 제공해주는 역할 모음 + 커스텀 추가 가능
final class RoleData: ObservableObject {
    @Published var roles: [Role] = Role.defaultRoles
}

struct Travel {
    var isExist: Bool
    var name: String
    var startDate: Date
    var endDate: Date
    var users: [User]
    var usingRoles: [Role]
    var travelCode: String
}


struct User {
    var name: String
    var myRole: Role?
    var toDoList: [ToDoList] = []
    
    
}

extension User {
    static var myself = User(name: "오션", myRole: nil, toDoList: [])
}

struct Role {
    var name: String
    var info: [String]
    var guide: [String]
    var introducingSentence: String
    var isChecked: Bool
    var trolImage: String
    var toDoList: [ToDoList] = []
}

struct ToDoList: Identifiable {
    var id: Int
    var title: String
    var isChecked: Bool
}

extension ToDoList {
    static var defaultToDo = [
        ToDoList(id: 0, title: "항공권 가격 비교하기", isChecked: true),
        ToDoList(id: 1, title: "항공권 예약하기", isChecked: false),
        ToDoList(id: 2, title: "숙소+항공권 가격 정산", isChecked: false),
        ToDoList(id: 3, title: "숙소 알아보기", isChecked: true),
        ToDoList(id: 4, title: "내 계좌 알려주기", isChecked: true)
    ]
}
