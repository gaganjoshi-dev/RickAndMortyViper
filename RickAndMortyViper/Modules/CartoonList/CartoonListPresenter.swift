//
//  CartoonListPresenter.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-21.
//
import Foundation

protocol CartoonListPresenterProtocol {
    func viewDidLoad()
    func didSelectCartoon(_ cartoon: Cartoon)
}

// view -> presenter -> Interacrtor (business logic) -> Entity
//         -> Router
//get all cartoon // abc // All cartoon -> 100 -> 20 - currentmodule interactor -> parent interactor -> 20
class CartoonListPresenter: CartoonListPresenterProtocol {
    weak var view: CartoonListViewProtocol?
    var interactor: CartoonListInteractorProtocol?
    var router: CartoonListRouterProtocol?

    private var cartoons: [Cartoon] = []

    func viewDidLoad() {
        interactor?.fetchCartoons()
    }

    func didSelectCartoon(_ cartoon: Cartoon) {
        if let view {
            router?.navigateToCartoonDetail(from: view, with: cartoon)
        }
    }
}

extension CartoonListPresenter : CartoonInteractorOutputProtocol {
    func cartoonsFetched(_ cartoons: [Cartoon]) {
        self.cartoons = cartoons
        DispatchQueue.main.async {
            self.view?.showCartoons(cartoons)
        }
    }

    func cartoonsFetchFailed(_ message: String) {
        DispatchQueue.main.async {
            self.view?.showError(message)
        }
    }
}
