//
//  CharacterDetailView.swift
//  task10
//
//  Created by İlknur Tulgar on 27.09.2025.
//

import SwiftUI

struct CharacterDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var character: CharacterEntity
    
    var body: some View {
        ScrollView{
            VStack(spacing: 15){
                AsyncImage(url: URL(string: character.image ?? "")){image in
                    image.resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .cornerRadius(15)
                }placeholder: {
                    ProgressView()
                        .frame(height: 300)
                }
                VStack(alignment: .leading,spacing: 8){
                    Text(character.name ?? "Unknown")
                        .font(.title)
                        .bold()
                    
                    HStack{
                        Text("Status: \(character.status ?? "Unknown")")
                        Text("Species: \(character.species ?? "Unknown")")
                    }
                    .font(.subheadline)
                    
                    Text("Gender: \(character.gender ?? "Unknown")")
                        .font(.subheadline)
                    
                    
                    Text("Origin: \(character.originName ?? "Unknown")")
                        .font(.subheadline)
                    
                    
                    Text("Location: \(character.locationName ?? "Unknown")")
                        .font(.subheadline)
                    
                    
                }
                .padding(.horizontal)
                Spacer()
            }
            .padding(.top)
        }
        .navigationTitle(character.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    character.isFavorite.toggle()
                    try? viewContext.save()
                }) {
                    Image(systemName: character.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(character.isFavorite ? .red : .gray)
                }
            }
        }
    }
}

#Preview {
    CharacterDetailView(character: CharacterEntity())
}
