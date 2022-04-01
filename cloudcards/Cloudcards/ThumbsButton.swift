//
//  ThumbsButton.swift
//  Cloudcards
//
//  Created by Silvia España on 1/4/22.
//

import SwiftUI

struct ThumbsButton: View {
    
    var systemNameImage: String
    var backgroundColor: Color
    var buttonAction: () -> Void
    
    init(systemNameImage: String, backgroundColor: Color, buttonAction: @escaping () -> Void) {
        
        self.systemNameImage = systemNameImage
        self.backgroundColor = backgroundColor
        self.buttonAction = buttonAction
    }
    
    var body: some View {
        
        Button {
            buttonAction()
        }
    label: {
        
        Image(systemName: systemNameImage)
            .padding()
            .background(backgroundColor)
            .font(.title)
            .foregroundColor(.white)
            .clipShape(Circle())
    }
    }
}
