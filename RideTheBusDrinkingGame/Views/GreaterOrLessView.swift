//
//  GreaterOrLessView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/9/21.
//

import SwiftUI

struct GreaterOrLessView: View {
    
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
                Spacer()
                Text(viewRouter.getCurrentPlayer().name).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Spacer()
                Image(chosenCard.getFrontImageName()).resizable().scaledToFit()
                
                Spacer()
                Text("Guess whether the card will be less than, equal to, or greater than your card.").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold).multilineTextAlignment(.center)
                Group {
                    Spacer()
                    Image(viewRouter.getCurrentPlayer().playerCards[0].getFrontImageName()).resizable().scaledToFit()
                    Spacer()
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: { withAnimation{
                            revealCard()
                            if(chosenCard.getRank() >= viewRouter.getCurrentPlayer().playerCards[0].getRank()) {
                                print("Take a drink!")
                            } else {
                                print("Give two drinks!")
                            }
                            checkIfEndOfRound()
                        }}, label: {
                            Text("Less than").foregroundColor(.white)
                        }).background(Image("black_button"))
                        
                        Spacer()
                        Button(action: { withAnimation{
                            revealCard()
                            if(chosenCard.getRank() == viewRouter.getCurrentPlayer().playerCards[0].getRank()) {
                                print("Give two drinks!")
                            } else {
                                print("Take a drink!")
                            }
                            checkIfEndOfRound()
                        }}, label: {
                            Text("Equal to").foregroundColor(.white)
                        }).background(Image("black_button"))
                        
                        Spacer()
                        Button(action: { withAnimation{
                            revealCard()
                            if(chosenCard.getRank() <= viewRouter.getCurrentPlayer().playerCards[0].getRank()) {
                                print("Give two drinks!")
                            } else {
                                print("Take a drink!")
                            }
                            checkIfEndOfRound()
                        }}, label: {
                            Text("Greater than").foregroundColor(.white)
                        }).background(Image("black_button"))
                        Spacer()
                    }
                }
            }
            .navigationBarHidden(true)
            .frame(width: 400, height: 700, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Image("Background").edgesIgnoringSafeArea(.all))
        }
    }
    
    func revealCard() {
        chosenCard = viewRouter.deck.drawCard()
        viewRouter.addCardToCurrentPlayer(cardToAdd: chosenCard)
    }
    
    func checkIfEndOfRound() {
        if viewRouter.currentPlayer < viewRouter.playerGroup.group.count-1 {
            continueToNextPlayer()
        } else {
            continueToNextRound()
        }
    }
    
    func continueToNextPlayer() {
        viewRouter.currentPlayer += 1
        if viewRouter.currentPage == .page3 {
            viewRouter.currentPage = .page4
        } else {
            viewRouter.currentPage = .page3
        }
    }
    
    func continueToNextRound() {
        viewRouter.currentPlayer = 0
        viewRouter.currentPage = .page5
    }
}

struct GreaterOrLessView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GreaterOrLessView(chosenCard: Card()).environmentObject(ViewRouter())
        }
    }
}
