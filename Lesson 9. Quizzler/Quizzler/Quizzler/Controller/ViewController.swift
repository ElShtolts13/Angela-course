//
//  ViewController.swift
//  Quizzler
//
//  Created by User on 06.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            setUpButton()
        } else {
            sender.backgroundColor = UIColor.red
            setUpButton()
        }
        quizBrain.nextQuestion()
      
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

        func setUpButton() {
            sender.alpha = 0.5
            sender.layer.cornerRadius = 15
        }
    }
    
    @objc func updateUI() {
        
       
        questionLabel.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAnswers()
        choiceOneButton.setTitle(answerChoices[0], for: .normal)
        choiceTwoButton.setTitle(answerChoices[1], for: .normal)
        choiceThreeButton.setTitle(answerChoices[2], for: .normal)
        
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
        
        choiceOneButton.backgroundColor = UIColor.clear
        choiceOneButton.alpha = 1
        choiceTwoButton.backgroundColor = UIColor.clear
        choiceTwoButton.alpha = 1
        choiceThreeButton.backgroundColor = UIColor.clear
        choiceThreeButton.alpha = 1
    }

    
    
}
