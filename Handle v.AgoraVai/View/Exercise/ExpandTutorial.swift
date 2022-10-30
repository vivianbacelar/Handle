//
//  ExpandSynopsis.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 27/10/22.
//

import Foundation
import SwiftUI

struct ExpandTutorial: View{
    @Binding var currentExercise:Exercise

    var body: some View{
        NavigationView{
            ZStack{
                Image(Card.all[2].imageTutorial)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                NavigationLink {
                    ExerciseView(currentExercise: $currentExercise)
                        .toolbar(.hidden)
                        .ignoresSafeArea()
                } label: {
                    Group{
                        Text("Got it, let's begin")
                            .scaledFont(name: "Montserrat-Bold", size: 17)
                            .foregroundColor(.white)
                            .padding(.top, 700)
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
//            .hiddenTabBar()
        }
    }


}

struct DummyView6: View{
    @State var currentExercise = Exercise.expand
    @State var card = Card.placeholder

    
    var body: some View{
        ExpandTutorial(currentExercise:$currentExercise)
    }
}

struct ExpandSynopsis_Previews: PreviewProvider {
    static var previews: some View {
        DummyView6()
    }
}


