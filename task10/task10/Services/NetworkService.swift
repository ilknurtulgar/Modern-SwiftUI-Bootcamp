//
//  NetworkService.swift
//  task10
//
//  Created by İlknur Tulgar on 27.09.2025.
//

import Foundation

struct NetworkService{
    
    func fetchCharacters(page: Int = 1) async throws -> [Charachter] {
        let urlString = "https://rickandmortyapi.com/api/character?page=\(page)"
        guard let url = URL(string: urlString)else{
            throw URLError(.badURL)
        }
        
        let (data,_) = try await URLSession.shared.data(from: url)
        
        let decodedResponse = try JSONDecoder().decode(CharachterResponse.self, from: data)
        return decodedResponse.results
    }
}
