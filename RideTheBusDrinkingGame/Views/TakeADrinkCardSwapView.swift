//
//  TakeADrinkCardSwapView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/13/21.
//

import SwiftUI

struct TakeADrinkCardSwapView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        VStack(alignment: .center){
            ForEach(viewRouter.drinkGroup, id: \.self) { player in
                Text(player.name).bold().font(.title)
            }
            Text("Take a drink!").bold().font(.largeTitle)
            Image(viewRouter.chosenCard.getFrontImageName()).resizable().scaledToFit()
            Spacer()
            Button(action: {
                checkIfEndOfRound()
            }, label: {
                Text("Continue").background(Image("black_button"))
            })
            Spacer()
            
            Spacer()
        }.frame(width: 400, height: 700, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Image("Background").edgesIgnoringSafeArea(.all))
    }
    
    func checkIfEndOfRound() {
        viewRouter.currentPage = viewRouter.currentRound
    }
}

struct TakeADrinkCardSwapView_Previews: PreviewProvider {
    static var previews: some View {
        TakeADrinkCardSwapView().environmentObject(ViewRouter())
    }
}
