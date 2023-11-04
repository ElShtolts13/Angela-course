//
//  ViewController.swift
//  Egg Timer
//
//  Created by User on 03.11.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    
    var totalTime = 0
    var secondsPass = 0
    
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let harndess = sender.currentTitle!
        totalTime = eggTimes[harndess]!
        progressBar.progress = 0.0
        secondsPass = 0
        tittleLabel.text = harndess
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPass <= self.totalTime {
                
                self.progressBar.progress = Float(self.secondsPass)/Float(self.totalTime)
                
                self.secondsPass += 1
            } else {
                Timer.invalidate()
                self.tittleLabel.text = "Done!"
                self.playSound()
            }
        }
    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

