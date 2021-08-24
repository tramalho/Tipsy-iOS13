//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextfield: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextfield.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if sender.currentTitle == "0%"{
            zeroPctButton.isSelected = true
        } else if sender.currentTitle == "10%" {
            tenPctButton.isSelected = true
        } else {
            twentyPctButton.isSelected = true
        }
    }
    
    
    @IBAction func steeperValuedChanged(_ sender: UIStepper) {
        print(sender.value)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
                 
        if (billTextfield.text != nil && !(billTextfield!.text)!.isEmpty) {
            performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult", let vc = segue.destination as? ResultsViewController {

            var tip:Double = 0
            
            if(tenPctButton.isSelected) {
                tip = 10
            } else if(twentyPctButton.isSelected) {
                tip = 20
            }
                        
            vc.data = Data(percentage: tip, numberOfPeople: Double(splitNumberLabel!.text!)!, value: Double(billTextfield!.text!)!)
        }
    }
}


