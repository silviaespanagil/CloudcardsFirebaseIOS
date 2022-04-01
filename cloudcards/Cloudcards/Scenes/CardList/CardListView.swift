//
//  CardListView.swift
//  Cloudcards
//
//  Created by Silvia España on 1/4/22.
//

import SwiftUI

struct CardListView: View {
    
    @ObservedObject var viewModel: CardListViewModel

    var body: some View {

                    VStack {
                        
                        ForEach(viewModel.cardViewModels) { cardViewModel in
                            CardView(viewModel: cardViewModel)
                                .padding([.vertical])
                        
                            Spacer()
                        }
                    }
            .navigationTitle("Tolkien trivia")
            .navigationBarTitleDisplayMode(.inline)

    }
}

struct CardListView_Previews: PreviewProvider {
    
    static var previews: some View {
        CardListView(viewModel: CardListViewModel())
    }
}
