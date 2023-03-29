//
//  RainScene.swift
//  Clicker
//
//  Created by Teresa Villegas on 3/28/23.
//

import Foundation
import SpriteKit

class RainScene: SKScene {
    
    private var contentView = ContentView()
    
    static var shared = RainScene()
    
    let rainEmitter = SKEmitterNode(fileNamed: "Rain.sks")!
    
    override func didMove(to view: SKView) {
        view.allowsTransparency = true
        self.backgroundColor = .clear
        self.addChild(rainEmitter)
        
        
        rainEmitter.position.y = self.frame.maxY
        rainEmitter.particlePositionRange.dx = self.frame.width * 2.5
    }
    
    override func update(_ currentTime: TimeInterval) {
        rainEmitter.particleBirthRate = CGFloat(contentView.count)
    }
}
