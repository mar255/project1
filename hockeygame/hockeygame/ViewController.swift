//
//  ViewController.swift
//  hockeygame
//
//  Created by Rodgers, Michael A on 3/4/19.
//  Copyright © 2019 Rodgers, Michael A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter:Int = 15
    var timer = Timer()
    var isTimerRunning:Bool = false
    var hScore:Int = 0
    var aScore:Int = 0
    var playerTurn = 0
    var shotPower:Int = 3
    var randomShooter:Int = 0
    var randomGoalie:Int = 0
    var randomLocation:Int = 0
    var shotChance:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    
    @IBOutlet weak var powerLabel: UILabel!
    
    func allButtons() {
        theTopLeft.setImage(UIImage(named:"bullseye.png"), for: .normal)
        theTopRight.setImage(UIImage(named:"bullseye.png"), for: .normal)
        theBottomLeft.setImage(UIImage(named:"bullseye.png"), for: .normal)
        theBottomRight.setImage(UIImage(named:"bullseye.png"), for: .normal)
        theMiddleButton.setImage(UIImage(named:"bullseye.ong"), for: .normal)
    }
    
    
    @IBOutlet weak var theTopLeft: UIButton!
    @IBAction func myTopLeft(_ sender: UIButton) {
        randomLocation = 0
        allButtons()
        sender.setImage(UIImage(named:"bullseyeAlt.png"), for: .normal)
        randomLocation = Int.random(in: 20 ..< 50)
    }
    
    @IBOutlet weak var theBottomLeft: UIButton!
    @IBAction func myBottomLeft(_ sender: UIButton) {
        randomLocation = 0
        allButtons()
        sender.setImage(UIImage(named:"bullseyeAlt.png"), for: .normal)
        randomLocation = Int.random(in: 10 ..< 35)
    }
    
    @IBOutlet weak var theTopRight: UIButton!
    @IBAction func myTopRight(_ sender: UIButton) {
        randomLocation = 0
        allButtons()
        sender.setImage(UIImage(named:"bullseyeAlt.png"), for: .normal)
        randomLocation = Int.random(in: 20 ..< 50)
    }
    
    @IBOutlet weak var theBottomRight: UIButton!
    @IBAction func myBottomRight(_ sender: UIButton) {
        randomLocation = 0
        allButtons()
        sender.setImage(UIImage(named:"bullseyeAlt.png"), for: .normal)
        randomLocation = Int.random(in: 10 ..< 35)
    }
    
    
    @IBOutlet weak var theMiddleButton: UIButton!
    @IBAction func myMiddleButton(_ sender: UIButton) {
        randomLocation = 0
        allButtons()
        sender.setImage(UIImage(named:"bullseyeAlt.png"), for: .normal)
        randomLocation = Int.random(in: 10 ..< 25)
    }
    
    
    
    @IBAction func selectDeke(_ sender: Any) {
        if (sender as AnyObject).isOn {
            
        } else {
            
        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    
    @objc func updateTimer() {
        counter -= 1
        timerLabel.text = "\(counter)"
        if(counter == 0) {
            timerLabel.text = "Time's Up!"
            timer.invalidate()
            
        }
    }
    
    
    @IBAction func mySlider(_ sender: UISlider) {
        shotPower = Int(sender.value)
        
    }
    
    
    
    
    
    
    
    func hScore(points:Int){
        hScore = hScore + points
        homeScore.text = "Score: \(hScore)"
    }
    
    func aScore(points:Int){
        aScore = aScore + points
        awayScore.text = "Score: \(aScore)"
    }
    
    @IBAction func slapShot(_ sender: Any) {
        counter = 15
        
        if isTimerRunning == false {
            runTimer()
        }
        
        randomShooter = Int.random(in: 10 ..< 30)
        randomGoalie = Int.random(in: 65 ..< 95)
        
        shotChance = randomShooter * shotPower + randomLocation
        
        powerLabel.text = "Shot Chance: \(shotChance)"
        
        if shotChance < 100 {
        if shotChance > randomGoalie {
            
            if playerTurn % 2 == 0 {
                hScore(points:1)
                if hScore == 5 {
                    timerLabel.text = "Home Team Wins!!!"
                    timer.invalidate()
                    
                }
            }
            
            if playerTurn % 2 == 1 {
                aScore(points:1)
                if aScore == 5 {
                    timerLabel.text = "Away Team Wins!!!"
                    timer.invalidate()
            
                }
            }
            
        }
        }
        playerTurn = playerTurn + 1
        if randomLocation == 0 {
            powerLabel.text = "Select Shot Location"
        }
    }
    
   
    @IBAction func wristShot(_ sender: Any) {
        counter = 15
        
        if isTimerRunning == false {
            runTimer()
        }
        
        randomShooter = Int.random(in: 10 ..< 30)
        randomGoalie = Int.random(in: 65 ..< 100)
        
        shotChance = randomShooter * shotPower + randomLocation
    
        powerLabel.text = "Shot Chance: \(shotChance % 4)"
        
        if shotChance < 100 {
            if shotChance % 5 > randomGoalie % 4 {
                
                if playerTurn % 2 == 0 {
                    hScore(points:1)
                    if hScore == 5 {
                        timerLabel.text = "Home Team Wins!!!"
                        timer.invalidate()
                        
                    }
                }
                
                if playerTurn % 2 == 1 {
                    aScore(points:1)
                    if aScore == 5 {
                        timerLabel.text = "Away Team Wins!!!"
                        timer.invalidate()
                        
                    }
                }
                
            }
        }
        playerTurn = playerTurn + 1
        if randomLocation == 0 {
            powerLabel.text = "Select Shot Location"
        }
    }
    
    
    
    @IBAction func myReset(_ sender: Any) {
        counter = 15
        isTimerRunning = false
        hScore = 0
        homeScore.text = "Score: \(hScore)"
        aScore = 0
        awayScore.text = "Score: \(aScore)"
        timerLabel.text = "Time"
        powerLabel.text = "Shot Chance"
        playerTurn = 0
        shotPower = 3
        randomShooter = 0
        randomGoalie = 0
        randomLocation = 0
        shotChance = 0
        allButtons()
      
    }
    
    
    
    
    
    
    
}

