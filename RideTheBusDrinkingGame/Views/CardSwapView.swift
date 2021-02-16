//
//  CardSwapView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/13/21.
//

import SwiftUI

struct CardSwapView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        VStack {
            Text("Take")
            HStack {
                Image(viewRouter.currentCardSwapCards[0].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if viewRouter.currentCardSwapPhase == 0 {
                        viewRouter.currentCardSwapCards[0].isFaceUp = true
                        viewRouter.currentCardSwapPhase += 1
                        viewRouter.chosenCard = viewRouter.currentCardSwapCards[0]
                        playersToDrink()
                        viewRouter.currentPage = .cardSwapTakeDrink
                    }
                }
                Image(viewRouter.currentCardSwapCards[1].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if viewRouter.currentCardSwapPhase == 2 {
                        viewRouter.currentCardSwapCards[1].isFaceUp = true
                        viewRouter.currentCardSwapPhase += 1
                        viewRouter.chosenCard = viewRouter.currentCardSwapCards[1]
                        playersToDrink()
                        viewRouter.currentPage = .cardSwapTakeDrink
                    }
                }
                Image(viewRouter.currentCardSwapCards[2].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if viewRouter.currentCardSwapPhase == 4 {
                        viewRouter.currentCardSwapCards[2].isFaceUp = true
                        viewRouter.currentCardSwapPhase += 1
                        viewRouter.chosenCard = viewRouter.currentCardSwapCards[2]
                        playersToDrink()
                        viewRouter.currentPage = .cardSwapTakeDrink
                    }
                }
                Image(viewRouter.currentCardSwapCards[3].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if viewRouter.currentCardSwapPhase == 6 {
                        viewRouter.currentCardSwapCards[3].isFaceUp = true
                        viewRouter.currentCardSwapPhase += 1
                        viewRouter.chosenCard = viewRouter.currentCardSwapCards[3]
                        playersToDrink()
                        viewRouter.currentPage = .cardSwapTakeDrink
                    }
                }
            }
            Text("Give")
            HStack {
                Image(viewRouter.currentCardSwapCards[4].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if viewRouter.currentCardSwapPhase == 1 {
                        viewRouter.currentCardSwapCards[4].isFaceUp = true
                        viewRouter.currentCardSwapPhase += 1
                        //viewRouter.currentPage = .giveDrink
                        playersToGiveCard()
                    }
                }
                Image(viewRouter.currentCardSwapCards[5].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if viewRouter.currentCardSwapPhase == 3 {
                        viewRouter.currentCardSwapCards[5].isFaceUp = true
                        viewRouter.currentCardSwapPhase += 1
                        //viewRouter.currentPage = .giveDrink
                    }
                }
                Image(viewRouter.currentCardSwapCards[6].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if viewRouter.currentCardSwapPhase == 5 {
                        viewRouter.currentCardSwapCards[6].isFaceUp = true
                        viewRouter.currentCardSwapPhase += 1
                        //viewRouter.currentPage = .giveDrink
                    }
                }
                Image(viewRouter.currentCardSwapCards[7].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if viewRouter.currentCardSwapPhase == 7 {
                        viewRouter.currentCardSwapCards[7].isFaceUp = true
                        //viewRouter.currentPage = .giveDrink
                        viewRouter.currentRound = .busRide
                        viewRouter.currentPage = .busRide
                    }
                }
                
            }
        }.background(Image("Background").edgesIgnoringSafeArea(.all))
        .frame(width: 400, height: 700, alignment: .center)
        .onAppear(perform: {
            loadCards()
        })
    }
    
    func loadCards() {
        for index in 0...7 {
            if viewRouter.currentCardSwapCards[index].isGeneric {
                viewRouter.currentCardSwapCards[index] = viewRouter.deck.drawCard()
            }
        }
        checkCards()
    }
    
    func checkCards() {
        for index in 0...7 {
            while !viewRouter.ranksInPlayerHands.contains(viewRouter.currentCardSwapCards[index].getRank()) {
                print("Replaced a card!")
                viewRouter.currentCardSwapCards[index] = viewRouter.deck.drawCard()
            }
        }
    }
    
    func playersToDrink() {
        viewRouter.drinkGroup.removeAll()
        for player in viewRouter.playerGroup.group {
            if player.containsRank(rank: viewRouter.chosenCard.getRank()) {
                print(player.name)
                viewRouter.drinkGroup.append(player)
            }
        }
    }
    
    func playersToGiveCard() {
        for player in viewRouter.playerGroup.group {
            if player.containsRank(rank: viewRouter.chosenCard.getRank()) {
                viewRouter.currentPage = .cardSwapGiveDrink
            }
        }
    }
}

struct CardSwapView_Previews: PreviewProvider {
    static var previews: some View {
        CardSwapView().environmentObject(ViewRouter())
    }
}
