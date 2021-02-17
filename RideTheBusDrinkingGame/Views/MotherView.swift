//
//  MotherView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/9/21.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .blackOrRed:
            BlackOrRedView(chosenCard: Card()).transition(.scale)
        case .greaterOrLess:
            GreaterOrLessView(chosenCard: Card()).transition(.scale)
        case .insideOrOutside:
            InsideOrOutsideView(chosenCard: Card()).transition(.scale)
        case .pickSuit:
            PickSuitView(chosenCard: Card()).transition(.scale)
        case .cardSwap:
            CardSwapView().transition(.scale)
        case .cardSwapTakeDrink:
            TakeADrinkCardSwapView().transition(.scale)
        case .cardSwapGiveDrink:
            GiveDrinkCardSwapView().transition(.scale)
        case .cardSwapGiveDrink2:
            GiveDrinkCardSwapView().transition(.scale)
        case .playerHands:
            PlayerHandsView().transition(.scale)
        case .addPlayers:
            AddPlayersView().transition(.scale)
        case .giveDrink:
            GiveDrinkView().transition(.scale)
        case .takeDrink:
            TakeADrinkView().transition(.scale)
        case .busRide:
            BusRideView().transition(.scale)
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
