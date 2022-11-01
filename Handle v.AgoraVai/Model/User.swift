//
//  User.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 21/10/22.
//

import Foundation

class User:Equatable,ObservableObject{

    @Published var name:String
    // UUID

    init() {
        self.name = ""
    }

    static func ==(lhs: User, rhs: User) -> Bool {
        lhs.name == rhs.name
    }
}
