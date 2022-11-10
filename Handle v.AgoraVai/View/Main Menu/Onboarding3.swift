//
//  Onboarding3.swift
//  Holdy v2
//
//  Created by Vivian Bacelar on 24/10/22.
//

import SwiftUI

struct Onboarding3: View {
    
    @AppStorage("name") var textoDoUsuario:String = ""
    @State var showHome: Bool = false
    @State private var characterLimit = 10
    @AppStorage("signed_in") var isUserSignedIn:Bool = false

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
                    .textInputAutocapitalization(.sentences)
                
                    .onChange(of: textoDoUsuario, perform: { _ in
                        if textoDoUsuario.count > characterLimit {
                            let limitedText = textoDoUsuario.dropLast()
                            textoDoUsuario = String(limitedText)
                                }
                            })
                
                
                Button {
                    showHome = true
                    isUserSignedIn = true
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
   
            MainView()
        }
    }
    
    struct Onboarding3_Previews: PreviewProvider {
        static var previews: some View {
            Onboarding3()
        }
    }
}
