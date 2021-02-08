//
//  PickSuitViewController.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/5/21.
//

import UIKit

class PickSuitViewController: UIViewController {
    
    @IBOutlet weak var currentPlayerLabel: UILabel!
    @IBOutlet weak var cardToGuess: UIImageView!
    
    var playingDeck: PlayingCardDeck!
    var playerGroup: PlayerGroup!
    var currentPlayer: Player!
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPlayer = playerGroup.group[index]
        currentPlayerLabel.text = currentPlayer.name
    }
    
    
    @IBAction func tappedClub(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        currentPlayer.addCard(cardToAdd: chosenCard)
        if (!chosenCard.getSuit().elementsEqual("Club")) {
            print("Take a drink!")
        } else {
            print("Give four drinks!")
        }
        
        if index < playerGroup.group.count-1 {
            continueToNextPlayer()
        } else {
            continueToNextRound()
        }
    }
    
    @IBAction func tappedDiamond(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        currentPlayer.addCard(cardToAdd: chosenCard)
        if (!chosenCard.getSuit().elementsEqual("Diamond")) {
            print("Take a drink!")
        } else {
            print("Give four drinks!")
        }
        
        if index < playerGroup.group.count-1 {
            continueToNextPlayer()
        } else {
            continueToNextRound()
        }
    }
    
    @IBAction func tappedSpade(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        currentPlayer.addCard(cardToAdd: chosenCard)
        if (!chosenCard.getSuit().elementsEqual("Spade")) {
            print("Take a drink!")
        } else {
            print("Give four drinks!")
        }
        
        if index < playerGroup.group.count-1 {
            continueToNextPlayer()
        } else {
            continueToNextRound()
        }
    }
    
    @IBAction func tappedHeart(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        currentPlayer.addCard(cardToAdd: chosenCard)
        if (!chosenCard.getSuit().elementsEqual("Heart")) {
            print("Take a drink!")
        } else {
            print("Give four drinks!")
        }
        
        if index < playerGroup.group.count-1 {
            continueToNextPlayer()
        } else {
            continueToNextRound()
        }
    }
    
    func continueToNextPlayer() {
        let vc = storyboard?.instantiateViewController(identifier: "pickSuitVC") as! PickSuitViewController
        vc.index = index + 1
        vc.playerGroup = playerGroup
        vc.playingDeck = playingDeck
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func continueToNextRound() {
        let vc = storyboard?.instantiateViewController(identifier: "playerHandsVC") as! PlayerHandsViewController
        vc.playingDeck = playingDeck
        vc.playerGroup = playerGroup
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
