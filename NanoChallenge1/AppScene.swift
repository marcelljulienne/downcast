//
//  AppScene.swift
//  NanoChallenge1
//
//  Created by Marcell Julienne on 18/05/19.
//  Copyright © 2019 Marcell Julienne. All rights reserved.
//

import SpriteKit

class GameScene: SKScene{
    
    override func didMove(to view: SKView) {
        addBackground()
    }
    
    func addBackground() {
        let backdrop = SKSpriteNode(imageNamed: Background.gradient)
        addChild(backdrop)
        backdrop.position = CGPoint(x: size.width / 2, y: size.height / 2)
        backdrop.zPosition = Layers.background
    }
    
    
}

