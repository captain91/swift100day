//
//  GameScene.swift
//  Project20
//
//  Created by Shibo Sun on 2021/4/23.
//

import SpriteKit

class GameScene: SKScene {
    var gameTiemr: Timer?
    var fireworks = [SKNode]()
    var scoreLabel: SKLabelNode!
    
    let leftEdge = -22
    let bottomEdge = -22
    let rightEdge = 1024 + 22
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        let backgroud = SKSpriteNode(imageNamed: "background")
        backgroud.position = CGPoint(x: 512, y: 384)
        backgroud.blendMode = .replace
        backgroud.zPosition = -1
        addChild(backgroud)
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.position = CGPoint(x: 16, y: 16)
        scoreLabel.horizontalAlignmentMode = .left
        scoreLabel.text = "Score: \(score)"
        addChild(scoreLabel)
        
        gameTiemr = Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(launchFireworks), userInfo: nil, repeats: true)
    }
    
    func createFirework(xMoveement: CGFloat, x: Int, y: Int){
        let node = SKNode()
        node.position = CGPoint(x: x, y: y)
        
        let firework = SKSpriteNode(imageNamed: "rocket")
        firework.colorBlendFactor = 1
        firework.name = "firework"
        node.addChild(firework)
        
        switch Int.random(in: 0...2) {
        case 0:
            firework.color = .cyan
        case 1:
            firework.color = .green
        default:
            firework.color = .red
        }
        
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: xMoveement, y: 1000))
        
        let move = SKAction.follow(path.cgPath, asOffset: true, orientToPath: true, speed: 200)
        node.run(move)
        
        if let emitter = SKEmitterNode(fileNamed: "fuse"){
            emitter.position = CGPoint(x: 0, y: -22)
            node.addChild(emitter)
        }
        
        fireworks.append(node)
        addChild(node)
    }
    
    @objc func launchFireworks(){
        let movementAmount: CGFloat = 1800
        
        switch Int.random(in: 0...3) {
        case 0:
            createFirework(xMoveement: 0, x: 512, y: bottomEdge)
            createFirework(xMoveement: 0, x: 512 - 200, y: bottomEdge)
            createFirework(xMoveement: 0, x: 512 - 100, y: bottomEdge)
            createFirework(xMoveement: 0, x: 512 + 100, y: bottomEdge)
            createFirework(xMoveement: 0, x: 512 + 200, y: bottomEdge)
        case 1:
            createFirework(xMoveement: 0, x: 512, y: bottomEdge)
            createFirework(xMoveement: -200, x: 512 - 200, y: bottomEdge)
            createFirework(xMoveement: -100, x: 512 - 100, y: bottomEdge)
            createFirework(xMoveement: 100, x: 512 + 100, y: bottomEdge)
            createFirework(xMoveement: 200, x: 512 + 200, y: bottomEdge)
        case 2:
            createFirework(xMoveement: movementAmount, x: leftEdge, y: bottomEdge + 400)
            createFirework(xMoveement: movementAmount, x: leftEdge, y: bottomEdge + 300)
            createFirework(xMoveement: movementAmount, x: leftEdge, y: bottomEdge + 200)
            createFirework(xMoveement: movementAmount, x: leftEdge, y: bottomEdge + 100)
            createFirework(xMoveement: movementAmount, x: leftEdge, y: bottomEdge)
        case 3:
            createFirework(xMoveement: -movementAmount, x: rightEdge, y: bottomEdge + 400)
            createFirework(xMoveement: -movementAmount, x: rightEdge, y: bottomEdge + 300)
            createFirework(xMoveement: -movementAmount, x: rightEdge, y: bottomEdge + 200)
            createFirework(xMoveement: -movementAmount, x: rightEdge, y: bottomEdge + 100)
            createFirework(xMoveement: -movementAmount, x: rightEdge, y: bottomEdge)
        default:
            break
        }
    }
    
    func checkTouches(_ touches: Set<UITouch>){
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        let nodesAtPoint = nodes(at: location)
        
        for case let node as SKSpriteNode in nodesAtPoint {
            guard node.name == "firework" else { continue }
            
            for parent in fireworks {
                guard let firework = parent.children.first as? SKSpriteNode else { continue }
                
                if firework.name == "selected" && firework.color != node.color {
                    firework.name = "firework"
                    firework.colorBlendFactor = 1
                }
            }
            
            node.name = "selected"
            node.colorBlendFactor = 0
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        checkTouches(touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        checkTouches(touches)
    }
    
    override func update(_ currentTime: TimeInterval) {
        for (index, firework) in fireworks.enumerated().reversed() {
            if firework.position.y > 900 {
                fireworks.remove(at: index)
                firework.removeFromParent()
            }
        }
    }
    
    func explode(firework: SKNode) {
        if let emitter = SKEmitterNode(fileNamed: "explode"){
            emitter.position = firework.position
            addChild(emitter)
        }
        
        firework.removeFromParent()
    }
    
    func exploadeFireworks(){
        var numExploded = 0
        
        for (index, fireworkContainer) in fireworks.enumerated().reversed() {
            guard let firework = fireworkContainer.children.first as? SKSpriteNode else { return }
            
            if firework.name == "selected" {
                explode(firework: fireworkContainer)
                fireworks.remove(at: index)
                numExploded += 1
            }
        }
        
        switch numExploded {
        case 0:
            break
        case 1:
            score += 200
        case 2:
            score += 500
        case 3:
            score += 1500
        case 4:
            score += 2500
        default:
            score += 4000
        }
    }

}
