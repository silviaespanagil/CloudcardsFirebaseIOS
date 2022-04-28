//
//  CardListView.swift
//  Cloudcards
//
//  Created by Silvia España on 1/4/22.
//

import SwiftUI

struct CardListView: View {
    
    @ObservedObject var viewModel: CardListViewModel
    
    @State var showForm = false
    @State var showLoginView = false
    
    var body: some View {
        
        VStack {
            
            ScrollView(showsIndicators: false) {
                
                ForEach(viewModel.cardViewModels) { cardViewModel in
                    
                    CardView(viewModel: cardViewModel)
                        .padding([.vertical])
                }
                Spacer()
            }
        }
        .sheet(isPresented: $showForm) {
            NewCardForm(cardListViewModel: CardListViewModel())
        }
        .fullScreenCover(isPresented: $showLoginView) {
            LoginView(cardListViewModel: CardListViewModel())
        }
        .onAppear {
            showLoginView = viewModel.user == nil ? true : false
        }
        .onChange(of: viewModel.user) { user in
            showLoginView = user == nil ? true : false
        }
        .navigationTitle("Study cards")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button {
                    
                    showForm.toggle()
                } label: {
                    
                    Image(systemName: "plus")
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                
                Menu {
                    
                    if let email = viewModel.user?.email {
                        Text(email)
                        
                        Button("Sign Out", action: AuthenticationService.signOutUser)
                    }
                }
            label: {
                
                Image(systemName: "person.fill")
            }
            }
        }
    }
}


struct CardListView_Previews: PreviewProvider {
    
    static var previews: some View {
        CardListView(viewModel: CardListViewModel())
    }
}
