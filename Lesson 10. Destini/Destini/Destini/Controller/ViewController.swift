//
//  ViewController.swift
//  Destini
//
//  Created by User on 07.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choise1Button: UIButton!
    @IBOutlet weak var choise2Button: UIButton!
    var storyBrain = StoryBrain()
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }

    @IBAction func choiseMade(_ sender: UIButton) {
        
        if sender.currentTitle == storyBrain.chooseChoise1() {
            storyBrain.storyNumber += 1
            updateUI()
        } else if sender.currentTitle == storyBrain.chooseChoise2(){
            storyBrain.storyNumber += 2
            updateUI()
        } else {
            storyBrain.storyNumber = 0
            updateUI()
        }
    }

    func updateUI() {
        storyLabel.text = storyBrain.chooseStory()
        choise1Button.setTitle(storyBrain.chooseChoise1(), for: .normal)
        choise2Button.setTitle(storyBrain.chooseChoise2(), for: .normal)
        
    }
    }


