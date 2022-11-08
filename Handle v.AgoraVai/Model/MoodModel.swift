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

    static func getFirstMoods(fromDate date: Date) -> (first: Mood?, second: Mood?) {
        Self.loadHistory()
        let moodsOfToday = history.filter { mood in
            Calendar.current.isDate(mood.timeStamp, inSameDayAs: date)
        }
        if moodsOfToday.count >= 2 {
            return (Mood.getMood(fromValue: moodsOfToday[0].valor), Mood.getMood(fromValue: moodsOfToday[1].valor))
        } else if moodsOfToday.count == 1 {
            return (Mood.getMood(fromValue: moodsOfToday[0].valor), nil)
        }
        return (nil, nil)
    }

    static func saveHistory() {
        try? history.save()
    }

    static func loadHistory() {
        try? history.load()
    }

}
