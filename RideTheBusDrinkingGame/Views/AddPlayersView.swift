//
//  AddPlayersView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/9/21.
//

import SwiftUI

struct AddPlayersView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var numberOfPlayers = 2
    @State private var players: [String] = ["",""]
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
            Spacer()
            Text("Ride The Bus").bold().font(.largeTitle).foregroundColor(.black)
            Image("bus").resizable().scaledToFit()
            Spacer().onTapGesture {
                hideKeyboard()
            }
            Text("Add players to the game").font(.headline).foregroundColor(.black)
            Spacer().onTapGesture {
                hideKeyboard()
            }
            Group{
                Stepper(onIncrement: {
                    if(self.numberOfPlayers < 12){
                        self.players.append("")
                        self.numberOfPlayers += 1
                    }
                },
                onDecrement: {
                    if(self.numberOfPlayers > 2){
                        self.players.removeLast()
                        self.numberOfPlayers -= 1
                    }
                }) {
                    VStack {
                        ForEach(Array(players.enumerated()), id: \.0) { i, _ in
                            TextField("Player Name", text: $players[i])
                        }
                    }
                }
            }
            Spacer()
            Button(action: {
                var people: [Player] = []
                for player in players {
                    people.append(Player(name: player))
                }
                viewRouter.playerGroup = PlayerGroup(players: people)
                viewRouter.currentPage = .page1
            }, label: {
                Text("Start Game")
            })
        }
        .frame(width: 400, height: 700, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Image("Background").edgesIgnoringSafeArea(.all))
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TextFieldView: View {
    var i: Int
    @State var players: [String]
    var body: some View {
        TextField("Player Name", text: self.$players[i])
    }
}

struct AddPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddPlayersView().environmentObject(ViewRouter())
        }
    }
}
