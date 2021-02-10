//
//  PickSuitView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/9/21.
//

import SwiftUI

struct PickSuitView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var chosenCard: Card
    
    var body: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                Image("Background").ignoresSafeArea()
            } else {
                Image("Background")
            }
            VStack {
                Spacer()
                Text(viewRouter.getCurrentPlayer().name).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Image(chosenCard.getFrontImageName()).resizable().scaledToFit()
                Spacer()
                Text("Guess the suit of the card.").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold).multilineTextAlignment(.center)
                Spacer()
                HStack(alignment: .center) {
                    Spacer()
                    Button(action: { withAnimation{
                        revealCard()
                        if !chosenCard.getSuit().elementsEqual("Spade") {
                            print("Take a drink!")
                        } else {
                            print("Give four drinks!")
                        }
                        checkIfEndOfRound()
                    }}, label: {
                        Text("Spade").foregroundColor(.white)
                    }).background(Image("black_button"))
                    Spacer()
                    Button(action:  { withAnimation{
                        revealCard()
                        if !chosenCard.getSuit().elementsEqual("Diamond") {
                            print("Take a drink!")
                        } else {
                            print("Give four drinks!")
                        }
                        checkIfEndOfRound()
                    }}, label: {
                        Text("Diamond").foregroundColor(.white)
                    }).background(Image("red_button"))
                    Spacer()
                    Button(action:  { withAnimation{
                        revealCard()
                        if !chosenCard.getSuit().elementsEqual("Club") {
                            print("Take a drink!")
                        } else {
                            print("Give four drinks!")
                        }
                        checkIfEndOfRound()
                    }}, label: {
                        Text("Club").foregroundColor(.white)
                    }).background(Image("black_button"))
                    Spacer()
                    Button(action:  { withAnimation{
                        revealCard()
                        if !chosenCard.getSuit().elementsEqual("Heart") {
                            print("Take a drink!")
                        } else {
                            print("Give four drinks!")
                        }
                        checkIfEndOfRound()
                    }}, label: {
                        Text("Heart").foregroundColor(.white)
                    }).background(Image("red_button"))
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    func revealCard() {
        chosenCard = viewRouter.deck.drawCard()
        viewRouter.addCardToCurrentPlayer(cardToAdd: chosenCard)
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
        if viewRouter.currentPage == .page7 {
            viewRouter.currentPage = .page8
        } else {
            viewRouter.currentPage = .page7
        }
    }
    
    func continueToNextRound() {
        viewRouter.currentPlayer = 0
        viewRouter.currentPage = .page9
    }
}

struct PickSuit_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PickSuitView(chosenCard: Card()).environmentObject(ViewRouter())
        }
    }
}
