//
//  CardListViewModel.swift
//  Cloudcards
//
//  Created by Silvia España on 31/3/22.
//

import Foundation
import Combine
import Firebase

class CardListViewModel: ObservableObject {
    
    @Published var cardViewModels: [CardViewModel] = []
    @Published var cardRepository: CardRepository
    @Published var user: User?
    
    private var cancellables: Set<AnyCancellable> = []
    
    let authenticationService = AuthenticationService()
    
    init() {
        
        cardRepository = CardRepository(authenticationService: authenticationService)
        
        authenticationService.$user
            .assign(to: \.user, on: self)
            .store(in: &cancellables)
        
        cardRepository.$cards.map { cards in
            
            cards.map { card in
                
                CardViewModel(card: card, cardRepository: self.cardRepository)
            }
        }.assign(to: &$cardViewModels)
    }
    func addCard(_ card: Card) {
        
        cardRepository.add(card)
    }
    
    func addStarterCards() {
        
        let cards = [
            Card(question: "This is an example card", answer: "This is the right answer. Self evaluate with the thumbs")
        ]
        
        cards.forEach { card in
            cardRepository.add(card)
        }
    }
}
    
