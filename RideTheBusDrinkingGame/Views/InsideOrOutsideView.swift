//
//  InsideOrOutsideView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/9/21.
//

import SwiftUI

struct InsideOrOutsideView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var chosenCard: PlayingCard
    
    var body: some View {
        let largerCard = viewRouter.playerGroup.group[viewRouter.currentPlayer].getLargest()
        let smallerCard = viewRouter.playerGroup.group[viewRouter.currentPlayer].getSmallest()
        
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
                Text("Guess whether the card will be inside or outside your cards.").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold).multilineTextAlignment(.center)
                Spacer()
                HStack(alignment: .center){
                    Spacer()
                    Image(smallerCard.frontImageName).resizable().scaledToFit()
                    Spacer()
                    Image(largerCard.frontImageName).resizable().scaledToFit()
                    Spacer()
                }
                Spacer()
                HStack(alignment: .center) {
                    Spacer()
                    Button(action: { withAnimation{
                        revealCard()
                        if(chosenCard.getRank() >= largerCard.getRank() || chosenCard.getRank() <= smallerCard.getRank()) {
                            print("Take a drink!")
                        } else {
                            print("Give three drink!")
                        }
                        checkIfEndOfRound()
                    }}, label: {
                        Text("Inside").foregroundColor(.white)
                    }).background(Image("black_button"))
                    Spacer()
                    Button(action:  { withAnimation{
                        revealCard()
                        if(chosenCard.getRank() <= largerCard.getRank() && chosenCard.getRank() >= smallerCard.getRank()) {
                            print("Take a drink!")
                        } else {
                            print("Give three drinks!")
                        }
                        checkIfEndOfRound()
                    }}, label: {
                        Text("Outside").foregroundColor(.white)
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
        if viewRouter.currentPage == .page5 {
            viewRouter.currentPage = .page6
        } else {
            viewRouter.currentPage = .page5
        }
    }
    
    func continueToNextRound() {
        viewRouter.currentPlayer = 0
        viewRouter.currentPage = .page7
    }
}

struct InsideOrOutside_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InsideOrOutsideView(chosenCard: PlayingCard()).environmentObject(ViewRouter())
        }
    }
}
