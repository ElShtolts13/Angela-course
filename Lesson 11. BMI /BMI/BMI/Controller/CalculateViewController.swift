//
//  ViewController.swift
//  BMI
//
//  Created by User on 09.11.2023.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var hightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    
    @IBOutlet weak var hightSliderValue: UISlider!
    
    @IBOutlet weak var weightSliderValue: UISlider!
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hightSliderAction(_ sender: UISlider) {
       
     let hight = String(format: "%.2f", sender.value)
        hightValueLabel.text = "\(hight)m"
    }
    
    @IBAction func weightSliderAction(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightValueLabel.text = "\(weight)kg"
    }
    
    @IBAction func catculateButtonPressed(_ sender: UIButton) {
        let hight = hightSliderValue.value
        let weight = weightSliderValue.value
        let bmi = weight / pow(hight, 2)
        bmiValue = String(format: "%.1f", bmi)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = bmiValue
        }
    }
}

