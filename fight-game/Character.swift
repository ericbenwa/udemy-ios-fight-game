//
//  Character.swift
//  fight-game
//
//  Created by Eric Benoit on 1/21/16.
//  Copyright © 2016 Eric Benoit. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int = 100
    private var _attackPower: Int = 10

    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHp: Int, attackPower: Int) {
        _hp = startingHp
        _attackPower = attackPower
    }
    
    func attemptAttack(attackPower: Int) -> Bool {
        _hp -= attackPower
        return true
    }
}