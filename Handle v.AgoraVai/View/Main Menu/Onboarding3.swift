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
    @State private var characterLimit = 10
    
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
//                Text("Character count: \(textoDoUsuario.count)")
//                    .font(.custom("Montserrat-Regular", size: 16))
//                    .foregroundColor(.clear)
//                    .padding(.vertical, 10)
                
                    .onChange(of: textoDoUsuario, perform: { _ in
                                if textoDoUsuario.count > characterLimit {
                                    let limitedText = textoDoUsuario.dropLast()
                                    textoDoUsuario = String(limitedText)
                                }
                            })
                
                
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
            
        }.fullScreenCover(isPresented: $showHome) {
   
            MainView(textoDoUsuario: $textoDoUsuario)
        }
    }
    
    struct Onboarding3_Previews: PreviewProvider {
        static var previews: some View {
            Onboarding3()
        }
    }
}
