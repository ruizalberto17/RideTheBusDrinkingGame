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
    
    func getPlayerCards() -> [PlayingCard]{
        return self.playerCards
    }
    
    
}
