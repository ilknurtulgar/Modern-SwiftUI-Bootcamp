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
                    ForEach(viewModel.characters){character in
                        NavigationLink(destination: CharacterDetailView(character: character)){
                            HStack{
                               AsyncImage(url: URL(string: character.image ?? "")){image in
                                    image.resizable()
                                }placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                
                                VStack(alignment: .leading){
                                    Text(character.name ?? "Unknown")
                                        .font(.headline)
                                    Text(character.species ?? "")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text(character.status ?? "")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.vertical,5)
                        }
                    }
                }
                .listStyle(.plain)
                .refreshable {
                    await viewModel.fetchCharactersFromAPI()
                }
                .navigationTitle("Characters")
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
