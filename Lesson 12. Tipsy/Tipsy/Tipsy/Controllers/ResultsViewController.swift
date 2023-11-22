//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by User on 20.11.2023.
//

import UIKit

class ResultsViewController: UIViewController {

    var calculateResult: String?
    var settingText: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = calculateResult
        settingLabel.text = settingText
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)

    }
}
