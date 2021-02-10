//
//  ViewRouter.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/9/21.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .page1
    @Published var playerGroup: PlayerGroup = PlayerGroup()
    @Published var deck: Deck = Deck.createDeck()
    @Published var currentPlayer: Int = 0
    
    func addCardToCurrentPlayer(cardToAdd: Card) {
        self.playerGroup.group[self.currentPlayer].addCard(cardToAdd: cardToAdd)
    }
    
    func getCurrentPlayer() -> Player {
        return self.playerGroup.group[self.currentPlayer]
    }
    
}
