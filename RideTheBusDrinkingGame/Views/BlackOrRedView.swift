//
//  BlackOrRedView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/8/21.
//

import SwiftUI

struct BlackOrRedView: View {
    
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
                Text("Guess where the card will be black or red.").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold).multilineTextAlignment(.center)
                Spacer()
                HStack(alignment: .center) {
                    Spacer()
                    Button(action: { withAnimation{
                        revealCard()
                        if chosenCard.color.elementsEqual("Red") {
                            print("Take a drink!")
                        } else {
                            print("Give a drink!")
                        }
                        checkIfEndOfRound()
                    }}, label: {
                        Text("Black").foregroundColor(.white)
                    }).background(Image("black_button"))
                    Spacer()
                    Button(action:  { withAnimation{
                        revealCard()
                        if chosenCard.color.elementsEqual("Black") {
                            print("Take a drink!")
                        } else {
                            print("Give a drink!")
                        }
                        checkIfEndOfRound()
                    }}, label: {
                        Text("Red").foregroundColor(.white)
                    }).background(Image("red_button"))
                    Spacer()
                }
                Spacer()
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
        if viewRouter.currentPage == .page1 {
            viewRouter.currentPage = .page2
        } else {
            viewRouter.currentPage = .page1
        }
    }
    
    func continueToNextRound() {
        viewRouter.currentPlayer = 0
        viewRouter.currentPage = .page3
    }
}

struct BlackOrRedView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BlackOrRedView(chosenCard: PlayingCard()).environmentObject(ViewRouter())
        }
    }
}
