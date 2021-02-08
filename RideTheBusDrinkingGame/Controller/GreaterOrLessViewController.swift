//
//  GreaterOrLessViewController.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/5/21.
//

import UIKit

class GreaterOrLessViewController: UIViewController {
    
    @IBOutlet weak var cardToGuess: UIImageView!
    @IBOutlet weak var firstCard: UIImageView!
    @IBOutlet weak var currentPlayerLabel: UILabel!
    
    var playingDeck: PlayingCardDeck!
    var playerGroup: PlayerGroup!
    var currentPlayer: Player!
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPlayer = playerGroup.group[index]
        firstCard.image = currentPlayer.playerCards[0].frontImage
        currentPlayerLabel.text = currentPlayer.name
    }
    
    @IBAction func lessThanTapped(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        currentPlayer.addCard(cardToAdd: chosenCard)
    
        if(chosenCard.getRank() >= currentPlayer.playerCards[0].getRank()) {
            print("Take a drink!")
        } else {
            print("Give two drinks!")
        }
        
        if index < playerGroup.group.count-1 {
            continueToNextPlayer()
        } else {
            continueToNextRound()
        }
    }
    
    @IBAction func equalToTapped(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        currentPlayer.addCard(cardToAdd: chosenCard)
        
        if(chosenCard.getRank() == currentPlayer.playerCards[0].getRank()) {
            print("Give two drinks!")

        } else {
            print("Take a drink!")
        }
        
        if index < playerGroup.group.count-1 {
            continueToNextPlayer()
        } else {
            continueToNextRound()
        }
    }
    
    @IBAction func greaterThanTapped(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        currentPlayer.addCard(cardToAdd: chosenCard)

        if(chosenCard.getRank() <= currentPlayer.playerCards[0].getRank()) {
            print("Take a drink!")
        } else {
            print("Give two drinks!")
        }
        
        if index < playerGroup.group.count-1 {
            continueToNextPlayer()
        } else {
            continueToNextRound()
        }
    }
    
    func continueToNextPlayer() {
        let vc = storyboard?.instantiateViewController(identifier: "greaterOrLessVC") as! GreaterOrLessViewController
        vc.index = index + 1
        vc.playingDeck = playingDeck
        vc.playerGroup = playerGroup
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func continueToNextRound() {
        let vc = storyboard?.instantiateViewController(identifier: "insideOrOutsideVC") as! InsideOrOutsideViewController
        vc.playerGroup = playerGroup
        vc.playingDeck = playingDeck
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
