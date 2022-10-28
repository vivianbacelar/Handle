//
//  SharedViewModel.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 25/10/22.
//

import Foundation
import SwiftUI
import UIKit

class UIKitContent: ObservableObject {
    @Published var index: Int
    @Published var frases: [String]

    init(){
        self.index = 0
        self.frases = ["FRASE 1", "FRASE 2", "FRASE 3"]
    }
}
