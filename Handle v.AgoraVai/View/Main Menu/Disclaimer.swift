//
//  Disclaimer.swift
//  Handle v.AgoraVai
//
//  Created by Vivian Bacelar on 09/11/22.
//

import SwiftUI

struct Disclaimer: View {
    
    @State var showHome: Bool = false
    @AppStorage("signed_in") var isUserSignedIn:Bool = false
    
    var body: some View {
        
        ZStack {
            Color("Fundo bege")
                .ignoresSafeArea()
                
                
                Text("Disclaimer")
                    .scaledFont(name: "Montserrat-SemiBold", size: 28)
                    .foregroundColor(Color("Marinho"))
                    .multilineTextAlignment(.trailing)
                    .padding(.top, -340)
                    .padding(.leading, -180)
                
                
                
                Text("Use of the advice and information contained in Handle is at your sole choice. You should not rely on Handle's exercises as a substitute for, nor does it replace, professional mental health advice, diagnosis, or treatment.")
                    .scaledFont(name: "Montserrat-Regular", size: 18)
                    .foregroundColor(Color("Marinho"))
                    .padding(.top, -270)
                    .padding()
                
                Text("Handle's exercises are focused on self- destress, created and used by professionals on a daily basis. However, experiences and effectiveness is personal to each user, and may not necessairly be representative of all users of our app. We do not claim, and you should not assume, that all users have the same experiences. Your individual results may vary.")
                    .scaledFont(name: "Montserrat-Regular", size: 18)
                    .foregroundColor(Color("Marinho"))
                    .padding(.top, 10)
                    .padding()
                
            VStack{
                
                Button {
                    showHome = true
                } label: {
                    Text("Next")
                        .foregroundColor(Color("Marinho"))
                        .bold()
                        .fontWeight(.light)
                }.buttonStyle(.plain)
                    .padding(.top, 300)
//                    .padding(.leading, -180)
                
                
            }
        }.navigationBarHidden(true)
        .fullScreenCover(isPresented: $showHome) {
   
            MainView()
        }
        
    }
}

struct Disclaimer_Previews: PreviewProvider {
    static var previews: some View {
        Disclaimer()
    }
}
