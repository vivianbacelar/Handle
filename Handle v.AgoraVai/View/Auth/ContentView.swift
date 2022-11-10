//
//  ContentView.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 17/10/22.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme  // cor do botão
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName")  var lastName: String = ""
    @AppStorage("userId") var userId: String = ""

    private var isSignedIn: Bool {
        !userId.isEmpty
    }

    
    var body: some View {
        VStack {
            
            if !isSignedIn{
                SignInView()
                    .navigationTitle("Sign In")
            }
            else {
                Menu(textoDoUsuario: firstName + " " + lastName)
            }
            
            
        }
    }
}

struct SignInView: View {
    
    @Environment(\.colorScheme) var colorScheme  // cor do botão
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName")  var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    var body: some View {
        SignInWithAppleButton(.continue){
            request in request.requestedScopes = [.email, .fullName]
        }
        
    onCompletion: { result in
            switch result {
            case .success(let auth):
                switch auth.credential{
                // ASAuthorization tem todas informações do usuario
                case let credential as ASAuthorizationAppleIDCredential:
                    
                    // Identificador do usuário
                    let userId = credential.user
                    
                    // Informações do usuário
                    let email = credential.email
                    let firstName = credential.fullName?.givenName
                    let lastName = credential.fullName?.familyName
                    
                    self.email = email ?? ""
                    self.userId = userId
                    self.firstName = firstName ?? ""
                    self.lastName = lastName ?? ""
                    
                    break
                    
                default:
                    break
                }
            case .failure(let error):
                debugPrint(error)
            }
        }
        .signInWithAppleButtonStyle(
            colorScheme == .dark ? .whiteOutline : .white // se o iphone estiver no modo escuro o botão fica branco
        )
        .frame(height:80)
        .padding()
        .cornerRadius(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
