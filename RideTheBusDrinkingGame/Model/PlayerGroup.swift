//
//  PlayerGroup.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/7/21.
//

import Foundation

class PlayerGroup {
    internal var group = [Player]()
    
    init() {
        group.append(Player(name: "Meep", id: group.count+1))
        group.append(Player(name: "Mop", id: group.count+1))
        group.append(Player(name: "Moop", id: group.count+1))
    }
}
