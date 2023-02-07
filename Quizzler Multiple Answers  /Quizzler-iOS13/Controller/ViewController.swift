//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var quizBrain = QuizBrain()
    var timer = Timer()
    var correctAnswers = 0
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressBar.progress = 0
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.answerCheker(userAnswer)
        
        if userGotItRight == true{
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        questionNumber += 1
        if questionNumber == quizBrain.quiz.count{
            questionNumber = 0
            
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        newButton.backgroundColor = UIColor.clear
        trueButton.setTitle(quizBrain.quiz[questionNumber].answer[0], for: .normal)
        falseButton.setTitle(quizBrain.quiz[questionNumber].answer[1], for: .normal)
        newButton.setTitle(quizBrain.quiz[questionNumber].answer[2], for: .normal)
    }
        }
    


