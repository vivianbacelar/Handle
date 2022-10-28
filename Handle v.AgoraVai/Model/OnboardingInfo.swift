//
//  OnboardingInfo.swift
//  Holdy v2
//
//  Created by Vivian Bacelar on 26/10/22.
//

import Foundation


import Foundation
import SwiftUI


struct OnboardingInfo {
    static let all = [
        OnboardingInfo(imageName: "ImageOnboarding1",
                       title: "So you’re stressed",
                       synopsis: "Bummer. We've all been there, haven't we? If you deal any school or work on a daily basis, congrats! It's most likely that you'll experience the wonders of being stressed. So Handle is here to help.",
                       color: "Verde",
                       progressImage: "Progress1"),
        OnboardingInfo(imageName: "ImageOnboarding2",
                        title: "Know what to do",
                        synopsis: "Handle offers de-stressing hand exercises that once learned, can be done wherever you want and need. Our main priority? You have the tools to be able to tackle your stress with more ease. ",
                        color: "Turquesa",
                        progressImage: "Progress2"),
        OnboardingInfo(imageName: "ImageOnboarding3",
                        title: "Used by professionals",
                        synopsis: "The exercises found here are based on the Formative Psychology Center, that studies ways that body - and mainly hand - posture direclty affects our emotional state. All exercises are professionally tested and frequently used by psychologists in the field.",
                        color: "Marinho",
                        progressImage: "Progress3"),
        OnboardingInfo(imageName: "ImageOnboarding4",
                        title: "Keep Track",
                        synopsis: "Along with the exercises, Handle offers you Health 4.0 features, optional personalized notifications and a mood calendar, to help you identify and map out your peaks of stress.",
                        color: "Amarelo",
                        progressImage: "Progress4"),
        OnboardingInfo(imageName: "Logo",
                        title: "Welcome",
                        synopsis: "We don't do ”conceal, don't feel” here. Stress is very real, and there's no need to push it aside. In fact, learning how and when your stress comes prevents you from getting overwhelmed when it happens. And that power is always in your hands ;)",
                        color: "Verde",
                        progressImage: "Progress5")
        
    ]
    
//    static let placeholder = OnboardingInfo(imageName: <#T##String#>, title: <#T##String#>, synopsis: <#T##String#>, color: <#T##String#>, progressImage: <#T##String#>)
    
    let imageName: String
    let title: String
    let synopsis: String
    let color: String
    let progressImage: String
}
