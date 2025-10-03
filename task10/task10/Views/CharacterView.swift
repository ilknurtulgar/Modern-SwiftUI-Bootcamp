//
//  CharacterView.swift
//  task10
//
//  Created by İlknur Tulgar on 26.09.2025.
//

import SwiftUI
import CoreData

struct CharacterView: View {
    @StateObject private var viewModel = MainViewModel(viewContext: PersistenceController.shared.container.viewContext)
    @Environment(\.managedObjectContext) private var viewContext
    
   
    var body: some View {
        NavigationView{
            if viewModel.isLoading {
                ProgressView("Loading...")
            }else if let error = viewModel.errorMsg{
                Text("Error: \(error)")
                    .foregroundColor(.red)
                
            }else if viewModel.characters.isEmpty{
                Text("no characters found")
                    .foregroundColor(.gray)
            } else {
                List{
                    ForEach(viewModel.characters,id: \.self){character in
                        NavigationLink(destination: CharacterDetailView(character: character)){
                            CharacterRowView(character: character)
            }
                    }
                }
                .listStyle(.plain)
                .refreshable {
                    await viewModel.fetchCharactersFromAPI()
                }
                .navigationTitle("Characters")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination: FavoriteView()){
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color.gray.opacity(0.5))
                        }
                    }
                }
            }
        }
        
        .task {
            await viewModel.fetchCharactersFromAPI()
        }
    }
}

#Preview {
    CharacterView()
}
