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
    
    private var cancellables: Set<AnyCancellable> = []
    var id = ""
    
    init(card: Card) {
        
        self.card = card
        
        $card
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
