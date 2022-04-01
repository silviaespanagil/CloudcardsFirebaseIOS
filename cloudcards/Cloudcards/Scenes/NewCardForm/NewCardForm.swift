//
//  NewCardForm.swift
//  Cloudcards
//
//  Created by Silvia España on 1/4/22.
//

import SwiftUI

struct NewCardForm: View {
    
    @ObservedObject var cardListViewModel: CardListViewModel
    
    @State var question: String = ""
    @State var answer: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack() {
            
            Text("Add a new trivia card")
                .font(.title)
                .padding(.bottom)
            
            FormQuestions(formText: "Question", textFieldLabel: "Enter your question", bindingText: $question)
            
            FormQuestions(formText: "Answer", textFieldLabel: "Enter the answer", bindingText: $answer)
            
            Button(action: addCard){
                Text("Add card")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
            )
            .buttonStyle(PlainButtonStyle())
            Spacer()
        }
        .padding(EdgeInsets(top: 80, leading: 40, bottom: 0, trailing: 40))
    }
    private func addCard() {
        let card = Card(question: question, answer: answer)
        cardListViewModel.addCard(card)
        //dismiss the view once the card is added
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewCardForm_Previews: PreviewProvider {
    static var previews: some View {
        NewCardForm(cardListViewModel: CardListViewModel())
    }
}
