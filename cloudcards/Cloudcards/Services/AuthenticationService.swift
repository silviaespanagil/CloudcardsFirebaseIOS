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
    
    /* For anonymous signIn
     static func signIn() {
     if Auth.auth().currentUser == nil {
     
     Auth.auth().signInAnonymously()
     }
     }
     */
    
    static func signIn(email: String, password: String, completion: @escaping AuthDataResultCallback) {
        
        if Auth.auth().currentUser != nil {
            
            Self.signOutUser()
        }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    static func addNewUser(email: String, password: String, completion: @escaping AuthDataResultCallback) {
        
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    static func signOutUser() {
        
        do {
            
           try Auth.auth().signOut()
        } catch {
            
            print(error.localizedDescription)
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
