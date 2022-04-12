//
//  CardRepository.swift
//  Cloudcards
//
//  Created by Silvia España on 31/3/22.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class CardRepository: ObservableObject {
    
    private let store = Firestore.firestore()
    private let path = "cards"
    @Published var cards: [Card] = []
    
    init() {
        
        getCards()
    }
    
    func getCards() {
        
        store.collection(path)
            .addSnapshotListener { querySnapshot, error in
                
                if let error = error {
                    
                    print("Error getting cards: \(error.localizedDescription)")
                    return
                }
                
                self.cards = querySnapshot?.documents.compactMap { document in
                    
                    try? document.data(as: Card.self)
                } ?? []
            }
    }
    
    func add(_ card: Card) {
        
        do {
            
            _ = try store.collection(path).addDocument(from: card).setData(from: card)
        } catch {
            fatalError("Unable to add card: \(error.localizedDescription)")
        }
    }
    
    func updateCard(_ card: Card) {
        
        guard let cardId = card.id else { return }
        
        do {
            
            try store.collection(path).document(cardId).setData(from: card)
        } catch {
            
            fatalError("Unable to add card: \(error.localizedDescription)")
        }
    }
    
    func remove(_ card: Card) {
        
        guard let cardId = card.id else { return }
        store.collection(path).document(cardId).delete() { error in
            if let error = error {
                
                print("Unable to remove card: \(error.localizedDescription)")
            }
        }
    }
}
