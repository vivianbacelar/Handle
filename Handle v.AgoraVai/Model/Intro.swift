//
//  Menu.swift
//  Handle v.AgoraVai
//
//  Created by Alexandre César Brandão de Andrade on 31/10/22.
//

import Foundation

class Intro:ObservableObject{

    @Published var displayed:Bool

    init(){
        self.displayed = true
    }
}
