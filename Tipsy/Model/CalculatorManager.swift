//
//  CalculatorManager.swift
//  Tipsy
//
//  Created by Thiago Antonio Ramalho on 23/08/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

class CalculatorManager {
    
    func calculate(data: Data) -> Double {
     
        let finalValue = ((data.value / 100 ) * data.percentage) + data.value
        
        return finalValue / data.numberOfPeople
    }
}
