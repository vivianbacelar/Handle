//
//  Configuracao.swift
//  Holdy v2
//
//  Created by Vivian Bacelar on 17/10/22.
//

import SwiftUI
import Accessibility

struct SettingsView: View {
    
    @State var voiceGuide: Bool = false
    @State var headphoneAdaptations: Bool = false
    @State var backgroundSounds: Bool = false
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color("Fundo bege")
                    .ignoresSafeArea()
                
                VStack{
                    
                    Text("Settings")
                        .scaledFont(name: "Montserrat-Regular", size: 28)
                        .foregroundColor(Color("Marinho"))
                        .multilineTextAlignment(.trailing)
                        .padding(.top, -340)
                    
                    
                    Text("De-stress the best way you can")
                        .scaledFont(name: "Montserrat-Regular", size: 14)
                        .foregroundColor(Color("Marinho"))
                        .padding(.top, -300)
                    
                    
                        .padding(.trailing)
                    
                }
                    
                    VStack{
                        
                        Text("Language")
                            .scaledFont(name: "Montserrat-Regular", size: 18)
                            .foregroundColor(Color("Marinho"))
                            .padding()
                        
                        
                        if voiceGuide == true{
                            //                    color.black.ignoresSafeArea(.all)
                        }
                        
                        Toggle(isOn:$voiceGuide){
                            Text("Voice-guided Activities")
                                .scaledFont(name: "Montserrat-Regular", size: 18)
                                .foregroundColor(Color("Marinho"))
                                .padding()
                            
                        }
                        
                        .padding(.vertical,10)
                        
                        if headphoneAdaptations == true {
                            
                        }
                        
                        Toggle(isOn:$headphoneAdaptations){
                            Text("Headphone Adaptations")
                                .scaledFont(name: "Montserrat-Regular", size: 18)
                                .foregroundColor(Color("Marinho"))
                                .padding()
                            
                            
                        }
                        
                        .padding(.vertical,10)
                        
                        if backgroundSounds == true {
                            
                        }
                        
                        Toggle(isOn:$backgroundSounds){
                            Text("Background Sounds")
                                .scaledFont(name: "Montserrat-Regular", size: 18)
                                .foregroundColor(Color("Marinho"))
                                .padding()
                            
                            
                        }
                    }
            }
            
            //                .preferredColorScheme(paletaDaltonica ? .dark : .light)
            
        }
    }
    
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
    
    
}
