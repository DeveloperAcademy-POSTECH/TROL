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
    
    let terrain = SKShapeNode(rectOf: CGSize(width: 30, height: 500))
    
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
        
        terrain.strokeColor = .brown
        terrain.fillColor = .brown
        terrain.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 30, height: 500))
        terrain.physicsBody?.affectedByGravity = false
        terrain.physicsBody?.isDynamic = false
        terrain.position = .init(x: 400, y: 400)
        addChild(terrain)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let playerjoon = SKShapeNode(circleOfRadius: 16)
        playerjoon.fillColor = .cyan
        playerjoon.strokeColor = .black
        playerjoon.physicsBody = SKPhysicsBody(circleOfRadius: 16)
        playerjoon.position = location
                                      
        playerjoon.physicsBody?.affectedByGravity = true
        playerjoon.physicsBody?.isDynamic = true
        
        
        addChild(playerjoon)
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
}


struct LadderView: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 800, height: 800)
        scene.scaleMode = .fill
        return scene
    }

    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 800, height: 800)
            .ignoresSafeArea()
    }
}


struct LadderView_Previews: PreviewProvider {
    static var previews: some View {
        LadderView()
    }
}
