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
    @Published var playingCardDeck: PlayingCardDeck = PlayingCardDeck()
    @Published var currentPlayer: Int = 0
    
}
