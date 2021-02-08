//
//  PlayingCardDeck.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/7/21.
//

import Foundation

class PlayingCardDeck {
    
    lazy var cards = [PlayingCard]()
    lazy var cardsRemaining = 0
        
    init() {
        for suit in PlayingCard.validSuits() {
            for rank in PlayingCard.validRanks() {
                let currentCard: PlayingCard = PlayingCard(withRank: rank, ofSuit: suit)
                self.cards.append(currentCard)
            }
        }
        cardsRemaining = cards.count
        shuffleDeck()
    }
    
    func printCards() -> String {
        var cards = ""
        for playingCards in self.cards {
            cards += playingCards.toString() + " "
        }
        return cards
    }
    
    func shuffleDeck() {
        self.cards.shuffle()
    }
    
    func drawCard() -> PlayingCard {
        if self.cards.count >= 1 {
            let cardDrawn: PlayingCard = cards.popLast()!
            self.cardsRemaining -= 1
            print("You drew: ")
            print(String(cardDrawn.getRank()) + cardDrawn.getSuit())
            print(cardsRemaining)
            return cardDrawn
        } else {
            print("No cards left in deck!")
            return PlayingCard()
        }
    }
}
