//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Mahammad Afandiyev on 17.11.22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var resultBackgroundColor: UIImageView!
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    
    var bmiValue : String?
    var adviceLabelText : String?
    var color : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = adviceLabelText
        resultBackgroundColor.backgroundColor = color
        
        
    }
    
    
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
       
        

    }
 
            
        }

