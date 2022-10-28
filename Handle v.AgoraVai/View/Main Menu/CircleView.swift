//
//  CircleView.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 20/10/22.
//

import SwiftUI

struct CircleView: View {
    @Binding var showIntro: Bool
    
    @State var nums:[Int] = [1,2,3,4,5]
    @State var colors = [#colorLiteral(red: 0.5599847436, green: 0.8115807176, blue: 0.866892755, alpha: 1), #colorLiteral(red: 0.731630981, green: 0.8238679767, blue: 0.539796114, alpha: 1), #colorLiteral(red: 0.9286388159, green: 0.8184836507, blue: 0.5909100771, alpha: 1), #colorLiteral(red: 0.931117475, green: 0.6745183468, blue: 0.592323482, alpha: 1), #colorLiteral(red: 0.9282506108, green: 0.5942555666, blue: 0.5907897353, alpha: 1)].map{Color($0)}
    @State var emojis: [String] = ["😁","😌", "😐", "😤","😡"]
    
    @State var chosenEmoji: String?
    @EnvironmentObject var selectedEmoji:Emoji
    
    var body: some View {
        escolhaInicial
    }
    
    
    var escolhaInicial: some View {
        VStack{
            Text("Alright, how's your stress today?")
                .scaledFont(name: "Montserrat-ExtraBold", size: 14)
                .foregroundColor(Color(hex: 0x69696B))
            HStack {
                ForEach(colors.indices, id: \.self) { rating in
                    VStack{
                        
                        Button(action: {
//                            print("Pressed")
                            selectedEmoji.antes = emojis[rating]
                            chosenEmoji = emojis[rating]
                            selectedEmoji.colorAntes = colors[rating]
                        }
                        ){
                            Text("\(emojis[rating])")
                                .scaledFont(name: "Montserrat-SemiBold", size: 28)
                                .clipShape(Circle())
                            
                        }
                        .buttonStyle(CircleEmoji(color: colors[rating]))
                        
                        .shadow(radius:4)
                        
                        ZStack {
                            Text("\(nums[rating])")
                                .opacity(emojis[rating] != chosenEmoji ? 1 : 0)
                            Image(systemName: "checkmark")
                                .opacity(emojis[rating] != chosenEmoji ? 0 : 1)
                        }

                        
                    }
                }
            }
            .padding()
            Button {
                showIntro.toggle()
            } label: {
                Text("Ok")
            }
        }
    }
}

struct CircleEmoji: ButtonStyle {
    let color: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.5 : 1)
            .padding()
            .shadow(radius:4)
            .clipShape(Circle())
            .background(
                configuration.isPressed
                ? Color(white: 0.25).opacity(0.2)
                : Color.clear)
            .background(color)
            .clipShape(Circle())
            
    }
}

struct DummyView2: View {
    
    @State var showIntro = true
    
    var body: some View{
        CircleView(showIntro: $showIntro)
    }
}


struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView2()
    }
}
