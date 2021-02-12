//
//  BusRideView.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/11/21.
//

import SwiftUI

struct BusRideView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var firstRowFlipped: Bool = false
    @State var secondRowFlipped: Bool = false
    @State var thirdRowFlipped: Bool = false
    @State var fourthRowFlipped: Bool = false
    @State var fifthRowFlipped: Bool = false
    @State var sixthRowFlipped: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image(viewRouter.currentBusCards[15].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if sixthRowFlipped {
                        viewRouter.currentBusCards[15].isFaceUp = true
                        viewRouter.chosenCard = viewRouter.currentBusCards[15]
                        if viewRouter.currentBusCards[15].getRank() == 1 || viewRouter.currentBusCards[15].getRank() >= 11 {
                            viewRouter.currentPage = .takeDrink
                        }
                    }
                }
            }
            HStack {
                Image(viewRouter.currentBusCards[13].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if fifthRowFlipped && !sixthRowFlipped && (viewRouter.currentBusCards[10].isFaceUp || viewRouter.currentBusCards[11].isFaceUp){
                        viewRouter.currentBusCards[13].isFaceUp = true
                        sixthRowFlipped = true
                        viewRouter.chosenCard = viewRouter.currentBusCards[13]
                        if viewRouter.currentBusCards[13].getRank() == 1 || viewRouter.currentBusCards[13].getRank() >= 11 {
                            viewRouter.currentPage = .takeDrink
                        }
                    }
                }
                Image(viewRouter.currentBusCards[14].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if fifthRowFlipped && !sixthRowFlipped && (viewRouter.currentBusCards[11].isFaceUp || viewRouter.currentBusCards[12].isFaceUp) {
                        viewRouter.currentBusCards[14].isFaceUp = true
                        sixthRowFlipped = true
                        viewRouter.chosenCard = viewRouter.currentBusCards[14]
                        if viewRouter.currentBusCards[14].getRank() == 1 || viewRouter.currentBusCards[14].getRank() >= 11 {
                            viewRouter.currentPage = .takeDrink
                        }
                    }
                }
            }
            HStack {
                Image(viewRouter.currentBusCards[10].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if fourthRowFlipped && !fifthRowFlipped && (viewRouter.currentBusCards[6].isFaceUp || viewRouter.currentBusCards[7].isFaceUp) {
                        viewRouter.currentBusCards[10].isFaceUp = true
                        fifthRowFlipped = true
                        viewRouter.chosenCard = viewRouter.currentBusCards[10]
                        if viewRouter.currentBusCards[10].getRank() == 1 || viewRouter.currentBusCards[10].getRank() >= 11 {
                            viewRouter.currentPage = .takeDrink
                        }
                    }
                }
                Image(viewRouter.currentBusCards[11].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if fourthRowFlipped && !fifthRowFlipped && (viewRouter.currentBusCards[7].isFaceUp || viewRouter.currentBusCards[8].isFaceUp) {
                        viewRouter.currentBusCards[11].isFaceUp = true
                        fifthRowFlipped = true
                        viewRouter.chosenCard = viewRouter.currentBusCards[11]
                        if viewRouter.currentBusCards[11].getRank() == 1 || viewRouter.currentBusCards[11].getRank() >= 11 {
                            viewRouter.currentPage = .takeDrink
                        }
                    }
                }
                Image(viewRouter.currentBusCards[12].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if fourthRowFlipped && !fifthRowFlipped && (viewRouter.currentBusCards[8].isFaceUp || viewRouter.currentBusCards[9].isFaceUp) {
                        viewRouter.currentBusCards[12].isFaceUp = true
                        fifthRowFlipped = true
                        viewRouter.chosenCard = viewRouter.currentBusCards[12]
                        if viewRouter.currentBusCards[12].getRank() == 1 || viewRouter.currentBusCards[12].getRank() >= 11 {
                            viewRouter.currentPage = .takeDrink
                        }
                    }
                }
            }
            HStack {
                Image(viewRouter.currentBusCards[6].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if thirdRowFlipped && !fourthRowFlipped && viewRouter.currentBusCards[3].isFaceUp {
                        viewRouter.currentBusCards[6].isFaceUp = true
                        fourthRowFlipped = true
                        viewRouter.chosenCard = viewRouter.currentBusCards[6]
                        if viewRouter.currentBusCards[6].getRank() == 1 || viewRouter.currentBusCards[6].getRank() >= 11 {
                            viewRouter.currentPage = .takeDrink
                        }
                    }
                }
                Image(viewRouter.currentBusCards[7].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if thirdRowFlipped && !fourthRowFlipped && (viewRouter.currentBusCards[3].isFaceUp || viewRouter.currentBusCards[4].isFaceUp) {
                        viewRouter.currentBusCards[7].isFaceUp = true
                        fourthRowFlipped = true
                        viewRouter.chosenCard = viewRouter.currentBusCards[7]
                        if viewRouter.currentBusCards[7].getRank() == 1 || viewRouter.currentBusCards[7].getRank() >= 11 {
                            viewRouter.currentPage = .takeDrink
                        }
                    }
                }
                Image(viewRouter.currentBusCards[8].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if thirdRowFlipped && !fourthRowFlipped && (viewRouter.currentBusCards[4].isFaceUp || viewRouter.currentBusCards[5].isFaceUp){
                        viewRouter.currentBusCards[8].isFaceUp = true
                        fourthRowFlipped = true
                        viewRouter.chosenCard = viewRouter.currentBusCards[8]
                        if viewRouter.currentBusCards[8].getRank() == 1 || viewRouter.currentBusCards[8].getRank() >= 11 {
                            viewRouter.currentPage = .takeDrink
                        }
                    }
                }
                Image(viewRouter.currentBusCards[9].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if thirdRowFlipped && !fourthRowFlipped && viewRouter.currentBusCards[5].isFaceUp {
                        viewRouter.currentBusCards[9].isFaceUp = true
                        fourthRowFlipped = true
                        viewRouter.chosenCard = viewRouter.currentBusCards[9]
                        if viewRouter.currentBusCards[9].getRank() == 1 || viewRouter.currentBusCards[9].getRank() >= 11 {
                            viewRouter.currentPage = .takeDrink
                        }
                    }
                }
            }
            HStack {
                Image(viewRouter.currentBusCards[3].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if secondRowFlipped && !thirdRowFlipped && viewRouter.currentBusCards[1].isFaceUp {
                        viewRouter.currentBusCards[3].isFaceUp = true
                        thirdRowFlipped = true
                        viewRouter.chosenCard = viewRouter.currentBusCards[3]
                        if viewRouter.currentBusCards[3].getRank() == 1 || viewRouter.currentBusCards[3].getRank() >= 11 {
                            viewRouter.currentPage = .takeDrink
                        }
                    }
                }
                Image(viewRouter.currentBusCards[4].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if secondRowFlipped && !thirdRowFlipped {
                        viewRouter.currentBusCards[4].isFaceUp = true
                        thirdRowFlipped = true
                        viewRouter.chosenCard = viewRouter.currentBusCards[4]
                        if viewRouter.currentBusCards[4].getRank() == 1 || viewRouter.currentBusCards[4].getRank() >= 11 {
                            viewRouter.currentPage = .takeDrink
                        }
                    }
                }
                Image(viewRouter.currentBusCards[5].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if secondRowFlipped && !thirdRowFlipped && viewRouter.currentBusCards[2].isFaceUp {
                        viewRouter.currentBusCards[5].isFaceUp = true
                        thirdRowFlipped = true
                        viewRouter.chosenCard = viewRouter.currentBusCards[5]
                        if viewRouter.currentBusCards[5].getRank() == 1 || viewRouter.currentBusCards[5].getRank() >= 11 {
                            viewRouter.currentPage = .takeDrink
                        }
                    }
                }
            }
            HStack {
                Image(viewRouter.currentBusCards[1].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if firstRowFlipped && !secondRowFlipped {
                        viewRouter.currentBusCards[1].isFaceUp = true
                        secondRowFlipped = true
                        viewRouter.chosenCard = viewRouter.currentBusCards[1]
                        if viewRouter.currentBusCards[1].getRank() == 1 || viewRouter.currentBusCards[1].getRank() >= 11 {
                            viewRouter.currentPage = .takeDrink
                        }
                    }
                }
                Image(viewRouter.currentBusCards[2].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    if firstRowFlipped && !secondRowFlipped {
                        viewRouter.currentBusCards[2].isFaceUp = true
                        secondRowFlipped = true
                        viewRouter.chosenCard = viewRouter.currentBusCards[2]
                        if viewRouter.currentBusCards[2].getRank() == 1 || viewRouter.currentBusCards[2].getRank() >= 11 {
                            viewRouter.currentPage = .takeDrink
                        }
                    }
                }
            }
            HStack {
                Image(viewRouter.currentBusCards[0].getFrontImageName()).resizable().scaledToFit().onTapGesture {
                    viewRouter.currentBusCards[0].isFaceUp = true
                    firstRowFlipped = true
                    viewRouter.chosenCard = viewRouter.currentBusCards[0]
                    if viewRouter.currentBusCards[0].getRank() == 1 || viewRouter.currentBusCards[0].getRank() >= 11 {
                        viewRouter.currentPage = .takeDrink
                    }
                }
            }
        }.background(Image("Background").edgesIgnoringSafeArea(.all)).onAppear(perform: {
            checkCards()
            resetFlippedRows()
        })
    }
    
    func checkCards() {
        viewRouter.busDeck.shuffleDeck()
        let cardsLeft: Int = viewRouter.busDeck.cardsRemaining
        var neededToFill: Int = 0
        for index in 0...15 {
            if viewRouter.currentBusCards[index].isFaceUp == true {
                neededToFill += 1
                viewRouter.currentBusCards[index] = viewRouter.busDeck.drawCard()
            }
            
            if neededToFill > cardsLeft {
                viewRouter.currentPage = .page10
            }
        }
    }
    
    func resetFlippedRows() {
        firstRowFlipped = false
        secondRowFlipped = false
        thirdRowFlipped = false
        fourthRowFlipped = false
        fifthRowFlipped = false
        sixthRowFlipped = false
    }
}

struct BusRide_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BusRideView().environmentObject(ViewRouter())
        }
    }
}

