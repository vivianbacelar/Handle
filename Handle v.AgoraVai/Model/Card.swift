//
//  Cards.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 20/10/22.
//

import Foundation
import SwiftUI


struct Card {
    static let all = [
        Card(title: "Grasp", minutes: "5 min", synopsis: "Make fists to fight your stress!", complement: "(kidding, but you do de-stress by closing\n your hands)", color: Color("Verde"), image: "Grasp", instructions: "Welcome! This hand exercise focus on your de-stress through guided steps. You'll be asked to tighten up and loosen up your hands using the Grasp Hand Position, as seen in the picture above.", imageTutorial: "Grasp", activity: "lock.fill"),
        Card(title: "Embrace", minutes: "5 min", synopsis: "Hug your stress, he's lonely :(" , complement: "(I mean not really, but it will calm you down)" , color: Color("Marinho"), image: "Embrace", instructions: "Welcome! This hand exercise focus on your de-stress through guided steps. You'll be asked to tighen up and loosen up your hands using the Embrace Hand Position, as seen in the picture above.", imageTutorial: "Embrace", activity: "lock.fill"),
        Card(title: "Expand", minutes: "8 min", synopsis: "Let's strech your stress, shall we?", complement: "(not a strech: you can de-stress by doing so)", color: Color("Turquesa"), image: "Expand", instructions: "Welcome! This hand exercise focus on your de-stress through guided steps. You'll be asked to tighen up and loosen up your hands using the Expand Hand Position, as seen in the picture above.", imageTutorial: "ExpandSynopsis", activity: "greaterthan.circle")
    ]
    
    static let placeholder = Card(title: "Placeholder", minutes: "0", synopsis: "Frase sinopse da atividade", complement:"Brincadeira com o usuário", color: Color(hex: 0x245150), image:"Ilustração", instructions:"Expand", imageTutorial: "Ilustração", activity: "A atividade está bloqueada ou não")
    
    let title:String
    let minutes: String
    let synopsis: String
    let complement: String
    let color: Color
    let image: String
    let instructions: String
    let imageTutorial: String
    let activity: String

}
