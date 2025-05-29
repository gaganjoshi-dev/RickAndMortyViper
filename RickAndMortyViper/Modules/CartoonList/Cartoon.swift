//
//  Cartoon.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-21.
//

struct CartoonResponse: Codable {
    let results: [Cartoon]
}

struct Cartoon: Codable {
    let id: Int
    let name: String
    let image: String
    let species: String
}
