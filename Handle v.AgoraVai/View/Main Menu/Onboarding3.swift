//
//  Onboarding3.swift
//  Holdy v2
//
//  Created by Vivian Bacelar on 24/10/22.
//

import SwiftUI

struct Onboarding3: View {
    
    @EnvironmentObject var textoDoUsuario:User
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
                
                
                TextField("Write here...", text: $textoDoUsuario.name)
                    .textFieldStyle(.roundedBorder)
                    .padding(15)
                    .textInputAutocapitalization(.never)
//                Text("Character count: \(textoDoUsuario.count)")
//                    .font(.custom("Montserrat-Regular", size: 16))
//                    .foregroundColor(.clear)
//                    .padding(.vertical, 10)
                
                    .onChange(of: textoDoUsuario.name, perform: { _ in
                        if textoDoUsuario.name.count > characterLimit {
                            let limitedText = textoDoUsuario.name.dropLast()
                            textoDoUsuario.name = String(limitedText)
                                }
                            })
                
                
                Button {
                    showHome = true
                } label: {
                    Text("Next")
                        .foregroundColor(Color("Fundo bege"))
                        .bold()
                        .fontWeight(.light)
                }.disabled(textoDoUsuario.name == "")
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
