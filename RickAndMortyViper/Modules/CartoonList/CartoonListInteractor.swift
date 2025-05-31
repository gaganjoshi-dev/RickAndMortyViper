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
    private let cartoonRepository: CartoonRepositoryProtocol
    
    init(cartoonRepository: CartoonRepositoryProtocol = RemoteCartoonRepository()) {
        self.cartoonRepository = cartoonRepository
    }
    
    
    func fetchCartoons() {
        Task {
            do {
                let cartoons = try await cartoonRepository.fetchCartoons()
                output?.cartoonsFetched(cartoons)
            } catch {
                output?.cartoonsFetchFailed(error.localizedDescription)
            }
        }
    }
    
}




