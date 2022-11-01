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
        self.displayedIntro = true
    }
}
