//
//  Handle_v_AgoraVaiApp.swift
//  Handle v.AgoraVai
//
//  Created by Vivian Bacelar on 28/10/22.
//

import SwiftUI

@main
struct Handle_v_AgoraVaiApp: App {
    @StateObject var moodVM: MoodViewModel = MoodViewModel()

    @Environment(\.scenePhase) var scenePhase
    @StateObject var selectedEmoji = Emoji()
    @StateObject var showIntro = Intro()
    @StateObject var user = User()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State var currentExercise = Exercise.expand
    @AppStorage("signed_in") var isUserSignedIn:Bool = false

    


    var body: some Scene {
        WindowGroup {
            NavigationView {

//                ExerciseView(currentExercise: $currentExercise)
                if isUserSignedIn{
                    MainView()
                }
                else{
                    Onboarding()
                }

            }
            .environmentObject(selectedEmoji)
            .environmentObject(showIntro)
            .environmentObject(user)
            .environmentObject(moodVM)
            .onChange(of: scenePhase, perform: { phase in
                switch phase {
                case .active:
                    MoodModel.loadHistory()
                case .background:
                    break
                case .inactive:
                    MoodModel.saveHistory()
                @unknown default:
                    break
                }
            })
//            .environment(\.locale, Locale(identifier: "pt-BR"))
        }

    }
}

class AppDelegate: NSObject, UIApplicationDelegate {

    static var orientationLock = UIInterfaceOrientationMask.all //By default you want all your views to rotate freely


    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}

