//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
 
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var peopleCount = 2
    var pSctValue = 0.1
    var finalBillTotal = "0.0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billTextField.isUserInteractionEnabled = true
        billTextField.becomeFirstResponder()
        billTextField.keyboardType = .numberPad
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPcButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
    }
    
    @IBAction func stepperValueChange(_ sender: UIStepper) {
        
        peopleCount = Int(sender.value)
        splitNumberLabel.text = String(peopleCount)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if zeroPcButton.isSelected {
            pSctValue = 0.0
        } else if  tenPctButton.isSelected {
            pSctValue = 0.1
        } else if  twentyPctButton.isSelected {
            pSctValue = 0.2
        }
        
        if let billText = billTextField.text, let billAmount = Double(billText) {
            let billTotal = (billAmount + (billAmount * pSctValue))/Double(peopleCount)
            finalBillTotal = String(format: "%.2f", billTotal)
            print(finalBillTotal)
        } else {
            billTextField.text = "Error"
        }
        performSegue(withIdentifier: "calculate", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculate" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.calculateResult = finalBillTotal
            destinationVC.settingText = "Split between \(peopleCount), with \(Int(pSctValue * 100.0)) tip"
        }
        
    }
}


