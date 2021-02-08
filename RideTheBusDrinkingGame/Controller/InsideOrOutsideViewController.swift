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
    
    var smallerCard: PlayingCard!
    var largerCard: PlayingCard!
    var playingDeck: PlayingCardDeck!

    override func viewDidLoad() {
        super.viewDidLoad()
        lowerCard.image = smallerCard.frontImage
        upperCard.image = largerCard.frontImage
    }
    
    
    @IBAction func insideTapped(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        
        if(chosenCard.getRank() >= largerCard.getRank() || chosenCard.getRank() <= largerCard.getRank()) {
            print("Take a drink!")
        } else {
            print("Give three drinks!")
        }
        
        let vc = storyboard?.instantiateViewController(identifier: "pickSuitVC") as! PickSuitViewController
        vc.playingDeck = playingDeck
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func outsideTapped(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        
        if(chosenCard.getRank() <= largerCard.getRank() && chosenCard.getRank() >= smallerCard.getRank()) {
            print("Take a drink!")
        } else {
            print("Give three drinks!")
        }
        
        let vc = storyboard?.instantiateViewController(identifier: "pickSuitVC") as! PickSuitViewController
        vc.playingDeck = playingDeck
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
