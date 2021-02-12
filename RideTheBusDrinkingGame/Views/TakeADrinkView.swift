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
        if viewRouter.currentRound == .page1 {
            viewRouter.currentPage = .page1
        } else if viewRouter.currentRound == .page3 {
            viewRouter.currentPage = .page3
        } else if viewRouter.currentRound == .page5 {
            viewRouter.currentPage = .page5
        } else {
            viewRouter.currentPage = .page7
        }
    }
    
    func continueToNextRound() {
        viewRouter.currentPlayer = 0
        if viewRouter.currentRound == .page1 {
            viewRouter.currentRound = .page3
            viewRouter.currentPage = .page3
        } else if viewRouter.currentRound == .page3 {
            viewRouter.currentRound = .page5
            viewRouter.currentPage = .page5
        } else if viewRouter.currentRound == .page5 {
            viewRouter.currentRound = .page7
            viewRouter.currentPage = .page7
        } else {
            viewRouter.currentRound = .page9
            viewRouter.currentPage = .page9
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
