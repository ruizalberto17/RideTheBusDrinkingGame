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
        self.group.append(Player(name: "Meep", id: group.count+1))
        self.group.append(Player(name: "Mop", id: group.count+1))
        self.group.append(Player(name: "Moop", id: group.count+1))
    }
    
    func getGroup() -> [Player] {
        return self.group
    }
}
