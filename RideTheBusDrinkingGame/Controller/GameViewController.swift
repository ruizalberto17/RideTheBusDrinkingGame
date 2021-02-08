//
//  GameViewController.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/5/21.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet weak var cardView: UIImageView!
    
    var playingDeck: PlayingCardDeck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if let scene = GKScene(fileNamed: "GameScene") {
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! GameScene? {
                
                // Copy gameplay related content over to the scene
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func blackButtonPresed(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardView.image = chosenCard.frontImage
        
        if chosenCard.color.elementsEqual("Red") {
            print("Take a drink!")
        } else {
            print("Give a drink!")
        }
        
        let vc = storyboard?.instantiateViewController(identifier: "greaterOrLessVC") as! GreaterOrLessViewController
        vc.previousCard = chosenCard
        vc.playingDeck = playingDeck
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func redButtonPressed(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardView.image = chosenCard.frontImage
        
        if chosenCard.color.elementsEqual("Black") {
            print("Take a drink!")
        } else {
            print("Give a drink!")
        }
        
        let vc = storyboard?.instantiateViewController(identifier: "greaterOrLessVC") as! GreaterOrLessViewController
        vc.previousCard = chosenCard
        vc.playingDeck = playingDeck
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}
