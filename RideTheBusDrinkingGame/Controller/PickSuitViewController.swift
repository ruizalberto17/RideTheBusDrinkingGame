//
//  PickSuitViewController.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/5/21.
//

import UIKit

class PickSuitViewController: UIViewController {

    @IBOutlet weak var cardToGuess: UIImageView!
    
    var playingDeck: PlayingCardDeck!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func tappedClub(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        
        if (!chosenCard.getSuit().elementsEqual("Club")) {
            print("Take a drink!")
        } else {
            print("Give four drinks!")
        }
    }
    
    @IBAction func tappedDiamond(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        
        if (!chosenCard.getSuit().elementsEqual("Diamond")) {
            print("Take a drink!")
        } else {
            print("Give four drinks!")
        }
    }
    
    @IBAction func tappedSpade(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        
        if (!chosenCard.getSuit().elementsEqual("Spade")) {
            print("Take a drink!")
        } else {
            print("Give four drinks!")
        }
    }
    
    @IBAction func tappedHeart(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        
        if (!chosenCard.getSuit().elementsEqual("Heart")) {
            print("Take a drink!")
        } else {
            print("Give four drinks!")
        }
    }
}
