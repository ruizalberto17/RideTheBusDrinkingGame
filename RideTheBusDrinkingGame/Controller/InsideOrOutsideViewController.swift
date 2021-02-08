//
//  InsideOrOutsideViewController.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/5/21.
//

import UIKit

class InsideOrOutsideViewController: UIViewController {
    
    @IBOutlet weak var cardToGuess: UIImageView!
    @IBOutlet weak var upperCard: UIImageView!
    @IBOutlet weak var lowerCard: UIImageView!
    @IBOutlet weak var currentPlayerLabel: UILabel!
    
    var smallerCard: PlayingCard!
    var largerCard: PlayingCard!
    var playingDeck: PlayingCardDeck!
    var playerGroup: PlayerGroup!
    var currentPlayer: Player!
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        currentPlayer = playerGroup.group[index]
        currentPlayerLabel.text = currentPlayer.name
        if currentPlayer.playerCards[0].getRank() > currentPlayer.playerCards[1].getRank() {
            smallerCard = currentPlayer.playerCards[1]
            largerCard = currentPlayer.playerCards[0]
        } else {
            smallerCard = currentPlayer.playerCards[0]
            largerCard = currentPlayer.playerCards[1]
        }
        lowerCard.image = smallerCard.frontImage
        upperCard.image = largerCard.frontImage
    }
    
    
    @IBAction func insideTapped(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        currentPlayer.addCard(cardToAdd: chosenCard)
        if(chosenCard.getRank() >= largerCard.getRank() || chosenCard.getRank() <= largerCard.getRank()) {
            print("Take a drink!")
        } else {
            print("Give three drinks!")
        }
        
        if index < playerGroup.group.count-1 {
            continueToNextPlayer()
        } else {
            continueToNextRound()
        }
    }
    
    @IBAction func outsideTapped(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        currentPlayer.addCard(cardToAdd: chosenCard)
        if(chosenCard.getRank() <= largerCard.getRank() && chosenCard.getRank() >= smallerCard.getRank()) {
            print("Take a drink!")
        } else {
            print("Give three drinks!")
        }
        
        if index < playerGroup.group.count-1 {
            continueToNextPlayer()
        } else {
            continueToNextRound()
        }
    }
    
    func continueToNextPlayer() {
        let vc = storyboard?.instantiateViewController(identifier: "insideOrOutsideVC") as! InsideOrOutsideViewController
        vc.index = index + 1
        vc.playerGroup = playerGroup
        vc.playingDeck = playingDeck
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func continueToNextRound() {
        let vc = storyboard?.instantiateViewController(identifier: "pickSuitVC") as! PickSuitViewController
        vc.playerGroup = playerGroup
        vc.playingDeck = playingDeck
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
