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
            Text(viewRouter.getCurrentPlayer().name).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("Give your card to someone!").bold().font(.largeTitle)
            Image(viewRouter.chosenCard.getFrontImageName()).resizable().scaledToFit()
            Spacer()
            ForEach(viewRouter.playerGroup.group, id: \.self) { player in
                Button(action: {
                    
                }, label: {
                    Text(player.name).background(Image("black_button"))
                })
            }
            Spacer()
        }
        .background(Image("Background").edgesIgnoringSafeArea(.all))
        .frame(width: 400, height: 700, alignment: .center)
    }
}

struct GiveDrinkCardSwapView_Previews: PreviewProvider {
    static var previews: some View {
        GiveDrinkCardSwapView().environmentObject(ViewRouter())
    }
}
