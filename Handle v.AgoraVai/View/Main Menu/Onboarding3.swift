//
//  Onboarding3.swift
//  Holdy v2
//
//  Created by Vivian Bacelar on 24/10/22.
//

import SwiftUI

struct Onboarding3: View {
    
    @State var textoDoUsuario = ""
    @State var showHome: Bool = false
    
    var body: some View {
        
        ZStack{
            
            Color("Verde")
                .ignoresSafeArea()
            
            
            VStack{
                Text("How would you like to be called?")
                    .foregroundColor(Color("Fundo bege"))
                    .font(.custom("Montserrat-Bold", size: 28))
                    .multilineTextAlignment(.center)
                
                
                TextField("Write here...", text: $textoDoUsuario)
                    .textFieldStyle(.roundedBorder)
                    .padding(15)
                    .textInputAutocapitalization(.never)
                
                Button {
                    showHome = true
                } label: {
                    Text("Next")
                        .foregroundColor(Color("Fundo bege"))
                        .bold()
                        .fontWeight(.light)
                }.disabled(textoDoUsuario == "")
                    .buttonStyle(.plain)
            }
            
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $showHome) {
   
            MainView(textoDoUsuario: $textoDoUsuario)
        }
    }
    
    struct Onboarding3_Previews: PreviewProvider {
        static var previews: some View {
            Onboarding3()
        }
    }
}
