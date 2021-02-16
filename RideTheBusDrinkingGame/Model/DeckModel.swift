//
//  DeckModel.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/9/21.
//

import Foundation

struct Deck: Hashable, Codable {
    private var cards: [Card]
    lazy var cardsRemaining = 0
        
    static public func createDeck() -> Deck {
        var deck: [Card] = []
        for suit in Card.validSuits() {
            for rank in Card.validRanks() {
                let currentCard: Card = Card(rank: rank, suit: suit)
                deck.append(currentCard)
            }
        }
        deck.shuffle()
        return Deck(cards: deck)
    }
    
    public init(cards: [Card]){
        self.cards = cards
        self.cardsRemaining = cards.count
    }
    
    func printCards() -> String {
        var cards = ""
        for Card in self.cards {
            cards += Card.toString() + " "
        }
        return cards
    }
    
    mutating func shuffleDeck() {
        self.cards.shuffle()
    }
    
    mutating func drawCard() -> Card {
        if self.cards.isEmpty {
            print("No cards left in deck!")
            return Card()
        } else {
            let cardDrawn: Card = cards.popLast()!
            self.cardsRemaining = self.cards.count
            print("You drew: ")
            print(cardDrawn.toString())
            print(self.cardsRemaining)
            self.shuffleDeck()
            return cardDrawn
        }
    }
}
