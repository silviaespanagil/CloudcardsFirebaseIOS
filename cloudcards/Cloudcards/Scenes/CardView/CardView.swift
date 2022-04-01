//
//  CardView.swift
//  Cloudcards
//
//  Created by Silvia España on 31/3/22.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject var viewModel: CardViewModel
    
    @State var showContent = false
    @State var testAction = false
    func test() {
        testAction.toggle()
        print(testAction)
    }
    
    var body: some View {
        
        ZStack {
            
            backView.opacity(showContent ? 1 : 0)
            frontView.opacity(showContent ? 0 : 1)
        }
        .frame(width: 250, height: 200)
        .background(
            ZStack {
                
                showContent
                ? Color(.gray)
                : Color(.blue)
                
                Image(systemName: "questionmark")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color(.white).opacity(0.2))
                    .offset(y: 20)
            }
        )
        .cornerRadius(20)
        .rotation3DEffect(.degrees(showContent ? 180.0 : 0.0), axis: (x: 0, y: -1, z: 0))
        .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
        .onTapGesture {
            withAnimation {
                showContent.toggle()
            }
        }
    }
    
    var frontView: some View {
        
        VStack() {
            
            Spacer()
            
            Text(viewModel.card.question)
                .foregroundColor(.white)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            if !viewModel.card.successful {
                
                Text("You answered this one incorrectly before")
                    .foregroundColor(.white)
                    .font(.system(size: 11.0))
                    .fontWeight(.bold)
                    .padding()
            }
        }
    }
    
    var backView: some View {
        
        VStack {
            Spacer()
            HStack {
                
                Text(viewModel.card.answer)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20))
                    .padding()
                    .animation(.easeInOut)
            }
            
            Spacer()
            
            HStack(spacing: 40) {
                Spacer()
                ThumbsButton(systemNameImage: "hand.thumbsdown.fill", backgroundColor: Color.red, buttonAction: test)
                ThumbsButton(systemNameImage: "hand.thumbsup.fill", backgroundColor: Color.green, buttonAction: test)
                Spacer()
            }
            Spacer()
        }
        .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}
