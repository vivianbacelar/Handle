//
//  MoodIcon.swift
//  Handle v.AgoraVai
//
//  Created by Alexandre César Brandão de Andrade on 01/11/22.
//

import SwiftUI

struct UIMoodIcon:View {
    var color:Color
    var emoji:String
    var value:Int
    var onSelect: (Int)->Void

    @State var selected:Bool = false


    init(color: UIColor, emoji: String, value: Int, onSelect: @escaping (Int)->Void ) {
        self.color = Color(color)
        self.emoji = emoji
        self.value = value
        self.onSelect = onSelect
    }

    var body: some View {
        VStack {
            ZStack {
                color.clipShape(Circle())
                Text(emoji)
                    .font(.largeTitle)
                    .minimumScaleFactor(0.1)

            }
            Text(selected ? "✓" : "\(value)")
        }.onTapGesture {
            selected.toggle()
            onSelect(value)
        }
    }
}


struct MoodIcon_Previews: PreviewProvider {
    static var previews: some View {
        UIMoodIcon(color: #colorLiteral(red: 0.5599847436, green: 0.8115807176, blue: 0.866892755, alpha: 1), emoji: "😁", value: 1, onSelect: {value in})
    }
}
