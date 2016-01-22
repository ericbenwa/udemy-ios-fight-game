//
//  Player.swift
//  fight-game
//
//  Created by Eric Benoit on 1/21/16.
//  Copyright © 2016 Eric Benoit. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name: String = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    convenience init(name: String, hp: Int, attackPower: Int) {
        self.init(startingHp: hp, attackPower: attackPower)
        _name = name
    }

}