//
//  LoginButton.swift
//  Cloudcards
//
//  Created by Silvia España on 25/4/22.
//

import SwiftUI

struct LoginButton: View {
    
    @Environment(\.isEnabled) var isEnabled
    var buttonText: String
    var color: Color
    
    init(buttonText: String, color: Color) {
        
        self.buttonText = buttonText
        self.color = color
    }
    
    var body: some View {
        
        HStack {
            Spacer()
            Text(buttonText)
                .foregroundColor(Color.white)
                
            Spacer()
        }
        .padding()
        .background(
            color
                .opacity(isEnabled ? 1 : 0.5)
        )
        .cornerRadius(15)
    }
}
