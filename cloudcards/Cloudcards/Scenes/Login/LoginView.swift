//
//  LoginView.swift
//  Cloudcards
//
//  Created by Silvia España on 25/4/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @Environment(\.isEnabled) var isEnabled
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            Text("Study cards")
                .font(.largeTitle)
                .padding(.bottom)
            
            VStack(alignment: .center, spacing: 20) {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Email")
                    TextField("Enter your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Password")
                    TextField("Enter a password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.default)
                }
            }
            .padding(.bottom)
            
            VStack {
                
                Button {
                    // TODO: Sign In
                }
            label: { LoginButton(buttonText: "Sign In", color: Color.blue) }
                
                Button {
                    // TODO: Add New User
                }
            label: { LoginButton(buttonText: "Sign Up", color: Color.gray) }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
