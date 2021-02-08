//
//  PlayingCard.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/7/21.
//

import UIKit

class PlayingCard {
    internal var rank: Int
    internal var suit: String
    internal var color: String
    internal var frontImage: UIImage
    internal var backImage: UIImage
    internal var isFaceUp: Bool
    
    init() {
        backImage = UIImage(named: "gray_back")!
        isFaceUp = false
        frontImage = UIImage(named: "gray_back")!
        rank = Int()
        suit = String()
        color = "Red"
    }
    
    init(withRank: Int, ofSuit: String){
        self.rank = withRank
        self.suit = ofSuit
        frontImage = UIImage(named: "\(String(rank)+suit)")!
        if ofSuit.elementsEqual("Diamond") || ofSuit.elementsEqual("Heart") {
            color = "Red"
        } else {
            color = "Black"
        }
        backImage = UIImage(named: "gray_back")!
        isFaceUp = false
    }
    
    class func validRanks () -> [Int] {
        return [1,2,3,4,5,6,7,8,9,10,11,12,13]
    }
    
    class func maxRank() -> Int {
        return validRanks().count - 1
    }
    
    class func validSuits() -> [String] {
        return ["Heart","Spade","Diamond","Club"]
    }
    
    func toString() -> String {
        let facing: String
        if(self.isFaceUp){
            facing = " is face up."
        } else {
            facing = " is face down."
        }
        
        let description = "This PlayingCard has a face value of \(self.rank), a color of \(color), the back image is \(self.backImage), the front image is \(self.frontImage),and is of the \(suit) suit and \(facing)"
        return description
        
    }
    
    func getBackImage() -> UIImage {
        return backImage
    }
    
    func setBackImage(newImage: UIImage) {
        backImage = newImage
    }
    
    func isUp() -> Bool {
        return isFaceUp
    }
    
    func setIsFacing(isFaceUp: Bool) -> Void {
        self.isFaceUp = isFaceUp
    }
    
    func getRank() -> Int {
        return self.rank
    }
    
    func setRank(rank: Int) {
        self.rank = rank
    }
    
    func getSuit() -> String {
        return suit
    }
    
    func setSuit(suit: String) {
        self.suit = suit
    }
}
