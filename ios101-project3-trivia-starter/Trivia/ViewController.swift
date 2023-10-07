//
//  ViewController.swift
//  Trivia
//
//  Created by Abenezer Getachew on 10/6/23.
//
import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var questionTitleLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var actualQuestionLabel: UILabel!
    
    
    @IBOutlet weak var answerButton1: UIButton!
    
    @IBOutlet weak var answerButton2: UIButton!
    
    @IBOutlet weak var answerButton3: UIButton!
    
    @IBOutlet weak var answerButton4: UIButton!
    
    
    // Trivia model
    struct TriviaQuestion {
        let category: String
        let question: String
        let answers: [String]
        let correctAnswerIndex: Int
    }
    
    var questions: [TriviaQuestion] = [
            TriviaQuestion(category: "Entertainment: View games", question: "What was the first weapon pack for 'PAYDAY'?", answers: ["The Gage Weapon Pack #1","The Overkill Pack","The Gage Chivalry Pack","The Gage Historical Pack"], correctAnswerIndex: 0),
            TriviaQuestion(category: "History", question: "Which of these founding fathers of the United States of America later became president?", answers: ["Roger Sherman", "James Monroe", "Samuel Adams", "Alexander Hamilton"], correctAnswerIndex: 1),
            TriviaQuestion(category: "Entertainment: Music", question: "What is the last song on the first Panic! At the Disco album?", answers: ["I Write Sins Not Tragedies", "Lying is The Most Fun A Girl Can Have Without Taking Her Clothes Off", "Nails for Breakfast, Tacks for Snacks", "Build God, Then We’ll Talk"], correctAnswerIndex: 3)
        ]
    var currentQuestionIndex = 0
    var correctAnswersCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.125, green: 0.698, blue: 0.667, alpha: 1.0) // Light sea blue for background
        let oceanBlue = UIColor(red: 0.0, green: 0.498, blue: 1.0, alpha: 1.0)
        actualQuestionLabel.backgroundColor = .white
        answerButton1.backgroundColor = oceanBlue
        answerButton2.backgroundColor = oceanBlue
        answerButton3.backgroundColor = oceanBlue
        answerButton4.backgroundColor = oceanBlue
        answerButton1.setTitleColor(.white, for: .normal)
        answerButton2.setTitleColor(.white, for: .normal)
        answerButton3.setTitleColor(.white, for: .normal)
        answerButton4.setTitleColor(.white, for: .normal)

        loadQuestion()
    }
    func loadQuestion() {
            let question = questions[currentQuestionIndex]
            categoryLabel.text = question.category
            actualQuestionLabel.text = question.question
            answerButton1.setTitle(question.answers[0], for: .normal)
            answerButton2.setTitle(question.answers[1], for: .normal)
            answerButton3.setTitle(question.answers[2], for: .normal)
            answerButton4.setTitle(question.answers[3], for: .normal)
        }
    
    //IBActions (Methods)
    
    @IBAction func didSelectAnswer1(_ sender: UIButton) {
        checkAnswer(selectedIndex: 0)
    }
    
    @IBAction func didSelectAnswer2(_ sender: UIButton) {
        checkAnswer(selectedIndex: 1)
    }
    
    @IBAction func didSelectAnswer3(_ sender: UIButton) {
        checkAnswer(selectedIndex: 2)
    }
    
    @IBAction func didSelectAnswer4(_ sender: UIButton) {
        checkAnswer(selectedIndex: 3)
    }
    
    
    func checkAnswer(selectedIndex: Int) {
            let correctAnswer = questions[currentQuestionIndex].correctAnswerIndex
            if selectedIndex == correctAnswer {
                correctAnswersCount += 1
            }

            if currentQuestionIndex < questions.count - 1 {
                currentQuestionIndex += 1
                loadQuestion()
            } else {
                gameOver()
            }
        }

    func gameOver() {
            let alertController = UIAlertController(title: "Game Over!", message: "Final score: \(correctAnswersCount)/\(questions.count)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
                self.restartGame()
            }))
            present(alertController, animated: true)
        }

    func restartGame() {
            currentQuestionIndex = 0
            correctAnswersCount = 0
            loadQuestion()
        }
    }


