//
//  Player.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/7/21.
//

import Foundation

class Player {
    internal var name: String = String()
    internal var playerCards = [PlayingCard]()
    internal var id: Int = Int()
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    
    func addCard(cardToAdd: PlayingCard) {
        playerCards.append(cardToAdd)
    }
    
    func getPlayerCards() -> [PlayingCard] {
        return self.playerCards
    }
    
    func getLargest() -> PlayingCard {
        if self.playerCards[0].getRank() > self.playerCards[1].getRank() {
            return self.playerCards[0]
        } else {
            return self.playerCards[1]
        }
    }
    
    func getSmallest() -> PlayingCard {
        if self.playerCards[0].getRank() < self.playerCards[1].getRank() {
            return self.playerCards[0]
        } else {
            return self.playerCards[1]
        }
    }
    
}
