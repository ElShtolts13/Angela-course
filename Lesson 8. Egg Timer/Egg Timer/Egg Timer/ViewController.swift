//
//  ViewController.swift
//  Egg Timer
//
//  Created by User on 03.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]

    @IBAction func hardnessSelected(_ sender: UIButton) {
       
        let harndess = sender.currentTitle!
        var secondsRemaining = eggTimes[harndess]!
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsRemaining > 0 {
                print ("\(secondsRemaining) seconds")
                secondsRemaining -= 1
            } else {
                Timer.invalidate()
            }
        }
        }
    }
