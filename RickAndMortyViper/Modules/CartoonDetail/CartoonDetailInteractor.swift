//
//  CartoonDetailInteractor.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-22.
//


class CartoonDetailInteractor: CartoonDetailInteractorProtocol {
    var presenter: CartoonDetailPresenter?
    var cartoonID: Int!

    func fetchCartoonDetail() {
        Task {
            do {
                let cartoon = try await APIClient().fetchCartoonDetail(id: cartoonID)
                presenter?.cartoonDetailFetched(cartoon)
            } catch {
                presenter?.cartoonDetailFetchFailed(error.localizedDescription)
            }
        }
    }
}
