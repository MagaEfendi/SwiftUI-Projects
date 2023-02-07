//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightSlider: UILabel!
    @IBOutlet weak var weightSlider: UILabel!
    
    @IBOutlet weak var heightLabel: UISlider!
    @IBOutlet weak var weightLabel: UISlider!
    var calculatorBrain = CalculatorBrain()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func heightValueChanged(_ sender: UISlider) {
        let height = String(format:"%.2f", sender.value)
        heightSlider.text = "\(height)m"
    }
    
    @IBAction func weightValueChanged(_ sender: UISlider) {
        let weight = String(format : "%.0f", sender.value)
        weightSlider.text = "\(weight)kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightLabel.value
        let weight = weightLabel.value
        
        calculatorBrain.calculateBMI(weight: weight, height: height)
        

        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
            
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMiValue()
            destinationVC.adviceLabelText = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}






