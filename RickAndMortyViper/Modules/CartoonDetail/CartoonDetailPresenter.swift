//
//  CartoonDetailPresenter.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-22.
//

import Foundation

class CartoonDetailPresenter: CartoonDetailPresenterProtocol {
    weak var view: CartoonDetailViewProtocol?
    var interactor: CartoonDetailInteractorProtocol?

    func viewDidLoad() {
        interactor?.fetchCartoonDetail()
    }

   
}

extension CartoonDetailPresenter : CartoonDetailInteractorOutputProtocol {
    
    func cartoonDetailFetched(_ cartoon: CartoonDetail) {
        DispatchQueue.main.async {
            self.view?.showCartoonDetail(cartoon)
        }
    }

    func cartoonDetailFetchFailed(_ message: String) {
        DispatchQueue.main.async {
            self.view?.showError(message)
        }
    }
}
