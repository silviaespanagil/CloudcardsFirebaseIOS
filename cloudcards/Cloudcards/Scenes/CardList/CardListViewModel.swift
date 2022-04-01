//
//  CardListViewModel.swift
//  Cloudcards
//
//  Created by Silvia España on 31/3/22.
//

import Foundation
import Combine

class CardListViewModel: ObservableObject {
    
    @Published var cardViewModels: [CardViewModel] = []
    @Published var cardRepository = CardRepository()
    
    init() {
        cardRepository.$cards.map { cards in
            
            cards.map { card in
                
                CardViewModel(card: card)
            }
        }.assign(to: &$cardViewModels)
    }
    func addCard(_ card: Card) {
        
        cardRepository.add(card)
    }
}
    
