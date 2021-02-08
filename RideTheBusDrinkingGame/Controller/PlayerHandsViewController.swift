//
//  PlayerHandsViewController.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/8/21.
//

import UIKit

class PlayerHandsViewController: UIViewController {
    @IBOutlet weak var firstPlayerLabel: UILabel!
    @IBOutlet weak var secondPlayerLabel: UILabel!
    @IBOutlet weak var thirdPlayerLabel: UILabel!
    
    @IBOutlet weak var p1card1: UIImageView!
    @IBOutlet weak var p1card2: UIImageView!
    @IBOutlet weak var p1card3: UIImageView!
    @IBOutlet weak var p1card4: UIImageView!
    @IBOutlet weak var p2card1: UIImageView!
    @IBOutlet weak var p2card2: UIImageView!
    @IBOutlet weak var p2card3: UIImageView!
    @IBOutlet weak var p2card4: UIImageView!
    @IBOutlet weak var p3card1: UIImageView!
    @IBOutlet weak var p3card2: UIImageView!
    @IBOutlet weak var p3card3: UIImageView!
    @IBOutlet weak var p3card4: UIImageView!
    
    var playerGroup: PlayerGroup!
    var playingDeck: PlayingCardDeck!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstPlayerLabel.text = playerGroup.group[0].name
        secondPlayerLabel.text = playerGroup.group[1].name
        thirdPlayerLabel.text = playerGroup.group[2].name
        p1card1.image = playerGroup.group[0].playerCards[0].frontImage
        p1card2.image = playerGroup.group[0].playerCards[1].frontImage
        p1card3.image = playerGroup.group[0].playerCards[2].frontImage
        p1card4.image = playerGroup.group[0].playerCards[3].frontImage
        p2card1.image = playerGroup.group[1].playerCards[0].frontImage
        p2card2.image = playerGroup.group[1].playerCards[1].frontImage
        p2card3.image = playerGroup.group[1].playerCards[2].frontImage
        p2card4.image = playerGroup.group[1].playerCards[3].frontImage
        p3card1.image = playerGroup.group[2].playerCards[0].frontImage
        p3card2.image = playerGroup.group[2].playerCards[1].frontImage
        p3card3.image = playerGroup.group[2].playerCards[2].frontImage
        p3card4.image = playerGroup.group[2].playerCards[3].frontImage
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
