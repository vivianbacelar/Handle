//
//  Sobre.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 18/10/22.
//

import SwiftUI

enum Exercise {
    case expand, embrace, grasp, none
}

struct Menu: View {
    @EnvironmentObject var showIntro: Intro
    @EnvironmentObject var moodVM: MoodViewModel

    @State var tapped = false
    @State var tappedLocked = false
    //    @State var showIntro = true // mudar para true depois
    var showDetail:Bool {tapped || showIntro.displayedIntro}

    @State var selectedCard = Card.placeholder
    @State var currentExercise = Exercise.none
    var actualMood = MoodModel.getFirstMoods(fromDate: .now)


    
    var textoDoUsuario:String
    
    var body: some View {

        NavigationView{
            switch currentExercise {
            case .expand:
                ExpandTutorial(currentExercise: $currentExercise)
            case .embrace:
                EmbraceTutorial(currentExercise: $currentExercise)
            case .grasp:
                GraspTutorial()
            case .none:
                ZStack{
                    ScrollView{
                        HStack{
                            welcome

                                 VStack{
                                     Text("\(actualMood.first?.emoji ?? "?")")
                                             .scaledFont(name: "system", size: 28)
                                             .padding()
                                             .shadow(radius:4)
                                             .clipShape(Circle())
                                             .background(Color(actualMood.first?.color ?? .white))
                                             .clipShape(Circle())

                                     Text("status")
                                         .scaledFont(name: "Montserrat-Regular", size: 14)
                                         .foregroundColor(Color(hex: 0x245150))
                                 }
                                 .padding()
                            }


                        cards
                    }
                    .showTabBar()
                    .toolbar {
                        NavigationLink(destination: About(), label:{ Text("About")})
                    }.tint(Color("Verde"))
                    if showDetail {
                        ZStack {
                            Color.clear.background(.ultraThinMaterial)
                            if showIntro.displayedIntro{
                                VStack{
                                    Text("Alright, how's your stress today?")
                                        .scaledFont(name: "Montserrat-ExtraBold", size: 14)
                                        .foregroundColor(Color(hex: 0x69696B))
                                    UIMoodPanel()
                                        .padding()
                                    Button {
                                        let newMood = MoodModel(timeStamp: .now, valor: moodVM.currentMood!.value, quote: "")
//                                        MoodModel.history.append(newMood)
                                        MoodModel.history = [newMood]
//                                        MoodModel.saveHistory()
                                        showIntro.displayedIntro.toggle()
                                    } label: {
                                        Text("Ok")
                                            .foregroundColor(Color("Verde"))
                                            .bold()
                                    }
                                }
                            } else {
                                CardDetailView(card: $selectedCard, tapped: $tapped, currentExercise: $currentExercise)
                                    .onTapGesture {
                                        tapped.toggle()
                                    }
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
            AppDelegate.orientationLock = .portrait // And making sure it stays that way
        }
        .onDisappear {
            AppDelegate.orientationLock = .all // Unlocking the rotation when leaving the view
        }
    }

    
    
    var cards: some View {
        GeometryReader { geometry in
            HStack(spacing:20) {
                VStack(spacing:20){
                    CardView(geometry: geometry, card:Card.all[0], tapped: $tappedLocked, selectedCard: $selectedCard)
                        .opacity(0.5)
                    CardView(geometry: geometry, card:Card.all[1], tapped: $tappedLocked, selectedCard: $selectedCard)
                        .opacity(0.5)
                }
                .padding(.bottom)
                CardView(geometry: geometry, card:Card.all[2], tapped: $tapped, selectedCard: $selectedCard)
            }
            
        }
        .frame(height: 50)
        .padding()
        .padding(.top)
    }
    
    var welcome: some View {
        
        VStack{
            HStack{
                RoundedRectangle(cornerRadius: 0)
                    .frame(width: 67, height: 67)
                    .padding()
                    .foregroundColor(Color(hex:0x618571))
                    .shadow(radius: 4)
                    .opacity(0)
                    .overlay(
                        
                        Group{
                            Image("HandleGreen") // inserir username aqui
                                .resizable()
                                .padding(.leading, 55)
                                .padding(.top, 30)
                                .frame(width: 200, height: 200)
                                .padding(.vertical, 10)
                            
                            Text("Welcome, \(textoDoUsuario)!")
                                .scaledFont(name: "Montserrat-Regular", size: 14)
                                .foregroundColor(Color(hex: 0x245150))
                                .padding(.leading, 60)
                                .padding(.top,110)
                                .frame(width:220)

                        }
                    )
                
                Spacer()

                
            }
            
        }
    }


}


struct DummyViewMenu: View{


    var body: some View{
        Menu(textoDoUsuario: "")

    }
}

struct Menu_Previews: PreviewProvider {

    static var previews: some View {
        DummyViewMenu()
            .environmentObject(Intro())
            .environmentObject(MoodViewModel())
    }
}
