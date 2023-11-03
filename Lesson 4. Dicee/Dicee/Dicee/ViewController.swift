//
//  ViewController.swift
//  Dicee
//
//  Created by User on 28.10.2023.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var rightDiceView: UIImageView!
    
    @IBOutlet weak var leftDiveView: UIImageView!
    
    let diceAray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        rightDiceView.image = diceAray.randomElement()
        leftDiveView.image = diceAray.randomElement()
    }
}

