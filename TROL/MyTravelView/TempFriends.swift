//
//  TempFriends.swift
//  TROL
//
//  Created by Chicken on 2022/06/07.
//

import Foundation


// 임시 유저
struct Friend {
    var name : String
    var role: String
    var introduce: [String]
    var guiding: [String]
    var introducingSentence: String
    var roleImage: String
    
    init(name: String, role: String, introduce: [String], guiding: [String], introducingSentence: String, roleImage: String) {
        self.name = name
        self.role = role
        self.introduce = introduce
        self.guiding = guiding
        self.introducingSentence = introducingSentence
        self.roleImage = roleImage
    }
    
    init(name: String, role: String, introduce: [String], guiding: [String], introducingSentence: String) {
        self.init(name: name, role: role, introduce: introduce, guiding: guiding, introducingSentence: introducingSentence, roleImage: "")
    }
}

extension Friend {
    static let friends: [Friend] =
    [
        Friend(name: "오션", role: "총무", introduce: [
            "여행 전반을 이끌어가야 하는 리더형",
            "실수가 있어도 사랑으로 보듬어주세요",
            "여행에서 주로 공금을 관리해요",
            "계산, 결제, 내역을 정리하여 내용 공유와 정산을 해요"
        ], guiding: [
            "친구들의 여행 스타일을 조사해보세요!",
            "플랜 B를 꼭 준비하세요!"
        ], introducingSentence: "돈 관리는 내가 한다!"),
        
        Friend(name: "밀키", role: "길라잡이", introduce: [
            "모두의 이동을 책임져줄 인간 내비게이터!",
            "여행에서 주로 목적지까지 가는 길을 찾아요",
            "버스 시간을 확인하거나 택시를 잡는 일도 해요",
            "길을 찾느라 뒤에 떨어져 걸어도 잘 챙겨주세요"
        ],  guiding: [
            "국내는 카카오맵, 해외는 구글맵을 통해 길을 찾는 것을 추천해요!",
            "GPS를 킨 채로 나의 현재 위치를 보며 길을 찾으면 편리해요!",
            "우리가 갈 곳을 지도 앱에 찍어 모두에게 공유해보아요!"
        ], introducingSentence: "길찾기는 내가 한다!"),
        
        Friend(name: "린다", role: "계획자", introduce: [
            "여행을 전반적인 일정을 담당하는 여행 매니저",
            "여행에 떠나기 전에 숙소, 관광지, 카페, 음식점 등을 검색해요",
            "가장 최적인 동선과 머무를 시간을 계산해서 일정을 작성해요"
        ], guiding: [
            "여행원이 가고싶은 장소들을 미리 받아 계획을 하면 모두 만족하는 여행이 될 수 있어요",
            "관광지나 카페 등의 영업시간을 미리 체크해보아요",
            "플랜 B를 고려해서 예상치 못한 상황에도 자연스럽게 넘어갈 수 있도록 해요"
        ], introducingSentence: "계획은 내가 한다!"),
        
        Friend(name: "데일", role: "사진가", introduce: [
            "여행의 모든 순간을 사진으로 남기는 현대판 달리 반 피카소",
            "여행에서 주로 친구들과 풍경사진을 남겨요",
            "잘 찍은 사진들을 예쁘게 편집하고 공유해요"
        ], guiding: [
            "여행에 떠나기 전, 사진 핫플레이스를 미리 조사해보세요!",
            "단체포즈와 컨셉을 미리 기획해두면 더 즐거운 추억으로 남길 수 있어요!",
            "사진 어플을 여러개 준비해요!"
        ], introducingSentence: "사진은 내가 찍는다!"),
        
        
        Friend(name: "버킬", role: "커뮤니케이터", introduce: [
            "여행에서 소통을 담당하는 인간 파파고!",
            "음식을 주문하거나 길을 물어보는 등 여행에서 소통이 필요할 때 빛을 발휘해요",
            "처음보는 사람과 대화를 어려워 하는 I들의 영웅이에요"
        ], guiding: [
            "여행을 떠나기 전, 인삿말과 같은 기본 회화는 연습해 보는게 좋아요!",
            "외국어를 몰라도 우리에겐 구글 번역과 파파고, 제스처가 있어요!",
            "실수해도 괜찮아요, 외국어니까요!"
        ], introducingSentence: "외국어는 내가 한다!"),
        
        Friend(name: "준", role: "메이드", introduce: [
            "아름다운 사람은 머문 자리도 아름답다! 어지럽힌 자리를 정리하는 역할이에요",
            "설거지, 일반쓰레기 배출 뿐 아니라 분리수거까지 담당해요"
        ], guiding: [
            "설거지가 필요한 것부터 걷어낸 후, 자리를 정리하면 편해요",
            "설거지는 기름기 있는 걸 나중에! 기름기 있는 건 뜨거운 물로!",
            "카페에 갔다면 냅킨과 물티슈를 꼭 챙겨요"
        ], introducingSentence: "뒷정리는 내가 한다!")
    ]
}
