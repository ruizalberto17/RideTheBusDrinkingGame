//
//  ViewRouter.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/9/21.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .page10
    @Published var currentRound: Page = .page1
    @Published var playerGroup: PlayerGroup = PlayerGroup()
    @Published var deck: Deck = Deck.createDeck()
    @Published var currentPlayer: Int = 0
    @Published var chosenCard: Card = Card()
    @Published var busDeck: Deck = Deck.createDeck()
    @Published var currentBusCards: [Card] = [Card(), Card(), Card(), Card(), Card(), Card(), Card(), Card(), Card(), Card(), Card(), Card(), Card(), Card(), Card(), Card()]
    
    func addCardToCurrentPlayer(cardToAdd: Card) {
        self.playerGroup.group[self.currentPlayer].addCard(cardToAdd: cardToAdd)
    }
    
    func getCurrentPlayer() -> Player {
        return self.playerGroup.group[self.currentPlayer]
    }
}
