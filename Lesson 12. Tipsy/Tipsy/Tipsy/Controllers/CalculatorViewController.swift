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
    var billTotal = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.isUserInteractionEnabled = true
        billTextField.becomeFirstResponder()
        billTextField.keyboardType = .numberPad
    }
   
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
    
        
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
        print(peopleCount)
       // billTotal = Double(billTextField.text ?? 0.0)
        
        
        print(billTotal)
//        if let userValue1 = userValue {
//            cost = Double(userValue1) * pSctValue / Double(peopleCount))
        }
        
    }
    


