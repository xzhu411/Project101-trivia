//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Xiaoai on 3/12/24.
//

import UIKit

class TriviaViewController: UIViewController {
    
    @IBOutlet weak var numofQuestion: UITextField!
    
    @IBOutlet weak var questionText: UITextView!
    
    @IBOutlet weak var ButtonA: UIButton!
    
    @IBOutlet weak var ButtonB: UIButton!
    
    @IBOutlet weak var ButtonC: UIButton!
    
    @IBOutlet weak var ButtonD: UIButton!
    
    var qidx = 0
    private var correct_count=0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //var qidx = 0
        displayQuestion()

        ButtonA.addTarget(self, action: #selector(answerTapped(_:)), for: .touchUpInside)
        ButtonB.addTarget(self, action: #selector(answerTapped(_:)), for: .touchUpInside)
        ButtonC.addTarget(self, action: #selector(answerTapped(_:)), for: .touchUpInside)
        ButtonD.addTarget(self, action: #selector(answerTapped(_:)), for: .touchUpInside)


    }
    
    @IBAction func answerTapped(_ sender: UIButton) {
        let currentQuestion = questions[qidx]
        let selectedAnswerIndex = sender.tag
        if selectedAnswerIndex==currentQuestion.answeridx{
            correct_count += 1
        }

        qidx += 1
        if qidx < questions.count {
            displayQuestion()
        }
        else{
            let alert = UIAlertController(title: "Game over!",
                                          message: "Final score: \(correct_count)/3",
                                          preferredStyle: .alert)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func displayQuestion() {
        let currentQuestion = questions[qidx]
        
        questionText.text = currentQuestion.text
//        questionText.isEditable = false
        questionText.isScrollEnabled = true
        
        numofQuestion.text = "Question \(qidx + 1)/3"
        
        let answerButtons = [ButtonA, ButtonB, ButtonC, ButtonD]
        for (index, button) in answerButtons.enumerated() {
            button?.setTitle(currentQuestion.answers[index], for: .normal)
        }
    }
    
    struct Question {
           let text: String
           let answers: [String]
           let answeridx: Int
       }
    
    let questions: [Question] = [
            Question(text: "What is the Chinese for the word 'flower'?", answers: ["书", "狗", "花", "电脑"], answeridx: 2),
            Question(text: "Which kpop group is going to have a tour \n on March 24 in Atlanta?", answers: ["IVE", "TWICE", "SEVENTEEN", "NMIXX"], answeridx: 0),
            Question(text: "1+1=?", answers: ["2", "-2", "0", "100"], answeridx: 0)
        ]

}
