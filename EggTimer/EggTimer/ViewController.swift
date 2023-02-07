//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()
    
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()}
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft":10,"Medium":20,"Hard":30]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        progressBar.progress = 0.0
        
        secondsPassed = 0
        
        let hardness = sender.currentTitle!
        
        titleLabel.text = hardness
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            
            [self] (Timer) in
            
            if self.secondsPassed < totalTime {
                
                self.secondsPassed += 1
                
                let percentageProgress = Float(secondsPassed)/Float(totalTime)
                
                progressBar.progress = percentageProgress
                
                print ("\(self.secondsPassed) seconds")}
                
            else {
                Timer.invalidate()
                self.titleLabel.text = "DONE"
                playSound()
            }
        }
    }
}


