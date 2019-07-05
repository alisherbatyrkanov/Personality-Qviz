//
//  ResultsViewController.swift
//  Personality Qviz
//
//  Created by Alisher Batyrkanov on 7/1/19.
//  Copyright © 2019 Alisher Batyrkanov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    
    
    
    var responces: [Answers]!

    override func viewDidLoad() {
        super.viewDidLoad()
navigationItem.hidesBackButton = true
        UpdateUI()
    }
   
    func UpdateUI() {
        let animalTypes = responces.map { $0.type}
        var animalCount = [AnimalType: Int]()
        animalTypes.forEach { animalTypes in
            animalCount[animalTypes] = (animalCount[animalTypes] ?? 0) + 1
        }
        let sortedCount = animalCount.sorted { $0.value > $1.value }
        let animal = sortedCount.first!.key
        
         answerLabel.text = "Вы - \(animal.rawValue)!"
         definitionLabel.text = animal.definition
    }
}
