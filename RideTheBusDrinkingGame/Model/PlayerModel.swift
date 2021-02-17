//
//  PlayerModel.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/9/21.
//

import Foundation

struct Player: Hashable, Codable {
    var name: String
    var playerCards: [Card]
    
    init(name: String) {
        self.name = name
        self.playerCards = []
    }
    
    mutating func addCard(cardToAdd: Card) {
        self.playerCards.append(cardToAdd)
    }

    mutating func removeCard(idOfCardToRemove: String) {
        var newPlayerHand: [Card] = []
        for card in self.playerCards {
            if !card.id.elementsEqual(idOfCardToRemove) {
                newPlayerHand.append(card)
            }
        }
        self.playerCards = newPlayerHand
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
    
    func containsRank(rank: Int) -> Bool {
        for card in self.playerCards {
            if card.getRank() == rank {
                return true
            }
        }
        return false
    }
}
