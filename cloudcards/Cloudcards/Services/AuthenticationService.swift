//
//  AuthenticationService.swift
//  Cloudcards
//
//  Created by Silvia España on 22/4/22.
//

import Foundation
import Firebase

class AuthenticationService: ObservableObject {
    
    @Published var user: User?
    private var authenticationStateHandle: AuthStateDidChangeListenerHandle?
    
    init() {
        
        addListerners()
    }
    
    static func signIn() {
        if Auth.auth().currentUser == nil {
            
            Auth.auth().signInAnonymously()
        }
    }
    private func addListerners() {
        
        if let handle = authenticationStateHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
        
        authenticationStateHandle = Auth.auth()
            .addStateDidChangeListener { _, user in
                self.user = user
            }
    }
}
