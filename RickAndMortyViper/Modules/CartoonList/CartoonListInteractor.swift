//
//  CartoonInteractor.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-21.
//

protocol CartoonListInteractorProtocol {
    func fetchCartoons()
}

protocol CartoonInteractorOutputProtocol: AnyObject {
    func cartoonsFetched(_ cartoons: [Cartoon])
    func cartoonsFetchFailed(_ message: String)
}


class CartoonListInteractor: CartoonListInteractorProtocol {
    weak var output: CartoonInteractorOutputProtocol?

    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    
    func fetchCartoons() {
        Task {
            do {
                let cartoons = try await apiClient.fetchCharacters(page: 1)
                output?.cartoonsFetched(cartoons)
            } catch {
                output?.cartoonsFetchFailed(error.localizedDescription)
            }
        }
    }
}


