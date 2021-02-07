//
//  PickSuitViewController.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/5/21.
//

import UIKit

class PickSuitViewController: UIViewController {
    let suits = ["D","H","C","S"]

    @IBOutlet weak var cardToGuess: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func tappedClub(_ sender: Any) {
        let value = Int.random(in: 2...14)
        let suitValue = suits[Int.random(in: 0...3)]
        let cardImage = String(value) + suitValue
        cardToGuess.image = UIImage(named: cardImage)
        if (!suitValue.elementsEqual("C")) {
            print("Take a drink!")
        } else {
            print("Give four drinks!")
        }
    }
    
    @IBAction func tappedDiamond(_ sender: Any) {
        let value = Int.random(in: 2...14)
        let suitValue = suits[Int.random(in: 0...3)]
        let cardImage = String(value) + suitValue
        cardToGuess.image = UIImage(named: cardImage)
        if (!suitValue.elementsEqual("D")) {
            print("Take a drink!")
        } else {
            print("Give four drinks!")
        }
    }
    
    @IBAction func tappedSpade(_ sender: Any) {
        let value = Int.random(in: 2...14)
        let suitValue = suits[Int.random(in: 0...3)]
        let cardImage = String(value) + suitValue
        cardToGuess.image = UIImage(named: cardImage)
        if (!suitValue.elementsEqual("S")) {
            print("Take a drink!")
        } else {
            print("Give four drinks!")
        }
    }
    
    @IBAction func tappedHeart(_ sender: Any) {
        let value = Int.random(in: 2...14)
        let suitValue = suits[Int.random(in: 0...3)]
        let cardImage = String(value) + suitValue
        cardToGuess.image = UIImage(named: cardImage)
        if (!suitValue.elementsEqual("H")) {
            print("Take a drink!")
        } else {
            print("Give four drinks!")
        }
    }
}
