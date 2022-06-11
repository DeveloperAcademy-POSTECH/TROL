//
//  LadderView.swift
//  TROL
//
//  Created by MBSoo on 2022/06/09.
//

import SpriteKit
import SwiftUI


class GameScene: SKScene {
    let players: [Friend] = [Friend.friends[0], Friend.friends[1], Friend.friends[2]]
    let playerocean = SKShapeNode(circleOfRadius: 16)
    let playerbuckil = SKShapeNode(circleOfRadius: 16)
    //    let playerjoon = SKShapeNode(circleOfRadius: 16)
    var isocean: Bool = false
    var isbuckil: Bool = false
    var isjoon: Bool = false
    
    var startTouch = CGPoint()
    var endTouch = CGPoint()
    
    let terrain1 = SKShapeNode(rectOf: CGSize(width: 30, height: 700))
    let terrain2 = SKShapeNode(rectOf: CGSize(width: 30, height: 700))
    let terrain3 = SKShapeNode(rectOf: CGSize(width: 30, height: 700))
    
    override func didMove(to view: SKView) {
        //        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        backgroundColor = .gray
        
        
        playerocean.strokeColor = .blue
        playerocean.fillColor = .blue
        playerocean.physicsBody = SKPhysicsBody(circleOfRadius: 16)
        playerocean.physicsBody?.affectedByGravity = true
        playerocean.physicsBody?.isDynamic = true
        
        playerbuckil.strokeColor = .green
        playerbuckil.fillColor = .green
        playerbuckil.physicsBody = SKPhysicsBody(circleOfRadius: 16)
        playerbuckil.physicsBody?.affectedByGravity = true
        playerbuckil.physicsBody?.isDynamic = true
        
        
        
        //        addChild(playerjoon)
        for i in 1...10 {
            let terrain = SKShapeNode(rectOf: CGSize(width: 30, height: 500))
            terrain.strokeColor = .brown
            terrain.fillColor = .brown
            terrain.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 30, height: 500))
            terrain.physicsBody?.affectedByGravity = false
            terrain.physicsBody?.isDynamic = false
            
            let position = 400 + (i % 2 == 0 ? 1 : -1) * (80 * i.quotientAndRemainder(dividingBy: 2).quotient)
            
            terrain.position = .init(x: position , y: 200)
            addChild(terrain)
        }
        
        //        switch Roles.count {
        //        case 1...3:
        //            terrain1.strokeColor = .brown
        //            terrain1.fillColor = .brown
        //            terrain1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 30, height: 500))
        //            terrain1.physicsBody?.affectedByGravity = false
        //            terrain1.physicsBody?.isDynamic = false
        //            terrain1.position = .init(x: 400, y: 400)
        //            addChild(terrain1)
        //            fallthrough
        //        case 2...3:
        //            terrain2.strokeColor = .blue
        //            terrain2.fillColor = .blue
        //            terrain2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 30, height: 500))
        //            terrain2.physicsBody?.affectedByGravity = false
        //            terrain2.physicsBody?.isDynamic = false
        //            terrain2.position = .init(x: 300, y: 400)
        //            addChild(terrain2)
        //            fallthrough
        //        case 3:
        //            terrain3.strokeColor = .black
        //            terrain3.fillColor = .black
        //            terrain3.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 30, height: 500))
        //            terrain3.physicsBody?.affectedByGravity = false
        //            terrain3.physicsBody?.isDynamic = false
        //            terrain3.position = .init(x: 470, y: 400)
        //            addChild(terrain3)
        //        default:
        //            terrain1.strokeColor = .brown
        //            terrain1.fillColor = .brown
        //            terrain1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 30, height: 500))
        //            terrain1.physicsBody?.affectedByGravity = false
        //            terrain1.physicsBody?.isDynamic = false
        //            terrain1.position = .init(x: 400, y: 400)
        //            addChild(terrain1)
        //        }
        //
        
        //        terrain.strokeColor = .brown
        //        terrain.fillColor = .brown
        //        terrain.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 30, height: 500))
        //        terrain.physicsBody?.affectedByGravity = false
        //        terrain.physicsBody?.isDynamic = false
        //        terrain.position = .init(x: 400, y: 400)
        //        addChild(terrain)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        if !isjoon{
        let playerjoon = SKShapeNode(circleOfRadius: 16)
        playerjoon.fillColor = .cyan
        playerjoon.strokeColor = .black
        playerjoon.physicsBody = SKPhysicsBody(circleOfRadius: 16)
        playerjoon.position = location
        
        playerjoon.physicsBody?.affectedByGravity = true
        playerjoon.physicsBody?.isDynamic = true
        //        playerjoon.physicsBody?.restitution = 0.7
        
        addChild(playerjoon)
        isjoon = true
        }
        else if(!isocean){
            let playerocean = SKShapeNode(circleOfRadius: 16)
            playerocean.fillColor = .brown
            playerocean.strokeColor = .black
            playerocean.physicsBody = SKPhysicsBody(circleOfRadius: 16)
            playerocean.position = location
            
            playerocean.physicsBody?.affectedByGravity = true
            playerocean.physicsBody?.isDynamic = true
            //        playerjoon.physicsBody?.restitution = 0.7
            
            addChild(playerocean)
            isocean = true
        }
        else if (!isbuckil){
            let playerbuckil = SKShapeNode(circleOfRadius: 16)
            playerbuckil.fillColor = .green
            playerbuckil.strokeColor = .black
            playerbuckil.physicsBody = SKPhysicsBody(circleOfRadius: 16)
            playerbuckil.position = location
            
            playerbuckil.physicsBody?.affectedByGravity = true
            playerbuckil.physicsBody?.isDynamic = true
            //        playerjoon.physicsBody?.restitution = 0.7
            
            addChild(playerbuckil)
            isbuckil = true
        }
        
        //        if isjoon{
        //            addChild(playerocean)
        //            isocean.toggle()
        //        }
        //        else if isocean{
        //            addChild(playerbuckil)
        //            isbuckil.toggle()
        //        }
        //
        //        if !isjoon{
        //            addChild(playerjoon)
        //            isjoon.toggle()
        //        }
        //        addChild(box)
    }
    
//    override func
    
}

var Roles: [String] { return ["총무", "길라잡이", "DJ"]}
var isFirst: Bool = false
func randomSampling(samples:[String]) -> [String]{
    return samples.shuffled()
}




struct LadderView: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 500, height: 800)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        ZStack{
            SpriteView(scene: scene)
                .frame(width: 500, height: 800)
                .ignoresSafeArea()
            VStack{
                Spacer()
                ZStack{
//                    Rectangle()
//                        .foregroundColor(.indigo)
//                        .frame(width: 800, height: 200, alignment: .bottom)
                    HStack{
                        ForEach(randomSampling(samples: Roles), id: \.self) { temp in
                            Text(temp)
                                .font(.custom("Happiness-Sans-Bold", size: 20))
                        }
                    }
                }
            }
        }
    }
}


struct LadderView_Previews: PreviewProvider {
    static var previews: some View {
        LadderView()
    }
}
