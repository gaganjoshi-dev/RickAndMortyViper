//
//  APICleint.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-21.
//

import Foundation

protocol APIClientProtocol {
    func fetchCharacters(page: Int) async throws -> [Cartoon]
    func fetchCartoonDetail(id: Int) async throws -> CartoonDetail
}



class APIClient: APIClientProtocol {
    
    func fetchCharacters(page: Int) async throws -> [Cartoon] {
        let urlString = "https://rickandmortyapi.com/api/character/?page=\(page)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let decodedResponse = try JSONDecoder().decode(CartoonResponse.self, from: data)
        return decodedResponse.results.map {
            Cartoon(id: $0.id, name: $0.name, image: $0.image, species: $0.species)
        }
    }
    
    func fetchCartoonDetail(id: Int) async throws -> CartoonDetail {
        let urlString = "https://rickandmortyapi.com/api/character/\(id)" // replace with real URL
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(CartoonDetail.self, from: data)
    }
    
}


