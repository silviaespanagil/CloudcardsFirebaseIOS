//
//  Cards.swift
//  Cloudcards
//
//  Created by Silvia España on 31/3/22.
//

import FirebaseFirestoreSwift
import Foundation

struct Card: Identifiable, Codable {
    
    @DocumentID var id: String?
    var question: String
    var answer: String
    var userId: String?
    var successful = true
}
