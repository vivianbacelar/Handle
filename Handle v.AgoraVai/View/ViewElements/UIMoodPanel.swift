//
//  UIMoodPanel.swift
//  Handle v.AgoraVai
//
//  Created by Alexandre César Brandão de Andrade on 01/11/22.
//

import SwiftUI

struct UIMoodPanel:View {
    @EnvironmentObject var moodVM: MoodViewModel
    //    @State var moodList:[UIMoodIcon] = []
    @State var lastSelected = 0

    //    init() {
    //        self.moodList = [
    //            UIMoodIcon(color: #colorLiteral(red: 0.5599847436, green: 0.8115807176, blue: 0.866892755, alpha: 1), emoji: "😁", value: 1, onSelect:{v in Self.onSelect(v)}),
    //            UIMoodIcon(color: #colorLiteral(red: 0.731630981, green: 0.8238679767, blue: 0.539796114, alpha: 1), emoji: "😌", value: 2, onSelect:{v in Self.onSelect(v)}),
    //            UIMoodIcon(color: #colorLiteral(red: 0.9286388159, green: 0.8184836507, blue: 0.5909100771, alpha: 1), emoji: "😐", value: 3, onSelect:{v in Self.onSelect(v)}),
    //            UIMoodIcon(color: #colorLiteral(red: 0.931117475, green: 0.6745183468, blue: 0.592323482, alpha: 1), emoji: "😤", value: 4, onSelect:{v in Self.onSelect(v)}),
    //            UIMoodIcon(color: #colorLiteral(red: 0.9282506108, green: 0.5942555666, blue: 0.5907897353, alpha: 1), emoji: "😡", value: 5, onSelect:{v in Self.onSelect(v)})
    //        ]
    //    }


    var body: some View {
        HStack {
            //            ForEach(moodList, id:\.value) { item in
            //                item
            //            }
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

    //    @Binding var showIntro: Bool
    @EnvironmentObject var showIntro:Intro
    var mood: Mood
//    @State var tempMood: Mood?
//    @State var chosenEmoji: String?
//    @EnvironmentObject var selectedEmoji:Emoji
//    @State var currentMood: Mood?

    var body: some View {
        escolhaInicial
    }


    var escolhaInicial: some View {
//        HStack {
            VStack{
                Button(action: {
                    moodVM.currentMood = mood
//                    selectedEmoji.antes = mood.emoji
//                    chosenEmoji = mood.emoji
//                    selectedEmoji.colorAntes = Color(mood.color)
//                    mood.isSelected.toggle()
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
//        }
    }
}


//struct UIMoodPanel_Previews: PreviewProvider {
//    static var previews: some View {
//        UIMoodPanel().previewLayout(.fixed(width: 400, height: 100))
//        UIMoodPanel().previewLayout(.fixed(width: 300, height: 80))
//    }
//}
