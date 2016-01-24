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
    @IBOutlet weak var restartButton: UIButton!
    
    var player1: Player!
    var player2: Player!

    @IBAction func attackButtonPlayer1Pressed(sender: AnyObject) {
        attackPressed(player1, fightee: player2, hpLabel: hpPlayer2, attackButton: attackButtonPlayer1)
        attackButtonPlayer1.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "enableAttackButtonPlayer1", userInfo: nil, repeats: false)
    }
    
    func enableAttackButtonPlayer1() {
        attackButtonPlayer1.enabled = true
    }

    @IBAction func attackButtonPlayer2Pressed(sender: AnyObject) {
        attackPressed(player2, fightee: player1, hpLabel: hpPlayer1, attackButton: attackButtonPlayer2)
        attackButtonPlayer2.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "enableAttackButtonPlayer2", userInfo: nil, repeats: false)
    }
    
    func enableAttackButtonPlayer2() {
        attackButtonPlayer2.enabled = true
    }
    
    @IBAction func restartButtonPressed(sender: AnyObject) {
        newGame()
        restartButton.hidden = true
    }
    
    
    func attackPressed(fighter: Player!, fightee: Player!, hpLabel: UILabel!, attackButton: UIButton!) {
        fightee.attemptAttack(fightee.attackPower)
        gameMessage.text = "Attacked \(fightee.name) for -\(fighter.attackPower) HP"
        hpLabel.text = "\(fightee.hp) HP"
        
        if !fightee.isAlive {
            gameMessage.text = "\(fighter.name) Wins!"
            restartButton.hidden = false
            
            if fightee.name == player1.name {
                characterPlayer1.hidden = true
                attackButtonPlayer1.hidden = true
                attackButtonPlayer2.hidden = true
                hpPlayer1.text = "0 HP"
            } else if fightee.name == player2.name {
                characterPlayer2.hidden = true
                attackButtonPlayer1.hidden = true
                attackButtonPlayer2.hidden = true
                hpPlayer2.text = "0 HP"
            }
        }
    }
    
    func newGame() {
        player1 = Player.init(name: "Poopy Eye", hp: 90, attackPower: 23)
        player2 = Player.init(name: "Hawk Man", hp: 94, attackPower: 21)
        
        hpPlayer1.text = "\(player1.hp) HP"
        hpPlayer2.text = "\(player2.hp) HP"
        
        gameMessage.text = "\(player1.name) versus \(player2.name)"
        
        characterPlayer1.hidden = false
        attackButtonPlayer1.hidden = false
        attackButtonPlayer2.hidden = false
        characterPlayer2.hidden = false
        attackButtonPlayer1.hidden = false
        attackButtonPlayer2.hidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}