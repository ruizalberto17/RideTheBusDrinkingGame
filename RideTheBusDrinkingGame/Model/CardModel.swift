//
//  CardModel.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/9/21.
//

import Foundation
import SwiftUI

struct Card: Hashable, Codable {
    var rank: Int
    var suit: String
    var isFaceUp: Bool
    var isGeneric: Bool
    var id: String
    var currentHolder: String
    
    init() {
        self.rank = 0
        self.suit = ""
        self.isFaceUp = true
        self.isGeneric = true
        self.id = ""
        self.currentHolder = ""
    }
    
    init(rank: Int, suit: String) {
        self.rank = rank
        self.suit = suit
        self.isFaceUp = false
        self.isGeneric = false
        self.id = String(rank) + suit
        self.currentHolder = ""
    }
    
    static func validRanks () -> [Int] {
        return [1,2,3,4,5,6,7,8,9,10,11,12,13]
    }
    
    static func maxRank() -> Int {
        return validRanks().count - 1
    }
    
    static func validSuits() -> [String] {
        return ["Heart","Spade","Diamond","Club"]
    }
    
    func toString() -> String {
        let description = "This PlayingCard has a face value of \(self.rank), a color of \(getColor()),and is of the \(suit) suit. Card holder is \(currentHolder)"
        return description
    }
    
    func getColor() -> String {
        if self.suit.elementsEqual("Spade") || self.suit.elementsEqual("Club") {
            return "Black"
        } else {
            return "Red"
        }
    }
    
    func getRank() -> Int {
        return self.rank
    }
    
    func getSuit() -> String {
        return self.suit
    }
    
    func getFrontImageName() -> String {
        if self.rank == 0 && self.suit.elementsEqual("") || self.isFaceUp == false{
            return "gray_back"
        } else {
            return String(self.rank) + self.suit
        }
    }
    
    func getBackImageName() -> String {
        return "gray_back"
    }
    
}
