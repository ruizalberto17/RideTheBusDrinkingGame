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
    
    var previousCard: String = ""
    var previousCardValue: Int = 0
    let suits = ["D","H","C","S"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstCard.image = UIImage(named: previousCard)
    }
    
    @IBAction func lessThanTapped(_ sender: Any) {
        let value = Int.random(in: 2...14)
        let suitValue = suits[Int.random(in: 0...3)]
        let cardImage = String(value) + suitValue
        cardToGuess.image = UIImage(named: cardImage)
        let vc = storyboard?.instantiateViewController(identifier: "insideOrOutsideVC") as! InsideOrOutsideViewController
        if(value >= previousCardValue) {
            print("Take a drink!")
            vc.smallerCard = previousCard
            vc.smallerCardValue = previousCardValue
            vc.largerCard = cardImage
            vc.largerCardValue = value
        } else {
            print("Give two drinks!")
            vc.smallerCard = cardImage
            vc.smallerCardValue = value
            vc.largerCard = previousCard
            vc.largerCardValue = previousCardValue
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func equalToTapped(_ sender: Any) {
        let value = Int.random(in: 2...14)
        let suitValue = suits[Int.random(in: 0...3)]
        let cardImage = String(value) + suitValue
        cardToGuess.image = UIImage(named: cardImage)
        let vc = storyboard?.instantiateViewController(identifier: "insideOrOutsideVC") as! InsideOrOutsideViewController
        if(value == previousCardValue) {
            print("Give two drinks!")
            vc.smallerCard = cardImage
            vc.smallerCardValue = value
            vc.largerCard = previousCard
            vc.largerCardValue = previousCardValue
        } else {
            print("Take a drink!")
            if(value <= previousCardValue) {
                vc.smallerCard = cardImage
                vc.smallerCardValue = value
                vc.largerCard = previousCard
                vc.largerCardValue = previousCardValue
            } else {
                vc.smallerCard = previousCard
                vc.smallerCardValue = previousCardValue
                vc.largerCard = cardImage
                vc.largerCardValue = value
            }
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func greaterThanTapped(_ sender: Any) {
        let value = Int.random(in: 2...14)
        let suitValue = suits[Int.random(in: 0...3)]
        let cardImage = String(value) + suitValue
        cardToGuess.image = UIImage(named: cardImage)
        let vc = storyboard?.instantiateViewController(identifier: "insideOrOutsideVC") as! InsideOrOutsideViewController
        if(value <= previousCardValue) {
            print("Take a drink!")
            vc.smallerCard = cardImage
            vc.smallerCardValue = value
            vc.largerCard = previousCard
            vc.largerCardValue = previousCardValue
        } else {
            print("Give two drinks!")
            vc.smallerCard = previousCard
            vc.smallerCardValue = previousCardValue
            vc.largerCard = cardImage
            vc.largerCardValue = value
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}
