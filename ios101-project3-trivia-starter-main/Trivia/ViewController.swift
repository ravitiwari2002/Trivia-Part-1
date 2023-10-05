//
//  ViewController.swift
//  Trivia
//
//  Created by rtiwari6 on 10/5/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadQuestion()
        progress.font = UIFont.boldSystemFont(ofSize: progress.font.pointSize)
    }
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var progress: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    
    @IBAction func answerButtonTapped(_ sender: UIButton){
        
        if sender.tag == questions[currentQuestionIndex].correctAnswer{
            score += 1
        }
        currentQuestionIndex += 1
        if currentQuestionIndex < questions.count{
            loadQuestion()
        }
        else{
            endQuiz()
        }
        
    }
    
    var questions: [(question: String, answers: [String], correctAnswer: Int)] = [
            ("What is the capital of Australia?", ["Sydney", "Melbourne", "Canberra", "Perth"], 2),
            ("Which planet is known as Red Planet?", ["Venus", "Mercury", "Mars", "Jupiter"], 2),
            ("What is he chemical symbol for Hydrogen?", ["Hg", "He", "H", "Hy"], 2),
            ("Who painted Mona Lisa?", ["Vincent Van Gogh", "Pablo Picasso", "Leonardo da Vinci", "Michelangelo"], 2)
        ]
    
    var currentQuestionIndex = 0
    var score = 0
    
    func loadQuestion(){
        let questionData = questions[currentQuestionIndex]
        question.text = questionData.question
        for(index, button) in answerButtons.enumerated(){
            button.setTitle(questionData.answers[index], for: .normal)
            button.tag = index
        }
        progress.text = "Question \(currentQuestionIndex+1) of \(questions.count)"
    }
    
    func restartQuiz(){
        currentQuestionIndex = 0
        score = 0
        loadQuestion()
    }
    
    func endQuiz(){
        let alert = UIAlertController(title: "Quiz Finished", message: "You got \(score) out of \(questions.count) correct!", preferredStyle:  .alert)
        
        let restartAction = UIAlertAction(title: "Restart", style: .default){
            _ in self.restartQuiz()
        }
        
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
        
    }

}
