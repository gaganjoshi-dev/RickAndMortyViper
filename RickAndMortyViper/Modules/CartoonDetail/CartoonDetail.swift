//
//  CartoonDetail.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-22.
//


// MARK: - CartoonDetail
struct CartoonDetail: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let image: String
    let url: String
    let created: String
}
