//
//  Question.swift
//  Personality Quiz!
//
//  Created by Alisher Batyrkanov on 7/3/19.
//  Copyright © 2019 Alisher Batyrkanov. All rights reserved.
//

struct Question {
    var text: String // текст вопроса
    var type: ResponceType // string -> responce changed
    var answers: [Answers] // srting -> changed to Answers
    
    static var all: [Question] {
        return [
            Question(text: "Какую еду вы предпочитаете ?", type: .single, answers: [
                Answers(text: "Стейк", type: .dog),
                Answers(text: "Рыба", type: .cat),
                Answers(text: "Бамбук", type: .panda),
                Answers(text: "Капуста", type: .turtle),
                ]),
            Question(text: "Что вам нравится делать ?", type: .multiple, answers: [
                Answers(text: "Плавать", type: .turtle),
                Answers(text: "Спать", type: .cat),
                Answers(text: "Лазить", type: .panda),
                Answers(text: "Есть", type: .dog),
                ]),
            Question(text: "Любите ли вы ездить на машине ?", type: .ranged, answers: [
                Answers(text: "Ненавижу", type: .cat),
                Answers(text: "Немного нервничаю", type: .panda),
                Answers(text: "Почти не замечаю", type: .turtle),
                Answers(text: "Обожаю", type: .dog),
            ]),
        ]
    }
    
}
