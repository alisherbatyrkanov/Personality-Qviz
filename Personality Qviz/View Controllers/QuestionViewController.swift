//
//  QuestionViewController.swift
//  Personality Qviz
//
//  Created by Alisher Batyrkanov on 7/1/19.
//  Copyright © 2019 Alisher Batyrkanov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet var questionLabel: UILabel!

    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multiLabel: [UILabel]!
    
    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!
    
    
    @IBOutlet var progressView: UIProgressView!
    
    //MARK: properties
    var answersChoosen = [Answers]()
    var questionIndex = 0
    var questions: [Question]!
    var currentQuestion: Question {
        return questions[questionIndex]
    }

    var currentAnswers: [Answers] {
        return currentQuestion.answers
    }
    
    //MARK: UIViewController Mothods
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = Question.all
        UpdateUI()
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ResultsSegue" else { return }
        let destination = segue.destination as! ResultsViewController
        destination.responces = answersChoosen
    }
    
    
    //MARK: Custom Methods
    func UpdateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        
       
        let currentAnswers = currentQuestion.answers
        let progress = Float(questionIndex) / Float(questions.count)
        
         navigationItem.title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        questionLabel.text = currentQuestion.text
        progressView.setProgress(progress, animated: true)
        
        
        switch currentQuestion.type {
            
        case .single:
            updateSingleStack(with: currentAnswers)
            
        case .multiple:
           updateMultipleStack(with:currentAnswers)
            
        case .ranged:
            updateRangeStack(with: currentAnswers)
        }
        
    }
    
    func updateSingleStack(with answers: [Answers]) {
        singleStackView.isHidden = false
        for (button, answer) in zip(singleButtons, answers) {
           button.setTitle(answer.text, for: [])
        }
    }
    
    func updateMultipleStack(with answers: [Answers]) {
         multipleStackView.isHidden = false
        for (label, answer) in zip(multiLabel, answers) {
            label.text = answer.text
        }
        
    }
    
    func updateRangeStack(with answers: [Answers]) {
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
        rangeStackView.isHidden = false
    }
    
    func nextQuestion() {
       
        questionIndex += 1
        if questionIndex < questions.count {
            UpdateUI()
        } else {
             performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
        
    }
    
    
    //MARK: -Actions
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        guard let answerIndex = singleButtons.firstIndex(of: sender) else {return}
        let answer = currentAnswers[answerIndex]
        answersChoosen.append(answer)
        nextQuestion()
    }
    
    @IBAction func multipleButtonPressed(_ sender: UIButton) {
        for(index, view) in multipleStackView.arrangedSubviews.enumerated() {
            guard let stackView = view as? UIStackView else {continue}
            guard let switchView = stackView.arrangedSubviews.last as? UISwitch else {continue}
            if switchView.isOn {
                let answer = currentAnswers[index]
                answersChoosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedButtonPressed(_ sender: UIButton) {
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        let answers = currentAnswers[index]
        answersChoosen.append(answers)
        
        nextQuestion()
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let numberOfSteps = Float(currentAnswers.count - 1)
        let step = 1 / numberOfSteps
        let index = round(rangedSlider.value * numberOfSteps)
        sender.value = step * index
        
        print(#line, #function, "step =", step, ", index =", index)
    }
}
