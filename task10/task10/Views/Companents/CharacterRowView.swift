//
//  CharacterRowView.swift
//  task10
//
//  Created by İlknur Tulgar on 3.10.2025.
//

import SwiftUI

struct CharacterRowView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var character: CharacterEntity
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: character.image ?? "")){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            
            VStack(alignment: .leading) {
                Text(character.name ?? "Unknown")
                    .font(.headline)
                
                Text(character.species ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(character.status ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
//            Button(action: {
//                print("patladim")
//                character.isFavorite.toggle()
//                
//                do {
//                      try viewContext.save()
//                      print("Saved favorite")
//                  } catch {
//                      print("Failed to save: \(error)")
//                  }
//            }) {
//                Image(systemName: character.isFavorite ? "heart.fill" : "heart")
//                    .foregroundColor(character.isFavorite ? .red : .gray)
//            }
        }
        .padding(.vertical,5)
    }
}

//#Preview {
//    let context = PersistenceController.preview.container.viewContext
//    
//   
//    let previewCharacter: CharacterEntity = {
//        let character = CharacterEntity(context: context)
//        character.name = "Rick Sanchez"
//        character.species = "Human"
//        character.status = "Alive"
//        character.image = "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
//        character.isFavorite = true
//        return character
//    }()
//    
//    
//    CharacterRowView(character: previewCharacter)
//        .environment(\.managedObjectContext, context)
//}
//
