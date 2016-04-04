//
//  GameScene.swift
//  SpriteKitGame
//
//  Created by Ennis Smith on 3/22/16.
//  Copyright (c) 2016 Ennis Smith. All rights reserved.
//
    import SpriteKit
    import UIKit
    
    private let kFoodNodeName = "movable"
    
    class GameScene: SKScene, SKPhysicsContactDelegate{
        let background = SKSpriteNode(imageNamed: "blue-shooting-stars")
        var selectedNode = SKSpriteNode()
        var carbCount = 0
        var carbLabel = SKLabelNode()
        
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override init(size: CGSize) {
            super.init(size: size)
            
            // 1
            self.background.name = "background"
            self.background.anchorPoint = CGPointZero
            
            // 2
            self.addChild(background)
            
        
            
            //3
            let plate = SKSpriteNode(imageNamed: "plate.png")
            plate.position = CGPoint(x: 140, y: 170)
            plate.name = "plateNode"
            plate.userInteractionEnabled = false
            plate.physicsBody = SKPhysicsBody(circleOfRadius:
                (plate.size.width/2.6))
            
            plate.physicsBody?.categoryBitMask = 1
            plate.physicsBody?.contactTestBitMask = 2
            plate.physicsBody?.collisionBitMask = 0
            plate.physicsBody?.affectedByGravity = false
            plate.physicsBody?.usesPreciseCollisionDetection = true
            plate.hidden = false
            plate.zPosition = 10
            background.addChild(plate)
            
            
            
            //4
            carbLabel = SKLabelNode(fontNamed: "ScoreLabel")
            carbLabel.fontSize = 24
            carbLabel.name = "CarbLabel"
            carbLabel.fontColor = SKColor.blueColor()
            carbLabel.hidden = false
            carbLabel.text = "Carbs: \(carbCount)"
            carbLabel.zPosition = 11
            carbLabel.position = CGPointMake(350, 400)
            
            background.addChild(carbLabel)

            
            //5
            
            let imageNames = ["apple", "potato", "broccoli", "carrot", "chicken", "cucumber"]
            var xOffset = 0
            for i in 0..<imageNames.count {
                let imageName = imageNames[i]
                
                
                
                let sprite = SKSpriteNode(imageNamed: imageName)
                sprite.name = kFoodNodeName
                
                let offsetFraction = (CGFloat(i % 3) + 1.0)/(CGFloat(imageNames.count) + 1.0)
                
                sprite.position = CGPoint(x: CGFloat(450 + xOffset), y: ((size.height) * offsetFraction))
                sprite.zPosition = 100
                sprite.physicsBody = SKPhysicsBody(rectangleOfSize:
                    (sprite.size))
                
                sprite.physicsBody?.affectedByGravity = false
                
                sprite.physicsBody?.categoryBitMask = 2
                sprite.physicsBody?.collisionBitMask = 0
                sprite.physicsBody?.contactTestBitMask = 1
                
                background.addChild(sprite)
                
                if (i % 3) == 2{
                    xOffset += 60
                }

                
                
            }
            
            
        }
        
        
       /*
        func createPlateNode() -> SkSpriteNode() {
        
            return plate
            
        }*/
        
        
        
        func degToRad(degree: Double) -> CGFloat {
            return CGFloat(Double(degree) / 180.0 * M_PI)
        }
        
        func selectNodeForTouch(touchLocation: CGPoint) {
            // 1
            let touchedNode = self.nodeAtPoint(touchLocation)
            
            if touchedNode is SKSpriteNode {
                // 2
                if !selectedNode.isEqual(touchedNode) {
                    selectedNode.removeAllActions()
                    selectedNode.runAction(SKAction.rotateToAngle(0.0, duration: 0.1))
                    
                    selectedNode = touchedNode as! SKSpriteNode
                    
                    // 3
//                    if touchedNode.name! == kFoodNodeName {
//                        let sequence = SKAction.sequence([SKAction.rotateByAngle(degToRad(-4.0), duration: 0.1),
//                            SKAction.rotateByAngle(0.0, duration: 0.1),
//                            SKAction.rotateByAngle(degToRad(4.0), duration: 0.1)])
//                        selectedNode.runAction(SKAction.repeatActionForever(sequence))
//                    }
                }
            }
        }

        override func didMoveToView(view: SKView) {
            physicsWorld.contactDelegate = self
            let gestureRecognizer = UIPanGestureRecognizer(target: self, action: Selector("handlePanFrom:"))
            self.view!.addGestureRecognizer(gestureRecognizer)
        }
        
       func handlePanFrom(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .Began {
        var touchLocation = recognizer.locationInView(recognizer.view)
        touchLocation = self.convertPointFromView(touchLocation)
        
        self.selectNodeForTouch(touchLocation)
        } else if recognizer.state == .Changed {
        var translation = recognizer.translationInView(recognizer.view!)
        translation = CGPoint(x: translation.x, y: -translation.y)
        
        self.panForTranslation(translation)
        
        recognizer.setTranslation(CGPointZero, inView: recognizer.view)
        } else if recognizer.state == .Ended {
//        if selectedNode.name != kFoodNodeName{
//        let scrollDuration = 0.2
//        let velocity = recognizer.velocityInView(recognizer.view)
//        let pos = selectedNode.position
//        
//        // This just multiplies your velocity with the scroll duration.
//        let p = CGPoint(x: velocity.x * CGFloat(scrollDuration), y: velocity.y * CGFloat(scrollDuration))
//        
//        var newPos = CGPoint(x: pos.x + p.x, y: pos.y + p.y)
//        newPos = self.boundLayerPos(newPos)
//        selectedNode.removeAllActions()
//        
//        let moveTo = SKAction.moveTo(newPos, duration: scrollDuration)
//        moveTo.timingMode = .EaseOut
//        selectedNode.runAction(moveTo)
//        }
        }
    }
        
        
        func boundLayerPos(aNewPosition: CGPoint) -> CGPoint {
            let winSize = self.size
            var retval = aNewPosition
            retval.x = CGFloat(min(retval.x, 0))
            retval.x = CGFloat(max(retval.x, -(background.size.width) + winSize.width))
            retval.y = self.position.y
            
            return retval
        }
        
        func panForTranslation(translation: CGPoint) {
            let position = selectedNode.position
            
            if selectedNode.name! == kFoodNodeName {
                selectedNode.position = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
            } else {
//                let aNewPosition = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
//                background.position = self.boundLayerPos(aNewPosition)
            }
        }
        
        


func didBeginContact(contact: SKPhysicsContact) {
    
    //this gets called automatically when two objects begin contact with each other
    
    let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
    carbLabel.hidden = false
    switch(contactMask) {
        
    case 1 | 2:
        carbCount++
        carbLabel.text = "Carbs: \(carbCount)"

        print("Carbs Increased: \(carbCount)")
        
        
    default:
        carbLabel.text = "Carbs: \(carbCount)"

        return
        
    }
    
}

func didEndContact(contact: SKPhysicsContact) {
    
    //this gets called automatically when two objects end contact with each other
    
    let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
    carbLabel.hidden = false
    switch(contactMask) {
    case 1 | 2:
        carbCount--
        carbLabel.text = "Carbs: \(carbCount)"
        print("Carbs Decreased: \(carbCount)")
        
        
    default:
        carbLabel.text = "Carbs: \(carbCount)"
        return
        
    }
    
}
}