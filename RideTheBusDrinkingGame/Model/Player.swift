//
//  Player.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/7/21.
//

import Foundation

class Playerss {
    internal var name: String = String()
    internal var playerCards = [Card]()
    internal var id: Int = Int()
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    
    func addCard(cardToAdd: Card) {
        playerCards.append(cardToAdd)
    }
    
    func removeCard(cardToRemove: Card) {
        
    }
    
    func getPlayerCards() -> [Card] {
        return self.playerCards
    }
    
    func getLargest() -> Card {
        if self.playerCards[0].getRank() > self.playerCards[1].getRank() {
            return self.playerCards[0]
        } else {
            return self.playerCards[1]
        }
    }
    
    func getSmallest() -> Card {
        if self.playerCards[0].getRank() < self.playerCards[1].getRank() {
            return self.playerCards[0]
        } else {
            return self.playerCards[1]
        }
    }
    
}
