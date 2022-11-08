//
//  MainView.swift
//  Holdy v2
//
//  Created by Vivian Bacelar on 20/10/22.
//

// Tab View behind the main menu


import SwiftUI

struct MainView: View {
//    @EnvironmentObject var textoDoUsuario:User
    @AppStorage("name") var textoDoUsuario:String = ""
    @StateObject var selectedEmoji = Emoji()
    @EnvironmentObject var showIntro:Intro
    @AppStorage("signed_in") var isUserSignedIn:Bool = false 

    var body: some View {


        TabView {
            Menu(textoDoUsuario: textoDoUsuario)
                  .tabItem {
                      Label("Home", systemImage: "house")
                  }
            CalendarView()
                .tabItem {
                    Label("Progress", systemImage: "calendar")
                }
            SettingsView()
                  .tabItem {
                    Label("Settings", systemImage: "gearshape")
                  }.tint(Color("Verde"))
        }.onAppear(){
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(named: "Fundo bege")
            appearance.shadowColor = nil
            appearance.stackedItemPositioning = .centered
            appearance.stackedItemSpacing = 0
            appearance.selectionIndicatorTintColor = .red
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(named: "Marinho")
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor(named: "Marinho")
            ]
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor(named: "Verde")
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor(named: "Verde")
            ]
            UITabBar.appearance().scrollEdgeAppearance = appearance
            UITabBar.appearance().standardAppearance = appearance
//            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .normal)
//
//            UITabBar.appearance().tintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)


//            let newAppearance = UITabBar.appearance()
//
//            newAppearance.barTintColor = .red
//
//            UITabBar.appearance().scrollEdgeAppearance = newAppearance
//            UITabBar.appearance().standardAppearance = newAppearance
            
//            UITabBar.appearance().barTintColor = UIColor(Color(hex: 0x245150))
//
//            UITabBar.appearance().unselectedItemTintColor = UIColor(Color(hex: 0x618571))
//            UITabBar.appearance().backgroundColor = UIColor(Color(hex:0xE4E4E4))
//
//            UITabBar.appearance().tintColor = .red // Not working

        }
        .environmentObject(selectedEmoji)
    }
}

