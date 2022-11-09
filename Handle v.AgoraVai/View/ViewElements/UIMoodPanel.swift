//
//  UIMoodPanel.swift
//  Handle v.AgoraVai
//
//  Created by Alexandre César Brandão de Andrade on 01/11/22.
//

import SwiftUI

struct UIMoodPanel:View {
    @EnvironmentObject var moodVM: MoodViewModel
    @State var lastSelected = 0

    var body: some View {
        HStack {
            ForEach(moodVM.allMoods) { mood in
                MoodView(mood: mood)
            }
        }
    }

    static func onSelect(_ selected:Int) {
        let newMood = MoodModel(valor: selected)
        MoodModel.history.append(newMood)
    }

}


struct MoodView: View {
    @EnvironmentObject var moodVM: MoodViewModel
    @EnvironmentObject var showIntro:Intro
    var mood: Mood
    var body: some View {
        escolhaInicial
    }


    var escolhaInicial: some View {
        VStack{
            Button(action: {
                moodVM.currentMood = mood
                moodVM.checkMoodStatus()
            }) {
                Text("\(mood.emoji)")
                    .scaledFont(name: "Montserrat-SemiBold", size: 28)
                    .clipShape(Circle())
            }
            .buttonStyle(CircleEmoji(color: Color(mood.color)))
            .shadow(radius:4)
            ZStack {
                Text("\(mood.value)")
                    .opacity(moodVM.currentMood?.value == mood.value ? 0 : 1)
                Image(systemName: "checkmark")
                    .opacity(moodVM.currentMood?.value == mood.value ? 1 : 0)
            }
        }
    }
}
