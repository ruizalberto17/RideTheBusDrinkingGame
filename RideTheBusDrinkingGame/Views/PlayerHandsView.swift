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
            VStack{
                
            }
        }
    }
}

struct PlayerHandsView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerHandsView().environmentObject(ViewRouter())
    }
}

