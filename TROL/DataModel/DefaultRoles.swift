//
//  DefaultRoles.swift
//  TROL
//
//  Created by Chicken on 2022/06/13.
//

import Foundation

extension Role {
    static var defaultRoles: [Role] = [
        Role(name: "총무", info: [
            "여행 전반을 이끌어가야 하는 리더형",
            "실수가 있어도 사랑으로 보듬어주세요",
            "여행에서 주로 공금을 관리해요",
            "계산, 결제, 내역을 정리하여 내용 공유와 정산을 해요"
        ], guide: [
            "친구들의 여행 스타일을 조사해보세요!",
            "플랜 B를 꼭 준비하세요!"
        ], introducingSentence: "돈 관리는 내가 한다!", isChecked: false
            , trolImage: "managerTROL",
             toDoList: [ToDoList(id: 0, title: "여행 즐겁게 하기", isChecked: true),
                        ToDoList(id: 1, title: "서로 예쁜말 하기", isChecked: true),
                        ToDoList(id: 2, title: "항공권 예약하기", isChecked: false),
                        ToDoList(id: 3, title: "숙소+항공권 가격 정산", isChecked: false),
                        ToDoList(id: 4, title: "내 계좌 알려주기", isChecked: false)]),
        
        Role(name: "길라잡이", info: [
            "모두의 이동을 책임져줄 인간 내비게이터!",
            "여행에서 주로 목적지까지 가는 길을 찾아요",
            "버스 시간을 확인하거나 택시를 잡는 일도 해요",
            "길을 찾느라 뒤에 떨어져 걸어도 잘 챙겨주세요"
        ], guide: [
            "국내는 카카오맵, 해외는 구글맵을 통해 길을 찾는 것을 추천해요!",
            "GPS를 킨 채로 나의 현재 위치를 보며 길을 찾으면 편리해요!",
            "우리가 갈 곳을 지도 앱에 찍어 모두에게 공유해보아요!"
        ], introducingSentence: "길찾기는 내가 한다!", isChecked: false
            , trolImage: "guideTROL",
             toDoList: [ToDoList(id: 0, title: "여행 즐겁게 하기", isChecked: true),
                        ToDoList(id: 1, title: "서로 예쁜말 하기", isChecked: true),
                        ToDoList(id: 2, title: "여행 목적지 위치 저장하기", isChecked: false),
                        ToDoList(id: 3, title: "목적지까지 가는 경로 탐색하기", isChecked: false),
                        ToDoList(id: 4, title: "목적지 찾을때 앞장서기", isChecked: false)]),
        
        
        Role(name: "드라이버", info: [
            "여행에서 차량을 운전하여 이동을 책임지는 도로 위 리더!",
            "주유와 차량청소를 포함한 차량관리를 도맡아서 해요",
            "길찾기를 활용해서 경로와 주차장을 확인해요"
        ], guide: [
            "차량 이용에 대한 주의사항을 여행원들과 미리 공유해요",
            "네비게이션을 미리 업그레이드 해둬요",
            "음주 예정이라면 다른 이동수단을 선택할 수 있도록 여행원들에게 알려요",
            "주유 예정이라면 근처에 가장 저렴한 곳을 미리 체크해둬요"
        ], introducingSentence: "운전은 내가 한다!", isChecked: false
             , trolImage: "driverTROL",
             toDoList: [ToDoList(id: 0, title: "여행 즐겁게 하기", isChecked: true),
                        ToDoList(id: 1, title: "서로 예쁜말 하기", isChecked: true),
                        ToDoList(id: 2, title: "렌트할 때 미리 차 사진 찍어놓기", isChecked: false),
                        ToDoList(id: 3, title: "연료확인 하기", isChecked: false),
                        ToDoList(id: 4, title: "안전운전 하기", isChecked: false)]),
        
        
        Role(name: "사진가", info: [
            "여행의 모든 순간을 사진으로 남기는 현대판 달리 반 피카소",
            "여행에서 주로 친구들과 풍경사진을 남겨요",
            "잘 찍은 사진들을 예쁘게 편집하고 공유해요"
        ], guide: [
            "여행에 떠나기 전, 사진 핫플레이스를 미리 조사해보세요!",
            "단체포즈와 컨셉을 미리 기획해두면 더 즐거운 추억으로 남길 수 있어요!",
            "사진 어플을 여러개 준비해요!"
        ], introducingSentence: "사진은 내가 찍는다!", isChecked: false
             , trolImage: "photoTROL",
             toDoList: [ToDoList(id: 0, title: "여행 즐겁게 하기", isChecked: true),
                        ToDoList(id: 1, title: "서로 예쁜말 하기", isChecked: true),
                        ToDoList(id: 2, title: "장소가 바뀔 때마다 사진 찍기", isChecked: false),
                        ToDoList(id: 3, title: "친구들 프로필 사진 건져주기", isChecked: false)]),
        
        
        Role(name: "계획자", info: [
            "여행을 전반적인 일정을 담당하는 여행 매니저",
            "여행에 떠나기 전에 숙소, 관광지, 카페, 음식점 등을 검색해요",
            "가장 최적인 동선과 머무를 시간을 계산해서 일정을 작성해요"
        ], guide: [
            "여행원이 가고싶은 장소들을 미리 받아 계획을 하면 모두 만족하는 여행이 될 수 있어요",
            "관광지나 카페 등의 영업시간을 미리 체크해보아요",
            "플랜 B를 고려해서 예상치 못한 상황에도 자연스럽게 넘어갈 수 있도록 해요"
        ], introducingSentence: "계획은 내가 한다!", isChecked: false
             , trolImage: "plannerTROL",
             toDoList: [ToDoList(id: 0, title: "여행 즐겁게 하기", isChecked: true),
                        ToDoList(id: 1, title: "서로 예쁜말 하기", isChecked: true),
                        ToDoList(id: 2, title: "여행 구성원들이 가고 싶은 장소 합의하여 정하기", isChecked: false),
                        ToDoList(id: 3, title: "정해진 장소에 맞춰 일정 짜기", isChecked: false)]),
        
        
        Role(name: "커뮤니케이터", info: [
            "여행에서 소통을 담당하는 인간 파파고!",
            "음식을 주문하거나 길을 물어보는 등 여행에서 소통이 필요할 때 빛을 발휘해요",
            "처음보는 사람과 대화를 어려워 하는 I들의 영웅이에요"
        ], guide: [
            "여행을 떠나기 전, 인삿말과 같은 기본 회화는 연습해 보는게 좋아요!",
            "외국어를 몰라도 우리에겐 구글 번역과 파파고, 제스처가 있어요!",
            "실수해도 괜찮아요, 외국어니까요!"
        ], introducingSentence: "외국어는 내가 한다!", isChecked: false
             , trolImage: "papagoTROL",
             toDoList: [ToDoList(id: 0, title: "여행 즐겁게 하기", isChecked: true),
                        ToDoList(id: 1, title: "서로 예쁜말 하기", isChecked: true),
                        ToDoList(id: 2, title: "식당에서 주문하기", isChecked: false)]),
        
        
        Role(name: "광대", info: [
            "무거운 분위기도 재미있게 살리는 분위기 리더",
            "재미있는 말로 여행동안 즐거움을 증폭시켜줘요",
            "억지스럽더라도 웃어주세요…"
        ], guide: [
            "재미있는 우리들의 추억들을 꺼내주세요!",
            "MZ처럼 재미있는 유행어를 만들고 활용해요!"
        ], introducingSentence: "나도 이젠 모르겠다!", isChecked: false
             , trolImage: "clownTROL",
             toDoList: [ToDoList(id: 0, title: "여행 즐겁게 하기", isChecked: true),
                        ToDoList(id: 1, title: "서로 예쁜말 하기", isChecked: true),
                        ToDoList(id: 2, title: "재미있는 주제던지기", isChecked: false),
                        ToDoList(id: 3, title: "분위기 살리기", isChecked: false)]),
        
        
        Role(name: "DJ", info: [
            "여행의 모든 순간을 음악으로 표현하는 음악 큐레이터",
            "여행에서 주로 멋진 플레이리스트 재생을 담당해요",
            "차 안에서도, 숙소에서도 딱 맞는 음악을 찾아 재생해요"
        ], guide: [
            "친구들의 노래 스타일을 조사해보세요!",
            "여행에 떠나기 전, 미리 플레이리스트를 만들어요",
            "효과음도 준비해두면 매 순간이 예능이 될 수 있어요"
        ], introducingSentence: "음악은 내가 튼다!", isChecked: false
             , trolImage: "djTROL",
             toDoList: [ToDoList(id: 0, title: "여행 즐겁게 하기", isChecked: true),
                        ToDoList(id: 1, title: "서로 예쁜말 하기", isChecked: true),
                        ToDoList(id: 2, title: "블루투스 스피커 관리하기", isChecked: false),
                        ToDoList(id: 3, title: "재미있는 노래 틀기", isChecked: false)]),
        
        
        Role(name: "요리사", info: [
            "재료부터 플레이팅까지 모두 담당하는 쉐프",
            "여행에서 주로 요리재료 준비 및 조리를 담당해요",
            "쉬운 라면 끓이기부터 바베큐까지! 모든 요리를 담당해요"
        ], guide: [
            "내가 할 수 있는 요리가 무엇인지 친구들에게 미리 알려줘요",
            "설거지는 쉐프의 담당이 아니라는 점 잊지 말아요",
            "혼자서 여러 명의 요리를 담당하기 힘들 땐 도움을 요청해요"
        ], introducingSentence: "요리는 내가 한다!", isChecked: false
             , trolImage: "chefTROL",
             toDoList: [ToDoList(id: 0, title: "여행 즐겁게 하기", isChecked: true),
                        ToDoList(id: 1, title: "서로 예쁜말 하기", isChecked: true),
                        ToDoList(id: 2, title: "고기굽기", isChecked: false),
                        ToDoList(id: 3, title: "요리하기", isChecked: false)]),
        
        
        Role(name: "인간공유기", info: [
            "아름다운 사람은 머문 자리도 아름답다! 어지럽힌 자리를 정리하는 역할이에요",
            "설거지, 일반쓰레기 배출 뿐 아니라 분리수거까지 담당해요"
        ], guide: [
            "설거지가 필요한 것부터 걷어낸 후, 자리를 정리하면 편해요",
            "설거지는 기름기 있는 걸 나중에! 기름기 있는 건 뜨거운 물로!",
            "카페에 갔다면 냅킨과 물티슈를 꼭 챙겨요"
        ], introducingSentence: "뒷정리는 내가 한다!", isChecked: false
             , trolImage: "wifiTROL",
             toDoList: [ToDoList(id: 0, title: "여행 즐겁게 하기", isChecked: true),
                        ToDoList(id: 1, title: "서로 예쁜말 하기", isChecked: true),
                        ToDoList(id: 2, title: "와이파이 도시락 관리하기", isChecked: false),
                        ToDoList(id: 3, title: "필요하면 핫스팟 켜주기", isChecked: false)]),
        
        
        Role(name: "짐꾼", info: [
            "여행에 꼭 필요한 돌쇠",
            "여행에서 무거운 짐을 대신 들어줘요",
            "외출 시, 조그만 물건들을 소지할 수 있는 가방을 들고 다녀요"
        ], guide: [
            "짐을 들더라도 내가 무리할 정도의 무게라면 친구와 같이 들어요",
            "들고있는 가방에 들어갈 정도인지 가늠하고 물건을 받아요",
            "들고 있던 짐은 짐꾼이 나눠주지 말고 친구들이 직접 찾아가도록 한 곳에 모아둬요"
        ], introducingSentence: "짐은 내가 든다!", isChecked: false
             , trolImage: "porterTROL",
             toDoList: [ToDoList(id: 0, title: "여행 즐겁게 하기", isChecked: true),
                        ToDoList(id: 1, title: "서로 예쁜말 하기", isChecked: true),
                        ToDoList(id: 2, title: "에코백 들고나가기", isChecked: false),
                        ToDoList(id: 3, title: "친구들의 자그마한 짐은 내 가방에 넣어주기", isChecked: false)]),


        Role(name: "메이드", info: [
            "아름다운 사람은 머문 자리도 아름답다! 어지럽힌 자리를 정리하는 역할이에요",
            "설거지, 일반쓰레기 배출 뿐 아니라 분리수거까지 담당해요"
        ], guide: [
            "설거지가 필요한 것부터 걷어낸 후, 자리를 정리하면 편해요",
            "설거지는 기름기 있는 걸 나중에! 기름기 있는 건 뜨거운 물로!",
            "카페에 갔다면 냅킨과 물티슈를 꼭 챙겨요"
        ], introducingSentence: "뒷정리는 내가 한다!", isChecked: false
             , trolImage: "maidTROL",
             toDoList: [ToDoList(id: 0, title: "여행 즐겁게 하기", isChecked: true),
                        ToDoList(id: 1, title: "서로 예쁜말 하기", isChecked: true),
                        ToDoList(id: 2, title: "설거지 하기", isChecked: false),
                        ToDoList(id: 3, title: "분리수거 하기", isChecked: false)]),
    ]
}
