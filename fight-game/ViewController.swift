//
//  ViewController.swift
//  fight-game
//
//  Created by Eric Benoit on 1/19/16.
//  Copyright © 2016 Eric Benoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameMessage: UILabel!
    @IBOutlet weak var hpPlayer1: UILabel!
    @IBOutlet weak var characterPlayer1: UIImageView!
    @IBOutlet weak var attackButtonPlayer1: UIButton!
    @IBOutlet weak var hpPlayer2: UILabel!
    @IBOutlet weak var characterPlayer2: UIImageView!
    @IBOutlet weak var attackButtonPlayer2: UIButton!
    
    var player1: Player!
    var player2: Player!

    @IBAction func attackButtonPlayer1Pressed(sender: AnyObject) {
        player2.attemptAttack(player1.attackPower)
        gameMessage.text = "Attacked \(player2.name) for  -\(player1.attackPower) HP"
        print(player2.hp)
        hpPlayer2.text = "\(player2.hp) HP"
        attackButtonPlayer1.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "enableAttackButtonPlayer1", userInfo: nil, repeats: false)
        
        if player2.isAlive == false {
            gameMessage.text = "\(player1.name) Wins!"
            characterPlayer2.hidden = true
            attackButtonPlayer1.hidden = true
            attackButtonPlayer2.hidden = true
            hpPlayer2.text = "0 HP"
        }
    }
    
    func enableAttackButtonPlayer1() {
        attackButtonPlayer1.enabled = true
    }

    @IBAction func attackButtonPlayer2Pressed(sender: AnyObject) {
        player1.attemptAttack(player1.attackPower)
        gameMessage.text = "Attacked \(player1.name) for -\(player2.attackPower) HP"
        print(player1.hp)
        hpPlayer1.text = "\(player1.hp) HP"
        attackButtonPlayer2.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "enableAttackButtonPlayer2", userInfo: nil, repeats: false)
        
        if player1.isAlive == false {
            gameMessage.text = "\(player2.name) Wins!"
            characterPlayer1.hidden = true
            attackButtonPlayer1.hidden = true
            attackButtonPlayer2.hidden = true
            hpPlayer1.text = "0 HP"
        }
    }
    
    func enableAttackButtonPlayer2() {
        attackButtonPlayer2.enabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        player1 = Player.init(name: "Poopy Eye", hp: 90, attackPower: 23)
        player2 = Player.init(name: "Hawk Man", hp: 94, attackPower: 21)
        
        hpPlayer1.text = "\(player1.hp) HP"
        hpPlayer2.text = "\(player2.hp) HP"
        
        gameMessage.text = "\(player1.name) versus \(player2.name)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

