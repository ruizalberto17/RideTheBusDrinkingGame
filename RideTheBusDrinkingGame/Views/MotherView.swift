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
        case .page1:
            BlackOrRedView(chosenCard: Card()).transition(.scale)
        case .page2:
            BlackOrRedView(chosenCard: Card()).transition(.scale)
        case .page3:
            GreaterOrLessView(chosenCard: Card()).transition(.scale)
        case .page4:
            GreaterOrLessView(chosenCard: Card()).transition(.scale)
        case .page5:
            InsideOrOutsideView(chosenCard: Card()).transition(.scale)
        case .page6:
            InsideOrOutsideView(chosenCard: Card()).transition(.scale)
        case .page7:
            PickSuitView(chosenCard: Card()).transition(.scale)
        case .page8:
            PickSuitView(chosenCard: Card()).transition(.scale)
        case .page9:
            PlayerHandsView().transition(.scale)
        case .page10:
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
