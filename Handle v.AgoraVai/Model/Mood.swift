//
//  Mood.swift
//  Handle v.AgoraVai
//
//  Created by Alexandre César Brandão de Andrade on 08/11/22.
//

import Foundation
import UIKit

struct Mood: Identifiable, Equatable {
    var id: Int { value }
    var color: UIColor
    var emoji: String
    var isSelected: Bool
    var value: Int
    var chosenEmoji: String?

    static var allMoods: [Mood] = [Mood(color: #colorLiteral(red: 0.5599847436, green: 0.8115807176, blue: 0.866892755, alpha: 1), emoji: "😁", isSelected: false, value: 1),
                                   Mood(color: #colorLiteral(red: 0.731630981, green: 0.8238679767, blue: 0.539796114, alpha: 1), emoji: "😌", isSelected: false, value: 2),
                                   Mood(color: #colorLiteral(red: 0.9286388159, green: 0.8184836507, blue: 0.5909100771, alpha: 1), emoji: "😐", isSelected: false, value: 3),
                                   Mood(color: #colorLiteral(red: 0.931117475, green: 0.6745183468, blue: 0.592323482, alpha: 1), emoji: "😤", isSelected: false, value: 4),
                                   Mood(color: #colorLiteral(red: 0.9282506108, green: 0.5942555666, blue: 0.5907897353, alpha: 1), emoji: "😡", isSelected: false, value: 5)
    ]


    static func getMood(fromValue value: Int) -> Mood? {
        Self.allMoods.first { mood in
            mood.value == value
        }
    }


}
