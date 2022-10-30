//
//  StartedExercise.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 25/10/22.
//

import SwiftUI

struct StartedExercise: View {

    
    var body: some View {

        ZStack {
                ImagePicker()
                    .hiddenTabBar()
                    .onAppear {
                        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation") // Forcing the rotation to portrait
                        AppDelegate.orientationLock = .landscapeLeft // And making sure it stays that way
                    }
                    .onDisappear {
                                AppDelegate.orientationLock = .all // Unlocking the rotation when leaving the view
                    }

            
        }
    }
}

//struct StartedExercise_Previews: PreviewProvider {
//    static var previews: some View {
//        StartedExercise()
//    }
//}
//
