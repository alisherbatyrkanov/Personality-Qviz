//
//  AnimalType.swift
//  Personality Quiz!
//
//  Created by Alisher Batyrkanov on 7/3/19.
//  Copyright © 2019 Alisher Batyrkanov. All rights reserved.
//

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case panda = "🐼"
    case turtle = "🐢"
}

// MARK: - definition
extension AnimalType {
    var definition: String {
        
        switch self {
            
        case .dog:
             return "Вы любите развлекаться вне дома вместе с людьми, которые вам дороги."
            
        case .cat:
             return "Вы гуляете сами по себе, вам не нужна компания, вы цените свободу."
        case .panda:
            return "Вы любите природу и быть в гармонии с окружающей средой. Доброта и забота для вас стоят на первом месте. Вы предпочитаете проводить время в узком кругу."
            
        case .turtle:
             return "Мудрость важнее скорости, медленный и вдумчивый всегда выигрывает."
            
        }
       
    }
}
