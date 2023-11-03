//
//  ViewController.swift
//  Magic 8 ball
//
//  Created by User on 29.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballView: UIImageView!
    
    let ballsImageArray = [#imageLiteral(resourceName: "ball5"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball5"), #imageLiteral(resourceName: "ball3"),]

    @IBAction func askPressedButton(_ sender: UIButton) {
        
        ballView.image = ballsImageArray.randomElement()
    }
    
}

