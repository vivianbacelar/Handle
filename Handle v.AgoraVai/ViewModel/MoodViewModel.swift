//
//  MoodViewModel.swift
//  Handle v.AgoraVai
//
//  Created by Alexandre César Brandão de Andrade on 08/11/22.
//

import Foundation

class MoodViewModel: ObservableObject {
    @Published var currentMood: Mood?
    @Published var allMoods: [Mood] = Mood.allMoods

    func checkMoodStatus() {
        for (index, mood) in allMoods.enumerated() {
            allMoods[index].isSelected = mood != currentMood
        }
    }
}
