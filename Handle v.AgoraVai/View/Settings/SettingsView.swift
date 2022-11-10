//
//  Configuracao.swift
//  Holdy v2
//
//  Created by Vivian Bacelar on 17/10/22.
//

import SwiftUI
import Accessibility

struct SettingsView: View {
    
    @State private var selected = "English"
    @State var voiceGuide: Bool = false
    @State var headphoneAdaptations: Bool = false
    @State var backgroundSounds: Bool = false
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color("Fundo bege")
                    .ignoresSafeArea()
                
                    
                Text("Settings")
                    .scaledFont(name: "Montserrat-Regular", size: 28)
                    .foregroundColor(Color("Marinho"))
                    .multilineTextAlignment(.trailing)
                    .padding(.top, -340)
                    .padding(.leading, -180)
                
                
                Text("Handle your stress the best way you can")
                    .scaledFont(name: "Montserrat-Regular", size: 14)
                    .foregroundColor(Color("Marinho"))
                    .padding(.top, -305)
                    .padding(.leading, -75)
                
                
                Text("Language")
                    .scaledFont(name: "Montserrat-Regular", size: 18)
                    .foregroundColor(Color("Marinho"))
                    .padding(.top,-230)
                    .padding(.leading, -175)
                
                
                VStack{
                    //                        Color(.red)
                    Picker("Language", selection: $selected){
                        Text("English")
                            .tag("English")
                        Text("Portuguese")
                            .tag("Portuguese")
                        
                        
                    }
                    .pickerStyle(.segmented)
                    .background(Color("Fundo bege"))
                    .frame(width: 300)
                    .padding(.top,-180)
                    
                    
                    
//                    HStack{
//
//                        if voiceGuide == true{
//
//
//                        }
//                        Toggle(isOn:$voiceGuide){
//                            Text("Voice-Guided Activities")
//                                .scaledFont(name: "Montserrat-Regular", size: 18)
//                                .foregroundColor(Color("Marinho"))
//
//
//
//                        }
//
//                    }.padding(.top,-100)
                       
                    
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



