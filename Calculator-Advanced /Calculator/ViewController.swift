//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var CalculatorLogic1 = CalculatorLogic()
    
    private var isFinishedTyping : Bool = true
    
    private var displayValue : Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError()
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
  
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTyping = true
        
        let a = CalculatorLogic1.calculate(calcMethod: sender.currentTitle!,displayValue: displayValue)
        displayLabel.text = String(a)
        }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTyping {
                displayLabel.text = numValue
                isFinishedTyping = false
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
        
    }
    
}

