//
//  CartoonRepositoryProtocol.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-31.
//


protocol CartoonRepositoryProtocol {
    func fetchCartoons() async throws -> [Cartoon]
}

class LocalCartoonRepository: CartoonRepositoryProtocol {
    func fetchCartoons() async throws -> [Cartoon] {
        return CoreDataManager.shared.fetchCartoons()
    }
}

class RemoteCartoonRepository: CartoonRepositoryProtocol {
    private let apiClient: APIClientProtocol
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchCartoons() async throws -> [Cartoon] {
        let cartoons = try await apiClient.fetchCharacters(page: 1)
        CoreDataManager.shared.saveCartoons(cartoons)
        return cartoons
    }
}
