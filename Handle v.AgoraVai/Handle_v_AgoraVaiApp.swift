//
//  Handle_v_AgoraVaiApp.swift
//  Handle v.AgoraVai
//
//  Created by Vivian Bacelar on 28/10/22.
//

import SwiftUI

@main
struct Handle_v_AgoraVaiApp: App {
    @StateObject var selectedEmoji = Emoji()
    @StateObject var showIntro = Intro()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State var currentExercise = Exercise.expand
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                //            MainView()
                Onboarding()

//                ExerciseView(currentExercise: $currentExercise)
//                    .onAppear {
//                        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
//                        AppDelegate.orientationLock = .portrait // And making sure it stays that way
//                    }
//                    .onDisappear {
//                        AppDelegate.orientationLock = .all // Unlocking the rotation when leaving the view
//                    }
            }
            .environmentObject(selectedEmoji)
            .environmentObject(showIntro)
        }

    }
}

class AppDelegate: NSObject, UIApplicationDelegate {

    static var orientationLock = UIInterfaceOrientationMask.all //By default you want all your views to rotate freely

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}

