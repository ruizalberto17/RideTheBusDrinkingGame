//
//  GreaterOrLessView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/9/21.
//

import SwiftUI

struct GreaterOrLessView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var chosenCard: PlayingCard
    
    var body: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                Image("Background").ignoresSafeArea()
            } else {
                Image("Background")
            }
            VStack {
                Spacer()
                Text(viewRouter.playerGroup.group[viewRouter.currentPlayer].name).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Spacer()
                Image(chosenCard.frontImageName).resizable().scaledToFit()
                
                Spacer()
                Text("Guess whether the card will be less than, equal to, or greater than your card.").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold).multilineTextAlignment(.center)
                
                Spacer()
                Image(viewRouter.playerGroup.group[viewRouter.currentPlayer].playerCards[0].frontImageName).resizable().scaledToFit()
                Spacer()
                
                HStack(alignment: .center) {
                    Spacer()
                    Button(action: { withAnimation{
                        revealCard()
                        if(chosenCard.getRank() >= viewRouter.playerGroup.group[viewRouter.currentPlayer].playerCards[0].getRank()) {
                            print("Take a drink!")
                        } else {
                            print("Give two drinks!")
                        }
                        checkIfEndOfRound()
                    }}, label: {
                        Text("Less than").foregroundColor(.white)
                    }).background(Image("black_button"))
                    
                    Spacer()
                    Button(action: { withAnimation{
                        revealCard()
                        if(chosenCard.getRank() == viewRouter.playerGroup.group[viewRouter.currentPlayer].playerCards[0].getRank()) {
                            print("Give two drinks!")
                        } else {
                            print("Take a drink!")
                        }
                        checkIfEndOfRound()
                    }}, label: {
                        Text("Equal to").foregroundColor(.white)
                    }).background(Image("black_button"))
                    
                    Spacer()
                    Button(action: { withAnimation{
                        revealCard()
                        if(chosenCard.getRank() <= viewRouter.playerGroup.group[viewRouter.currentPlayer].playerCards[0].getRank()) {
                            print("Give two drinks!")
                        } else {
                            print("Take a drink!")
                        }
                        checkIfEndOfRound()
                    }}, label: {
                        Text("Greater than").foregroundColor(.white)
                    }).background(Image("black_button"))
                    Spacer()
                }
            }
        }
    }
    
    func revealCard() {
        chosenCard = viewRouter.playingCardDeck.drawCard()
        viewRouter.playerGroup.group[viewRouter.currentPlayer].addCard(cardToAdd: chosenCard)
    }
    
    func checkIfEndOfRound() {
        if viewRouter.currentPlayer < viewRouter.playerGroup.group.count-1 {
            continueToNextPlayer()
        } else {
            continueToNextRound()
        }
    }
    
    func continueToNextPlayer() {
        viewRouter.currentPlayer += 1
        if viewRouter.currentPage == .page3 {
            viewRouter.currentPage = .page4
        } else {
            viewRouter.currentPage = .page3
        }
    }
    
    func continueToNextRound() {
        viewRouter.currentPlayer = 0
        viewRouter.currentPage = .page5
    }
}

struct GreaterOrLessView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GreaterOrLessView(chosenCard: PlayingCard()).environmentObject(ViewRouter())
        }
    }
}
