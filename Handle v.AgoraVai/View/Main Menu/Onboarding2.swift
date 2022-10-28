//
//  Onboarding2.swift
//  Holdy v2
//
//  Created by Vivian Bacelar on 24/10/22.
//

import SwiftUI

struct Onboarding2: View {
    var body: some View {
        
        ZStack{
            
            Color(hex: 0x44AA99)
                .ignoresSafeArea()
            
            VStack{
                
                Text("These exercises are simple and quick and have proven effectiveness. So, along with Health 4.0 and so many other features of the App, you can learn to take control of de-stressing in the palm of your hands!")
                    .foregroundColor(.white)
                    .font(.custom("manrope-light", size: 20))
                    .padding()
                
                
                NavigationLink {
                    Onboarding3()
                } label: {
                    Text("Next>>")
                        .foregroundColor(.white)
                        .bold()
                        .fontWeight(.light)
                }
                
            }
        }
        
//        struct Onboarding2_Previews: PreviewProvider {
//            static var previews: some View {
//                Onboarding2()
//            }
//        }
    }
}
