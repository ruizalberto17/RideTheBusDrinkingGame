//
//  PlayerGroup.swift
//  RideTheBusDrinkingGame
//
//  Created by Alberto Ruiz on 2/7/21.
//

import Foundation

struct PlayerGroup: Hashable, Codable {
    var group: [Player]
    
    init() {
        self.group = []
        self.group.append(Player(name: "Meep"))
        self.group.append(Player(name: "Mop"))
        self.group.append(Player(name: "Moop"))
    }
    
    init(players: [Player]) {
        self.group = players
    }
    
    func getGroup() -> [Player] {
        return self.group
    }
}
