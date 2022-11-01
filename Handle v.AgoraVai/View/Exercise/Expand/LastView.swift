//
//  CircleView.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 20/10/22.
//

import SwiftUI

struct LastView: View {
    @EnvironmentObject var showIntro: Intro
    @EnvironmentObject var selectedEmoji:Emoji
    @EnvironmentObject var textoDoUsuario:User
    @State var tapped:Bool = false
    var showDetail:Bool {showIntro.displayed || tapped}

    @State var nums:[Int] = [1,2,3,4,5]
    @State var colors = [#colorLiteral(red: 0.5599847436, green: 0.8115807176, blue: 0.866892755, alpha: 1), #colorLiteral(red: 0.731630981, green: 0.8238679767, blue: 0.539796114, alpha: 1), #colorLiteral(red: 0.9286388159, green: 0.8184836507, blue: 0.5909100771, alpha: 1), #colorLiteral(red: 0.931117475, green: 0.6745183468, blue: 0.592323482, alpha: 1), #colorLiteral(red: 0.9282506108, green: 0.5942555666, blue: 0.5907897353, alpha: 1)].map{Color($0)}
    @State var emojis: [String] = ["😁","😌", "😐", "😤","😡"]
    @State var chosenEmoji: String?


    var body: some View {

        ZStack {

        Image("ImageHandle")
                .resizable()
                .scaledToFill()
                .blur(radius: 10)

        escolhaFinal


    }  .navigate(to: MainView(selectedEmoji: selectedEmoji), when: $showIntro.displayed)
            .showTabBar()
            .navigationBarBackButtonHidden(true)
            .onAppear {
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
                AppDelegate.orientationLock = .portrait // And making sure it stays that way
            }
            .onDisappear {
                AppDelegate.orientationLock = .all // Unlocking the rotation when leaving the view
            }

    }


    var escolhaFinal: some View {
        VStack{
            Text("Alright, how's your stress now?")
                .scaledFont(name: "Montserrat-ExtraBold", size: 14)
                .foregroundColor(Color(hex: 0x245150))
            HStack {
                ForEach(colors.indices, id: \.self) { rating in
                    VStack{

                        Button(action: {
//                            print("Pressed")
                            selectedEmoji.depois = emojis[rating]
                            chosenEmoji = emojis[rating]
                            selectedEmoji.colorDepois = colors[rating]
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
                showIntro.displayed.toggle()
            } label: {
                Text("Ok")
            }


            }
        }
    }




