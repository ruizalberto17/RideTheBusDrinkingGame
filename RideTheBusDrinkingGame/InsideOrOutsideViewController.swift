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
    
    var smallerCard: String = ""
    var smallerCardValue: Int = 0
    var largerCard: String = ""
    var largerCardValue: Int = 0
    let suits = ["D","H","C","S"]

    override func viewDidLoad() {
        super.viewDidLoad()
        lowerCard.image = UIImage(named: smallerCard)
        upperCard.image = UIImage(named: largerCard)
    }
    
    
    @IBAction func insideTapped(_ sender: Any) {
        let value = Int.random(in: 2...14)
        let suitValue = suits[Int.random(in: 0...3)]
        let cardImage = String(value) + suitValue
        cardToGuess.image = UIImage(named: cardImage)
        if(value >= largerCardValue || value <= smallerCardValue) {
            print("Take a drink!")
        } else {
            print("Give three drinks!")
        }
        let vc = storyboard?.instantiateViewController(identifier: "pickSuitVC") as! PickSuitViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func outsideTapped(_ sender: Any) {
        let value = Int.random(in: 2...14)
        let suitValue = suits[Int.random(in: 0...3)]
        let cardImage = String(value) + suitValue
        cardToGuess.image = UIImage(named: cardImage)
        if(value <= largerCardValue && value >= smallerCardValue) {
            print("Take a drink!")
        } else {
            print("Give three drinks!")
        }
        let vc = storyboard?.instantiateViewController(identifier: "pickSuitVC") as! PickSuitViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
