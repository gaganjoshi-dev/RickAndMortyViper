//
//  CartoonDetailRouter.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-22.
//

import UIKit

class CartoonDetailRouter: CartoonDetailRouterProtocol {
    static func createModule(with cartoonID: Int) -> UIViewController {
        let view = CartoonDetailViewController()
        let presenter = CartoonDetailPresenter()
        let interactor = CartoonDetailInteractor()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.cartoonID = cartoonID

        return view
    }
}
