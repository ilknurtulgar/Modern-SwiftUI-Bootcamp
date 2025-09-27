//
//  MainViewModel.swift
//  task10
//
//  Created by İlknur Tulgar on 26.09.2025.
//

import SwiftUI
import CoreData

@MainActor
class MainViewModel: ObservableObject {
    @Published var characters: [CharacterEntity] = []
    @Published var isLoading = false
    @Published var errorMsg: String?
    
    private let service = NetworkService()
    private let viewContext: NSManagedObjectContext
    
    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
        fetchCharactersCoreData()
    }
    
    func fetchCharactersCoreData() {
        let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
        do{
            characters = try viewContext.fetch(request)
        }catch{
            errorMsg = error.localizedDescription
        }
    }
    
    
    func fetchCharactersFromAPI() async{
        isLoading = true
        defer {isLoading = false}
        
        do{
            let fetchedCharacters = try await service.fetchCharacters()
            for char in fetchedCharacters{
                let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
                request.predicate = NSPredicate(format: "id == %d", char.id)
                
                let existing = try viewContext.fetch(request).first
                let characterEntities = existing ?? CharacterEntity(context: viewContext)
                
                characterEntities.id = Int64(char.id)
                characterEntities.name = char.name
                characterEntities.status = char.status
                characterEntities.species = char.species
                characterEntities.gender = char.gender
                characterEntities.image = char.image
                characterEntities.originName = char.origin.name
                characterEntities.locationName = char.location.name
            }
            try viewContext.save()
            fetchCharactersCoreData()
            errorMsg = nil
        }catch{
            errorMsg = error.localizedDescription
        }
    }
}
