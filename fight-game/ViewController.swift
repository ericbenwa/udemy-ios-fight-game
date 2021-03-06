//
//  ViewController.swift
//  fight-game
//
//  Created by Eric Benoit on 1/19/16.
//  Copyright © 2016 Eric Benoit. All rights reserved.
//

import UIKit
import AVFoundation

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
    var bgSound: AVAudioPlayer!
    var attackSound: AVAudioPlayer!
    var gameOverSound: AVAudioPlayer!

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
        playAttackSound()
        
        if !fightee.isAlive {
            gameMessage.text = "\(fighter.name) Wins!"
            restartButton.hidden = false
            playGameOverSound()
            
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
    
    func playAttackSound() {
        if attackSound.playing {
            attackSound.stop()
        }
        
        attackSound.play()
    }
    
    func playGameOverSound() {
        if gameOverSound.playing {
            gameOverSound.stop()
        }
        
        gameOverSound.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newGame()
        
        // Background Sound
        let bgSoundPath = NSBundle.mainBundle().pathForResource("51239__rutgermuller__8-bit-electrohouse", ofType: "wav")
        let bgSoundUrl = NSURL(fileURLWithPath: bgSoundPath!)
        
        do {
            try bgSound = AVAudioPlayer(contentsOfURL: bgSoundUrl)
            bgSound.prepareToPlay()
            bgSound.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        // Attack Sound
        let attackSoundPath = NSBundle.mainBundle().pathForResource("77611__joelaudio__sfx-attack-sword-001", ofType: "wav")
        let attackSoundUrl = NSURL(fileURLWithPath: attackSoundPath!)
        
        // Game Over Sound
        let gameOverSoundPath = NSBundle.mainBundle().pathForResource("126113__klankbeeld__laugh", ofType: "wav")
        let gameOverSoundUrl = NSURL(fileURLWithPath: gameOverSoundPath!)
        
        do {
            try attackSound = AVAudioPlayer(contentsOfURL: attackSoundUrl)
            attackSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        do {
            try gameOverSound = AVAudioPlayer(contentsOfURL: gameOverSoundUrl)
            gameOverSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}