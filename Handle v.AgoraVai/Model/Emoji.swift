//
//  Emoji.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 24/10/22.
//

import Foundation
import SwiftUI


class Emoji:ObservableObject{
    
    
    @Published var antes:String
    @Published var depois:String
    @Published var colorAntes:Color
    @Published var colorDepois:Color

    
    init(){
        self.antes = "❔"
        self.depois = "❓"
        
        self.colorAntes = Color(hex: 0xFFFFFF)
        self.colorDepois = Color(hex:0xFF45EF)
    }
}
