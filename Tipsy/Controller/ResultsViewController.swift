//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Thiago Antonio Ramalho on 21/08/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var data: Data? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let data = self.data {
            let finalValue = CalculatorManager().calculate(data: data)
            
            totalLabel.text = "\(finalValue)"
            settingsLabel.text = "Split between \(String(format: "%.0f", data.numberOfPeople)) peoples, with \(String(format: "%.0f", data.percentage))% tip(s)"
        }
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
