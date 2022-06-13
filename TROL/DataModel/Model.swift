//
//  Model.swift
//  TROL
//
//  Created by Chicken on 2022/06/09.
//

import Foundation

class Travel {
    var name: String
    var startTime: Date
    var endTime: Date
    var users: [User]
    var travelCode: String
    
    init(name: String, startTime: Date, endTime: Date, users: [User]) {
        self.name = name
        self.startTime = Date()
        self.endTime = Date()
        self.users = []
        self.travelCode = ""
    }
}

struct Role {
    var name: String
    var info: [String]
    var guide: [String]
}

struct User {
    var name: String
    var myRole: Role
    var toDoList: [String]
}
