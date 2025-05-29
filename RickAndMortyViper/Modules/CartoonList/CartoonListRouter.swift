//
//  CartoonListRouter.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-21.
//

import UIKit

protocol CartoonListRouterProtocol {
    func navigateToCartoonDetail(from view: CartoonListViewProtocol, with cartoon: Cartoon)
}

class CartoonListRouter: CartoonListRouterProtocol {
    weak var viewController: UIViewController?

    func navigateToCartoonDetail(from view: CartoonListViewProtocol, with cartoon: Cartoon) {
        var cartoonDetailBuilder = CartoonDetailBuilder()
        cartoonDetailBuilder = cartoonDetailBuilder.setInteractor(CartoonDetailInteractor(cartoonID: cartoon.id))
        let detailVC = cartoonDetailBuilder.build()
        if let sourceVC = view as? UIViewController {
            sourceVC.navigationController?.pushViewController(detailVC, animated: true)
            
        }
    }
}
