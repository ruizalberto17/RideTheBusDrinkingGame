//
//  GiveDrinkCardSwapView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/13/21.
//

import SwiftUI

struct GiveDrinkCardSwapView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Spacer()
            Text(viewRouter.chosenCard.currentHolder).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("Give your card to someone!").bold().font(.largeTitle)
            Image(viewRouter.chosenCard.getFrontImageName()).resizable().scaledToFit()
            Spacer()
            ForEach(viewRouter.playerGroup.group, id: \.self) { player in
                Button(action: {
                    for cardOwner in viewRouter.playerGroup.group {
                        if(cardOwner.name.elementsEqual(viewRouter.chosenCard.currentHolder)) {
                            cardOwner.removeCard(viewRouter.chosenCard.id)
                        }
                    }
                    player.addCard(viewRouter.chosenCard)
                    viewRouter.chosenCard.currentHolder = player.name
                    isThereMoreToGive()            
                }, label: {
                    Text(player.name).background(Image("black_button"))
                })
            }
            Spacer()
        }
        .background(Image("Background").edgesIgnoringSafeArea(.all))
        .frame(width: 400, height: 700, alignment: .center)
    }

    func isThereMoreToGive() {
        if !viewRouter.cardsToGive.isEmpty {
            viewRouter.chosenCard = viewRouter.cardsToGive.popLast()
            if viewRouter.currentPage == .GiveDrinkCardSwapView {
                viewRouter.currentPage = .GiveDrinkCardSwapView2
            } else {
                viewRouter.currentPage = .GiveDrinkCardSwapView
            }
        } else {
            viewRouter.currentPage = .CardSwapView
        }
    }
}

struct GiveDrinkCardSwapView_Previews: PreviewProvider {
    static var previews: some View {
        GiveDrinkCardSwapView().environmentObject(ViewRouter())
    }
}
