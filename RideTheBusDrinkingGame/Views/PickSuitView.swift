//
//  PickSuitView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/9/21.
//

import SwiftUI

struct PickSuitView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var chosenCard: Card
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 5) {
                HStack {
                    Spacer()
                    NavigationLink(destination: PlayerHandsView(),
                                   label: {
                                    Text("Show Hands").foregroundColor(.white).background(Color.blue)
                                   }).padding(.trailing, 8)
                }
                Text(viewRouter.getCurrentPlayer().name).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Image(chosenCard.getFrontImageName()).resizable().scaledToFit()
                Spacer()
                Text("Guess the suit of the card.").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold).multilineTextAlignment(.center)
                Spacer()
                Spacer()
                HStack(alignment: .center) {
                    Spacer()
                    Button(action: { withAnimation{
                        revealCard()
                        if !chosenCard.getSuit().elementsEqual("Spade") {
                            print("Take a drink!")
                            viewRouter.currentPage = .takeDrink
                        } else {
                            print("Give four drinks!")
                            viewRouter.currentPage = .giveDrink
                        }
                    }}, label: {
                        Text("Spade").foregroundColor(.white)
                    }).background(Image("black_button"))
                    Spacer()
                    Button(action:  { withAnimation{
                        revealCard()
                        if !chosenCard.getSuit().elementsEqual("Diamond") {
                            print("Take a drink!")
                            viewRouter.currentPage = .takeDrink
                        } else {
                            print("Give four drinks!")
                            viewRouter.currentPage = .giveDrink
                        }
                    }}, label: {
                        Text("Diamond").foregroundColor(.white)
                    }).background(Image("red_button"))
                    Spacer()
                    Button(action:  { withAnimation{
                        revealCard()
                        if !chosenCard.getSuit().elementsEqual("Club") {
                            print("Take a drink!")
                            viewRouter.currentPage = .takeDrink
                        } else {
                            print("Give four drinks!")
                            viewRouter.currentPage = .giveDrink
                        }
                    }}, label: {
                        Text("Club").foregroundColor(.white)
                    }).background(Image("black_button"))
                    Spacer()
                    Button(action:  { withAnimation{
                        revealCard()
                        if !chosenCard.getSuit().elementsEqual("Heart") {
                            print("Take a drink!")
                            viewRouter.currentPage = .takeDrink
                        } else {
                            print("Give four drinks!")
                            viewRouter.currentPage = .giveDrink
                        }
                    }}, label: {
                        Text("Heart").foregroundColor(.white)
                    }).background(Image("red_button"))
                    Spacer()
                }
                Spacer()
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

struct PickSuit_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PickSuitView(chosenCard: Card()).environmentObject(ViewRouter())
        }
    }
}
