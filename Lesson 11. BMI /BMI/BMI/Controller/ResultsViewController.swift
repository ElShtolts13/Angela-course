//
//  ResultsViewController.swift
//  BMI
//
//  Created by User on 10.11.2023.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var bmiValue:String?
    var advice: String?
    var color: UIColor?
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
        
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
     dismiss(animated: true, completion: nil)
    }
}

