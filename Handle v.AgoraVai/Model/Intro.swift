//
//  Menu.swift
//  Handle v.AgoraVai
//
//  Created by Alexandre César Brandão de Andrade on 31/10/22.
//

import Foundation

class Intro:ObservableObject{

    @Published var displayed:Bool
    @Published var displayedIntro: Bool

    init(){
        self.displayed = false
        let (_, secondMood) = MoodModel.getFirstMoods(fromDate: .now)
        self.displayedIntro = secondMood == nil
    }
}
