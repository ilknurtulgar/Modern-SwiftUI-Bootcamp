//
//  FavoriteView.swift
//  task10
//
//  Created by İlknur Tulgar on 27.09.2025.
//

import SwiftUI

struct FavoriteView: View {
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CharacterEntity.name,ascending: true)],
        predicate: NSPredicate(format: "isFavorite == %@", NSNumber(value: true)),
        animation: .default
    )private var favorites: FetchedResults<CharacterEntity>
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack{
            
            if favorites.isEmpty {
                Text("No favorites yet ❤️")
                    .foregroundColor(.gray)
            }else{
                List{
                    ForEach(favorites,id: \.id){character in
                        CharacterRowView(character: character)
                    }
                }
            }
        }
    }
}

#Preview {
    FavoriteView()
}
