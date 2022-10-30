//
//  MainView.swift
//  Holdy v2
//
//  Created by Vivian Bacelar on 20/10/22.
//

// Tab View behind the main menu


import SwiftUI

struct MainView: View {
    @Binding var textoDoUsuario:String
    @StateObject var selectedEmoji = Emoji()

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
                }


        }.onAppear(){
            UITabBar.appearance().barTintColor = UIColor(Color(hex: 0x245150))

            UITabBar.appearance().unselectedItemTintColor = UIColor(Color(hex: 0x618571))
            UITabBar.appearance().backgroundColor = UIColor(Color(hex:0xE4E4E4))

            UITabBar.appearance().tintColor = .red // Not working

        }
        .environmentObject(selectedEmoji)
    }
}

