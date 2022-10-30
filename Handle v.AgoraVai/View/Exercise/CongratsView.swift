//
//  CongratsView.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 27/10/22.
//

import SwiftUI

struct CongratsView: View {
    @State var isTapped = false
    var body: some View {
            ZStack{
                Image("PreviewExercise2")
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        isTapped.toggle()
                    }
                NavigationLink("", destination: LastView(), isActive: $isTapped)
            }

//        .ignoresSafeArea()
        .onAppear {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
            AppDelegate.orientationLock = .portrait // And making sure it stays that way
        }
        .onDisappear {
            AppDelegate.orientationLock = .all // Unlocking the rotation when leaving the view
        }
    }

}



struct CongratsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratsView()
    }
}




