//
//  LoginView.swift
//  Cloudcards
//
//  Created by Silvia España on 25/4/22.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var cardListViewModel: CardListViewModel
    
    @State var email = ""
    @State var password = ""
    @State var showPassword = false
    @State var showAlert = false
    @State var errorDescription: String?
    
    private func showError(error: Error) {
        
        errorDescription = error.localizedDescription
        showAlert = true
    }
    
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
                    
                    HStack {
                        
                        if self.showPassword {
                            
                            TextField("Enter a password", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.default)
                        } else {
                            
                            SecureField("Enter a password", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.default)
                        }
                        Button(action: {
                            
                            self.showPassword.toggle()
                        }) {
                            Image(systemName: self.showPassword ? "eye.fill" : "eye.slash.fill")
                        }
                    }
                }
            }
            .padding(.bottom)
            
            VStack {
                
                Button {
                    
                    AuthenticationService.signIn(email: email, password: password) { _, error in
                        
                        if let error = error {
                            
                            showError(error: error)
                        }
                    }
                }
            label: { LoginButton(buttonText: "Sign In", color: Color.blue) }
                
                Button {
                    
                    AuthenticationService.addNewUser(email: email, password: password) { authResult, error in
                        
                        if let error = error {
                            
                            showError(error: error)
                        } else {
                            
                            if let userInfo = authResult?.additionalUserInfo, userInfo.isNewUser {
                                
                                cardListViewModel.addStarterCards()
                            }
                        }
                    }
                }
            label: { LoginButton(buttonText: "Sign Up", color: Color.gray) }
            }
            .disabled(email.isEmpty || password.count < 6)
            
            Spacer()
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text(errorDescription ?? "🙈"))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(cardListViewModel: CardListViewModel())
    }
}
