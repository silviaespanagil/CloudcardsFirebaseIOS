//
//  CardView.swift
//  Cloudcards
//
//  Created by Silvia España on 31/3/22.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject var viewModel: CardViewModel
    
    @State var testAction = false
    func test() {
        testAction.toggle()
        print(testAction)
    }
    
    var body: some View {
        
        ZStack {
            
            backView.opacity(viewModel.showContent ? 1 : 0)
            frontView.opacity(viewModel.showContent ? 0 : 1)
        }
        .frame(width: 250, height: 200)
        .background(
            ZStack {
                
                viewModel.showContent
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
        .rotation3DEffect(.degrees(viewModel.showContent ? 180.0 : 0.0), axis: (x: 0, y: -1, z: 0))
        .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                viewModel.showContent.toggle()
            }
        }
        .onLongPressGesture {
            withAnimation {
                viewModel.showAlert = true
                viewModel.deleteCard = true
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            
            Alert(title: Text("Remove card"), message: Text("Are you sure you want to remove this card? You won't be able to retrieve it again."),
                  primaryButton: .destructive(Text("Remove")) {
                withAnimation {
                    
                    viewModel.remove()
                }
            }, secondaryButton: .cancel() {
                withAnimation {
                    
                    viewModel.deleteCard = false
                }
            })
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
                
                Button {
                    viewModel.success(false)
                }
            label: {
                
                Image(systemName: "hand.thumbsdown.fill")
                    .padding()
                    .background(Color.red)
                    .font(.title)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
                Button {
                    viewModel.success(true)
                }
            label: {
                
                Image(systemName: "hand.thumbsup.fill")
                    .padding()
                    .background(Color.green)
                    .font(.title)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
                
                //                ThumbsButton(systemNameImage: "hand.thumbsdown.fill", backgroundColor: Color.red, buttonAction: viewModel.success(false))
                //
                //                ThumbsButton(systemNameImage: "hand.thumbsup.fill", backgroundColor: Color.green, buttonAction: viewModel.success(true))
                
                Spacer()
            }
            Spacer()
        }
        .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}
