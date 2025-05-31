//
//  CartoonListBuilder.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-29.
//
import UIKit

class CartoonListBuilder {
    private var view: CartoonListViewController?
    private var interactor: CartoonListInteractor?
    private var presenter: CartoonListPresenter?
    private var router: CartoonListRouter?
    private var apiClient: APIClientProtocol?

    // MARK: - Setters
    func setView(_ view: CartoonListViewController) -> Self {
        self.view = view
        return self
    }

    func setInteractor(_ interactor: CartoonListInteractor) -> Self {
        self.interactor = interactor
        return self
    }

    func setPresenter(_ presenter: CartoonListPresenter) -> Self {
        self.presenter = presenter
        return self
    }

    func setRouter(_ router: CartoonListRouter) -> Self {
        self.router = router
        return self
    }

    func setAPIClient(_ client: APIClientProtocol) -> Self {
        self.apiClient = client
        return self
    }

    // MARK: - Build
    func build() -> UIViewController {
        // Create defaults if not set
        let view = self.view ?? CartoonListViewController()
        let apiClient = self.apiClient ?? APIClient()
        
        let isOnline = NetworkChecker.isConnected()

        let repository: CartoonRepositoryProtocol = isOnline
            ? RemoteCartoonRepository(apiClient: apiClient)
            : LocalCartoonRepository()
        let interactor = self.interactor ?? CartoonListInteractor(cartoonRepository: repository)
        
        let presenter = self.presenter ?? CartoonListPresenter()
        let router = self.router ?? CartoonListRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view

        return view
    }
}
