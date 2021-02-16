//
//  BlackOrRedView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/8/21.
//

import SwiftUI

struct BlackOrRedView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var chosenCard: Card
    @State var isNavigationBarHidden: Bool = true
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center, spacing: 5) {
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: PlayerHandsView(),
                                   label: {
                                    Text("Show Hands").foregroundColor(.white).background(Color.blue)
                                   }).padding(.trailing, 8)
                }
                Spacer()
                Text(viewRouter.getCurrentPlayer().name).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Image(chosenCard.getFrontImageName()).resizable().scaledToFit()
                Spacer()
                Text("Guess whether the card will be black or red.").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold).multilineTextAlignment(.center)
                Spacer()
                HStack(alignment: .center) {
                    Spacer()
                    Button(action: { withAnimation{
                        revealCard()
                        if chosenCard.getColor().elementsEqual("Red") {
                            print("Take a drink!")
                            viewRouter.currentPage = .takeDrink
                        } else {
                            print("Give a drink!")
                            viewRouter.currentPage = .giveDrink
                        }
                    }}, label: {
                        Text("Black").foregroundColor(.white)
                    }).background(Image("black_button"))
                    Spacer()
                    Button(action:  { withAnimation{
                        revealCard()
                        if chosenCard.getColor().elementsEqual("Black") {
                            print("Take a drink!")
                            viewRouter.currentPage = .takeDrink
                        } else {
                            print("Give a drink!")
                            viewRouter.currentPage = .giveDrink
                        }
                    }}, label: {
                        Text("Red").foregroundColor(.white)
                    }).background(Image("red_button"))
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .frame(width: 400, height: 700, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Image("Background").edgesIgnoringSafeArea(.all))
        }
    }
    
    func revealCard() {
        chosenCard = viewRouter.deck.drawCard()
        chosenCard.isFaceUp = true
        viewRouter.chosenCard = chosenCard
        viewRouter.addCardToCurrentPlayer(cardToAdd: chosenCard)
        viewRouter.ranksInPlayerHands.append(chosenCard.getRank())
    }
}

struct BlackOrRedView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BlackOrRedView(chosenCard: Card()).environmentObject(ViewRouter())
        }
    }
}
