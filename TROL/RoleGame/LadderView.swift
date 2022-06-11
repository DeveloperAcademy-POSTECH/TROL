//
//  LadderView.swift
//  TROL
//
//  Created by MBSoo on 2022/06/09.
//

import SpriteKit
import SwiftUI


class GameScene: SKScene, SKPhysicsContactDelegate {
    let players: [Friend] = [Friend.friends[0], Friend.friends[1], Friend.friends[2]]
    let playerocean = SKShapeNode(circleOfRadius: 16)
    let playerbuckil = SKShapeNode(circleOfRadius: 16)
    //    let playerjoon = SKShapeNode(circleOfRadius: 16)
    var isocean: Bool = false
    var isbuckil: Bool = false
    var isjoon: Bool = false
    var isEnded: Bool = false
    var startTouch = CGPoint()
    var endTouch = CGPoint()
    var endLabel:SKLabelNode!
    
//    let terrain1 = SKShapeNode(rectOf: CGSize(width: 30, height: 700))
//    let terrain2 = SKShapeNode(rectOf: CGSize(width: 30, height: 700))
//    let terrain3 = SKShapeNode(rectOf: CGSize(width: 30, height: 700))
    
    let roleCategory: [UInt32] = [0x1 << 0, 0x1 << 1, 0x1 << 2]
    let peopleCatergory: [UInt32] = [0x1 << 0, 0x1 << 1, 0x1 << 2]
    
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
        for i in 1...roles.count {
            let rolesNode = SKShapeNode(rectOf: CGSize(width: 40, height: 10), cornerRadius:10)
            let position = 200 + (i % 2 == 0 ? 1 : -1) * (80 * i.quotientAndRemainder(dividingBy: 2).quotient)
            rolesNode.position = .init(x: position, y: 100)
            rolesNode.fillColor = .blue
            rolesNode.strokeColor = .black
            rolesNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 10))
            rolesNode.physicsBody?.isDynamic = true
            
            rolesNode.physicsBody?.categoryBitMask = roleCategory[i-1]
            rolesNode.physicsBody?.contactTestBitMask = peopleCatergory[i-1]
            rolesNode.physicsBody?.collisionBitMask = 1
            rolesNode.physicsBody?.usesPreciseCollisionDetection = true
            self.addChild(rolesNode)
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
        playerjoon.physicsBody?.categoryBitMask = peopleCatergory[0]
            playerjoon.physicsBody?.contactTestBitMask = roleCategory[0]
            playerjoon.physicsBody?.collisionBitMask = 0
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
            playerocean.physicsBody?.categoryBitMask = peopleCatergory[1]
            playerocean.physicsBody?.contactTestBitMask = roleCategory[1]
            playerocean.physicsBody?.collisionBitMask = 0
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
            playerbuckil.physicsBody?.categoryBitMask = peopleCatergory[2]
            playerbuckil.physicsBody?.contactTestBitMask = roleCategory[2]
            playerbuckil.physicsBody?.collisionBitMask = 0
            //        playerjoon.physicsBody?.restitution = 0.7
            
            addChild(playerbuckil)
            isbuckil = true
        }
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (!isbuckil || !isEnded){
            fallingSound()
            
            isEnded = true
        }
    }
    
    func fallingSound(){
        self.run(SKAction.playSoundFileNamed(soundFiles.randomElement() ?? "ladder1.wav", waitForCompletion: false))
    
        
        
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody:SKPhysicsBody
        var secondBody:SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if (peopleCatergory.contains(firstBody.categoryBitMask)) && ( roleCategory.contains(secondBody.categoryBitMask))  {
            collideWithRoles(roleNode: firstBody.node as! SKShapeNode, personNode: secondBody.node as! SKShapeNode)
        }
        
    }
    func collideWithRoles (roleNode:SKShapeNode, personNode:SKShapeNode){
        endLabel = SKLabelNode(text: "역할 분배 완료!")
        endLabel.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height/2)
        endLabel.fontName = "Happiness-Sans-Bold"
        endLabel.fontSize = 36
        endLabel.fontColor = UIColor.white
    }
}

var roles: [String] { return ["총무", "길라잡이", "DJ"]}
var isFirst: Bool = false
func randomSampling(samples:[String]) -> [String]{
    return samples.shuffled()
}

var soundFiles: [String] {return ["ladder1.wav", "ladder2.wav", "ladder3.wav"]}


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
                        ForEach(randomSampling(samples: roles), id: \.self) { temp in
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
