//
//  TakeADrinkView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/11/21.
//

import SwiftUI

struct TakeADrinkView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        VStack(alignment: .center, spacing: 15){
            Spacer()
            Text(viewRouter.getCurrentPlayer().name).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("Take a drink!").bold().font(.largeTitle)
            Image(viewRouter.chosenCard.getFrontImageName()).resizable().scaledToFit()
            Spacer()
            Button(action: {
                checkIfEndOfRound()
            }, label: {
                Text("Continue").background(Image("black_button"))
            })
            Spacer()
        }
        .background(Image("Background").edgesIgnoringSafeArea(.all))
        .frame(width: 400, height: 700, alignment: .center)
    }
    
    func checkIfEndOfRound() {
        if(viewRouter.currentRound == .busRide) {
            viewRouter.currentPage = .busRide
        } else if viewRouter.currentPlayer < viewRouter.playerGroup.group.count-1 {
            continueToNextPlayer()
        } else {
            continueToNextRound()
        }
    }
    
    func continueToNextPlayer() {
        viewRouter.currentPlayer += 1
        viewRouter.currentPage = viewRouter.currentRound
    }
    
    func continueToNextRound() {
        viewRouter.currentPlayer = 0
        switch viewRouter.currentRound {
        case .blackOrRed:
            viewRouter.currentRound = .greaterOrLess
            viewRouter.currentPage = .greaterOrLess
        case .greaterOrLess:
            viewRouter.currentRound = .insideOrOutside
            viewRouter.currentPage = .insideOrOutside
        case .insideOrOutside:
            viewRouter.currentRound = .pickSuit
            viewRouter.currentPage = .pickSuit
        case .pickSuit:
            viewRouter.currentRound = .cardSwap
            viewRouter.currentPage = .cardSwap
        case .cardSwap:
            viewRouter.currentRound = .busRide
            viewRouter.currentPage = .busRide
        case .cardSwapTakeDrink:
            print("")
        case .cardSwapGiveDrink:
            print("")
        case .cardSwapGiveDrink2:
            print("")
        case .playerHands:
            print("")
        case .addPlayers:
            print("")
        case .takeDrink:
            print("Take a drink!")
        case .giveDrink:
            print("Give a drink!")
        case .busRide:
            viewRouter.currentRound = .blackOrRed
            viewRouter.currentPage = .addPlayers
        }
    }
}

struct TakeADrinkView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TakeADrinkView().environmentObject(ViewRouter())
        }
    }
}
