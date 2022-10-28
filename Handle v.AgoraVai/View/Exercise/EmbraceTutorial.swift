//
//  ExpandSynopsis.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 27/10/22.
//

import Foundation
import SwiftUI

struct EmbraceTutorial: View{
    @Binding var currentExercise:Exercise
    
    var body: some View{
        
        ZStack{
            Image(Card.all[1].imageTutorial)
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
                        .scaledFont(name: "Montserrat-Bold", size: 24)
                        .foregroundColor(.white)
                }
            }
        }
        
    }
    
    struct DummyView7: View{
        @State var currentExercise = Exercise.expand
        
        
        var body: some View{
            EmbraceTutorial(currentExercise:$currentExercise)
        }
    }
    
    struct EmbraceSynopsis_Previews: PreviewProvider {
        static var previews: some View {
            DummyView7()
        }
    }
    
}
