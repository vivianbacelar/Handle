//
//  OnboardingProvisorio.swift
//  Handle v.AgoraVai
//
//  Created by Vivian Bacelar on 09/11/22.
//

import SwiftUI

struct OnboardingProvisorio: View {
    var body: some View {
        ZStack{
            Image("TrueOnboarding2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
    }
}

struct OnboardingProvisorio_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingProvisorio()
    }
}
