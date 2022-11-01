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

    @State var tapped = false
//    @State var showIntro = true // mudar para true depois
    var showDetail:Bool {tapped || showIntro.displayedIntro}
    @State var selectedCard = Card.placeholder
    @State var currentExercise = Exercise.none
    
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
                        welcome

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
                                CircleView()
                            }
                            else {
                                CardDetailView(card: $selectedCard, currentExercise: $currentExercise)
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
                    CardView(geometry: geometry, card:Card.all[0], tapped: $tapped, selectedCard: $selectedCard)
                    CardView(geometry: geometry, card:Card.all[1], tapped: $tapped, selectedCard: $selectedCard)
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


//
//struct Menu_Previews: PreviewProvider {
//    static var previews: some View {
//        Menu()
//    }
//}
