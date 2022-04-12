//
//  CardViewModel.swift
//  Cloudcards
//
//  Created by Silvia España on 31/3/22.
//

import Foundation
import Combine

class CardViewModel: ObservableObject, Identifiable {
    
    @Published var card: Card
    @Published var showContent = false
    @Published var deleteCard = false
    @Published var showAlert = false
    
    private var cardRepository: CardRepository
    private var cancellables: Set<AnyCancellable> = []
    var id = ""
    
    init(card: Card, cardRepository: CardRepository) {
        
        self.card = card
        self.cardRepository = cardRepository
        
        $card
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
    func update(card: Card) {
        
        cardRepository.updateCard(card)
    }
    
    func success(_ successful: Bool) {
        
        var updatedCard = card
        
        updatedCard.successful = successful
        update(card: updatedCard)
        showContent.toggle()
    }
    
    func remove() {
        
        cardRepository.remove(card)
    }
}
