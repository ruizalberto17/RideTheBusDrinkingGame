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
    
    var previousCard: PlayingCard!
    var playingDeck: PlayingCardDeck!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstCard.image = previousCard.frontImage
    }
    
    @IBAction func lessThanTapped(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        
        let vc = storyboard?.instantiateViewController(identifier: "insideOrOutsideVC") as! InsideOrOutsideViewController
        if(chosenCard.getRank() >= previousCard.getRank()) {
            print("Take a drink!")
            vc.smallerCard = previousCard
            vc.largerCard = chosenCard
        } else {
            print("Give two drinks!")
            vc.smallerCard = chosenCard
            vc.largerCard = previousCard
        }
        vc.playingDeck = playingDeck
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func equalToTapped(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        
        let vc = storyboard?.instantiateViewController(identifier: "insideOrOutsideVC") as! InsideOrOutsideViewController
        if(chosenCard.getRank() == previousCard.getRank()) {
            print("Give two drinks!")
            vc.smallerCard = chosenCard
            vc.largerCard = previousCard
        } else {
            print("Take a drink!")
            if(chosenCard.getRank() <= previousCard.getRank()) {
                vc.smallerCard = chosenCard
                vc.largerCard = previousCard
            } else {
                vc.smallerCard = previousCard
                vc.largerCard = chosenCard
            }
        }
        vc.playingDeck = playingDeck
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func greaterThanTapped(_ sender: Any) {
        let chosenCard = playingDeck.drawCard()
        cardToGuess.image = chosenCard.frontImage
        
        let vc = storyboard?.instantiateViewController(identifier: "insideOrOutsideVC") as! InsideOrOutsideViewController
        if(chosenCard.getRank() <= previousCard.getRank()) {
            print("Take a drink!")
            vc.smallerCard = chosenCard
            vc.largerCard = previousCard
        } else {
            print("Give two drinks!")
            vc.smallerCard = previousCard
            vc.largerCard = chosenCard
        }
        vc.playingDeck = playingDeck
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}
