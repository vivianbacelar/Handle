//
//  MoodModel.swift
//  Handle v.AgoraVai
//
//  Created by Alexandre César Brandão de Andrade on 01/11/22.
//

import Foundation
import CodableExtensions

struct MoodModel:Codable {
    static var history:[MoodModel] = []
    var timeStamp:Date = Date()
    var valor:Int


    static func saveHistory() {
        try? history.save()

    }

    static func loadHistory() {
        try? history.load()
    }

}
