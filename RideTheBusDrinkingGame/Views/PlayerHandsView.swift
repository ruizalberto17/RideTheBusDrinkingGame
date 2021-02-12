//
//  PlayerHandsView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/9/21.
//

import SwiftUI

struct PlayerHandsView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                Image("Background").ignoresSafeArea()
            } else {
                Image("Background")
            }
            VStack(alignment: .center){
                ForEach(viewRouter.playerGroup.group, id: \.self) { player in
                    Text(player.name).bold().font(.title)
                    HStack(alignment: .center) {
                        ForEach(player.playerCards, id: \.self) { card in
                            Image(card.getFrontImageName()).resizable().scaledToFit()
                        }
                    }
                }
                Spacer()
            }.frame(width: 400, height: 700, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct PlayerHandsView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerHandsView().environmentObject(ViewRouter())
    }
}
