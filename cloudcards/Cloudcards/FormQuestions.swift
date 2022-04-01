//
//  FormQuestions.swift
//  Cloudcards
//
//  Created by Silvia España on 1/4/22.
//

import SwiftUI

struct FormQuestions: View {
    
    var formText: String
    var textFieldLabel: String
    var bindingText: Binding<String>
    
    init(formText: String, textFieldLabel: String, bindingText: Binding<String>) {
        
        self.formText = formText
        self.textFieldLabel = textFieldLabel
        self.bindingText = bindingText
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
  
            Text(formText)
            
            TextField(textFieldLabel, text: bindingText)
                .textFieldStyle(.roundedBorder)

        }.padding(.bottom)
    }
}
