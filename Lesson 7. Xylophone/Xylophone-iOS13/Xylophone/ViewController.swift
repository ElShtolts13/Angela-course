//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        //нажатая кнопка станет наполовину прозрачной
        
        sender.alpha = 0.5
    
        // код выполнится через 2 секунды
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        // кнопочка вернет свою первоначальную прозрачность
            sender.alpha = 1.0
        }
        
        playSound(soundName: sender.currentTitle!)
        
      
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
       
    }
    

}

