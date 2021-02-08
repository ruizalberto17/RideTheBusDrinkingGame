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
    @IBOutlet weak var currentPlayerLabel: UILabel!
    
    var playingDeck: PlayingCardDeck = PlayingCardDeck()
    var playerGroup: PlayerGroup = PlayerGroup()
    var currentPlayer: Player!
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPlayer = playerGroup.group[index]
        currentPlayerLabel.text = currentPlayer.name
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
        currentPlayer.addCard(cardToAdd: chosenCard)
        if chosenCard.color.elementsEqual("Red") {
            print("Take a drink!")
        } else {
            print("Give a drink!")
        }
        if index < playerGroup.group.count-1 {
            continueToNextPlayer()
        } else {
            continueToNextRound()
        }
    }
    
    @IBAction func redButtonPressed(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardView.image = chosenCard.frontImage
        currentPlayer.addCard(cardToAdd: chosenCard)
        if chosenCard.color.elementsEqual("Black") {
            print("Take a drink!")
        } else {
            print("Give a drink!")
        }
        
        if index < playerGroup.group.count-1 {
            continueToNextPlayer()
        } else {
            continueToNextRound()
        }
    }
    
    func continueToNextPlayer() {
        let vc = storyboard?.instantiateViewController(identifier: "redOrBlackVC") as! GameViewController
        vc.index = index + 1
        vc.playingDeck = playingDeck
        vc.playerGroup = playerGroup
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func continueToNextRound() {
        let vc = storyboard?.instantiateViewController(identifier: "greaterOrLessVC") as! GreaterOrLessViewController
        vc.playerGroup = playerGroup
        vc.playingDeck = playingDeck
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
