//
//  CartoonListRouter.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-21.
//

import UIKit

protocol CartoonListRouterProtocol {
    func navigateToCartoonDetail(from view: CartoonListViewProtocol, with cartoon: Cartoon)
    static func createModule() -> UIViewController
}


class CartoonListRouter: CartoonListRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = CartoonListViewController()
        let presenter = CartoonListPresenter()
        let interactor = CartoonListInteractor(apiClient: APIClient())
        let router = CartoonListRouter()

        view.presenter = presenter
        presenter.view = view
        
        
        presenter.interactor = interactor
        interactor.output = presenter
        
        presenter.router = router
        
        
        router.viewController = view

        return view
    }

    func navigateToCartoonDetail(from view: CartoonListViewProtocol, with cartoon: Cartoon) {
        let detailVC = CartoonDetailRouter.createModule(with: cartoon.id)
        if let sourceVC = view as? UIViewController {
            sourceVC.navigationController?.pushViewController(detailVC, animated: true)
            
        }
    }
    
}
