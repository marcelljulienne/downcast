//
//  EmitterScene.swift
//  NanoChallenge1
//
//  Created by Marcell Julienne on 20/05/19.
//  Copyright © 2019 Marcell Julienne. All rights reserved.
//

import SpriteKit



class EmitterScene: SKScene{
    
    override func didMove(to view: SKView) {
        addEmitter()
        addBackground()
        addCloud()
    }
    
    func addBackground() {
        let backdrop = SKSpriteNode(imageNamed: Background.gradient)
        addChild(backdrop)
        backdrop.position = CGPoint(x: size.width / 2, y: size.height / 2)
        backdrop.zPosition = Layers.background
    }
    
    func addEmitter()
    {
        let emitter = SKEmitterNode(fileNamed: Emitter.rain)!
        emitter.zPosition = Layers.emitter
        emitter.position = CGPoint(x: size.width / 2, y: size.height)
//        emitter.advanceSimulationTime(30)
        addChild(emitter)
    }
    
    func addCloud()
    {
        let cloud = SKEmitterNode(fileNamed: Emitter.cloud)!
        cloud.zPosition = Layers.emitter
        cloud.position = CGPoint(x: size.width / 2, y: size.height)
        addChild(cloud)
        cloud.advanceSimulationTime(30)
    }
    
//    func whiteBackground(){
//        Label.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
//        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        Label.zPosition = 5
//        Label.color = UIColor.white
//        Label.run(blinkAnimation())
//
//
//    }
//
//
//    func blinkAnimation() -> SKAction
//    {
//        let duration = 10.0
//        let fadeOut = SKAction.fadeAlpha(to: 0.0, duration: duration)
//        let fadeIn = SKAction.fadeAlpha(to: 1.0, duration: duration)
//        let blink = SKAction.sequence([fadeIn,fadeOut])
//        return SKAction.repeatForever(blink)
//    }
}
