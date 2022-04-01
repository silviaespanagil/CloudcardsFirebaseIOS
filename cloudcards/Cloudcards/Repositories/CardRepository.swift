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
}
