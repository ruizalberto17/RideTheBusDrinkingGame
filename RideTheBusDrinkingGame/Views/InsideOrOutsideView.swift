//
//  InsideOrOutsideView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/9/21.
//

import SwiftUI

struct InsideOrOutsideView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var chosenCard: Card
    
    var body: some View {
        let largerCard = viewRouter.getCurrentPlayer().getLargest()
        let smallerCard = viewRouter.getCurrentPlayer().getSmallest()
        
        NavigationView {
            VStack(alignment: .center, spacing: 5) {
                HStack {
                    Spacer()
                    NavigationLink(destination: PlayerHandsView(),
                                   label: {
                                    Text("Show Hands").foregroundColor(.white).background(Color.blue)
                                   }).padding(.trailing, 8)
                }
                Group {
                    Text(viewRouter.getCurrentPlayer().name).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Image(chosenCard.getFrontImageName()).resizable().scaledToFit()
                    Spacer()
                    Text("Guess whether the card will be inside or outside your cards.").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold).multilineTextAlignment(.center)
                }
                Spacer()
                HStack(alignment: .center){
                    Spacer()
                    Image(smallerCard.getFrontImageName()).resizable().scaledToFit()
                    Spacer()
                    Image(largerCard.getFrontImageName()).resizable().scaledToFit()
                    Spacer()
                }
                Spacer()
                Spacer()
                HStack(alignment: .center) {
                    Spacer()
                    Button(action: { withAnimation{
                        revealCard()
                        if(chosenCard.getRank() >= largerCard.getRank() || chosenCard.getRank() <= smallerCard.getRank()) {
                            print("Take a drink!")
                            viewRouter.currentPage = .takeDrink
                        } else {
                            print("Give three drink!")
                            viewRouter.currentPage = .giveDrink
                        }
                    }}, label: {
                        Text("Inside").foregroundColor(.white)
                    }).background(Image("black_button"))
                    Spacer()
                    Button(action:  { withAnimation{
                        revealCard()
                        if(chosenCard.getRank() <= largerCard.getRank() && chosenCard.getRank() >= smallerCard.getRank()) {
                            print("Take a drink!")
                            viewRouter.currentPage = .takeDrink
                        } else {
                            print("Give three drinks!")
                            viewRouter.currentPage = .giveDrink
                        }
                    }}, label: {
                        Text("Outside").foregroundColor(.white)
                    }).background(Image("black_button"))
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
    }
}

struct InsideOrOutside_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InsideOrOutsideView(chosenCard: Card()).environmentObject(ViewRouter())
        }
    }
}
