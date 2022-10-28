//
//  Begin.swift
//  Holdy v2
//
//  Created by Vivian Bacelar on 27/10/22.
//

import SwiftUI

struct Begin: View {
    @State var isVisible = true
    var body: some View {
        NavigationView{
            ZStack{
                
                Color("Verde")
                    .ignoresSafeArea()
                
                Image("Handle")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(1, contentMode: .fit)
                    .ignoresSafeArea()
                    .padding(.bottom,120)
                //                    .animation(.easeOut, value:)
                
                
                
                //                NavigationLink{
                //                    Onboarding()
                //                } label: {
                //                    Text("Next")
                //                        .foregroundColor(.white)
                //                        .bold()
                //                        .fontWeight(.light)
                //                        .padding(.bottom, 750)
                //                        .padding(.leading, 300)
            }
            
        }
    }
    
    
    //            struct Begin_Previews: PreviewProvider {
    //                static var previews: some View {
    //                    Begin()
    //                }
    //            }
}


