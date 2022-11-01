//
//  CongratsView.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 27/10/22.
//

import SwiftUI

struct CongratsView: View {
    @State var isTapped = false
    @EnvironmentObject var showIntro:Intro
    var body: some View {
//        VStack{
        NavigationView{
            ZStack{
                Image("CongratsH")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .onTapGesture {
                        isTapped.toggle()
                    }
                //                    .navigationBarBackButtonHidden(true)
                NavigationLink("", destination: LastView(), isActive: $isTapped)

            }

        }
//        }r
//        .edgesIgnoringSafeArea(.all)
        //            .edgesIgnoringSafeArea(.top)
//        .onAppear {
//            UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation") // Forcing the rotation to portrait
//            AppDelegate.orientationLock = .landscapeLeft // And making sure it stays that way
//        }
//        .onDisappear {
//            AppDelegate.orientationLock = .portrait // Unlocking the rotation when leaving the view
//        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }

}



struct CongratsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratsView()
    }
}




