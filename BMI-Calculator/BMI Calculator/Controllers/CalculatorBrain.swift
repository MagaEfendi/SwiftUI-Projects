//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Mahammad Afandiyev on 18.11.22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi : BMI?
    
    func getBMiValue() -> String {
        let bmiToDecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToDecimalPlace
    }
    
    
    mutating func calculateBMI(weight : Float , height : Float) {
        let bmiValue = weight / pow(height,2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.lightGray)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a Fiddle!", color: UIColor.green)
        }
        else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor.red)
        } }
        
        
        
    func getAdvice() -> String{
        return bmi?.advice ?? "No Advice"
    }
    
    
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.red
        }
        
        
    }
    
    
    

