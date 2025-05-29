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
