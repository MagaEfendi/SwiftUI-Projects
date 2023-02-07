//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Mahammad Afandiyev on 07.12.22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var intermediateCalculation : (n1: Double, calcMethod: String)?
    
    mutating func calculate(calcMethod : String, displayValue : Double) -> Double {
        if calcMethod == "+/-" {
            return displayValue * -1
        }
        else if calcMethod == "AC" {
            return 0
        }
        else if calcMethod == "%" {
            return displayValue * 0.01
        }
        else if calcMethod == "=" {
            return performTwoNumCalculation(n2 : displayValue)
        }
        else {
            intermediateCalculation = (n1 : displayValue, calcMethod : calcMethod)
        }
        return 0
    }
    private func performTwoNumCalculation(n2 : Double) -> Double {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
           
            switch operation {
            case "+" : return n1 + n2
            case "-": return n1 - n2
            case "×" : return n1 * n2
            case "÷" : return n1 / n2
            default : fatalError()
                
            }
            }
        return 0
        }    }

