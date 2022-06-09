//
//  Role.swift
//  TROL
//
//  Created by Chicken on 2022/06/08.
//

import Foundation

struct Role {
    var name: String
    var isCheck: Bool
    var image: String
    
    init(name: String, isCheck: Bool, image: String) {
        self.name = name
        self.isCheck = isCheck
        self.image = image
    }
    
    init(name: String) {
        self.init(name: name, isCheck: false, image: "")
    }
}

var account = Role(name: "총무")
var direction = Role(name: "길라잡이")
var driver = Role(name: "드라이버")
var photographer = Role(name: "사진가")
var planner = Role(name: "계획자")
var communicator = Role(name: "커뮤니케이터")
var crown = Role(name: "광대")
var dj = Role(name: "DJ")
var cook = Role(name: "요리사")
var humanRouter = Role(name: "인간공유기")
var slave = Role(name: "짐꾼")
var maid = Role(name: "메이드")
