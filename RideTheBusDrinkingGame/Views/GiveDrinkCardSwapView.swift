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
                    for index in 0...viewRouter.playerGroup.group.count-1 {
                        if viewRouter.playerGroup.group[index].name.elementsEqual(viewRouter.chosenCard.currentHolder) {
                            viewRouter.playerGroup.group[index].removeCard(idOfCardToRemove: viewRouter.chosenCard.id)
                            print("did remove to original owner")
                        }
                    }
                    for index in 0...viewRouter.playerGroup.group.count-1 {
                        if viewRouter.playerGroup.group[index].name.elementsEqual(player.name) {
                            viewRouter.chosenCard.currentHolder = viewRouter.playerGroup.group[index].name
                            viewRouter.playerGroup.group[index].addCard(cardToAdd: viewRouter.chosenCard)
                            print("did add to new owner")
                        }
                    }
                    //viewRouter.chosenCard.currentHolder = player.name
                    print(viewRouter.chosenCard.toString())
                    viewRouter.playerGroup.printPlayerHands()
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
            viewRouter.chosenCard = viewRouter.cardsToGive.popLast()!
            if viewRouter.currentPage == .cardSwapGiveDrink {
                viewRouter.currentPage = .cardSwapGiveDrink2
            } else {
                viewRouter.currentPage = .cardSwapGiveDrink
            }
        } else if viewRouter.currentRound == .busRide {
            viewRouter.currentPage = .busRide
        } else {
            viewRouter.currentPage = .cardSwap
        }
    }
}

struct GiveDrinkCardSwapView_Previews: PreviewProvider {
    static var previews: some View {
        GiveDrinkCardSwapView().environmentObject(ViewRouter())
    }
}
