//
//  CartoonDetailBuilder.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-29.
//
import UIKit

class CartoonDetailBuilder {
    private var view: CartoonDetailViewController?
    private var interactor: CartoonDetailInteractor?
    private var presenter: CartoonDetailPresenter?
    private var router: CartoonDetailRouter?
    private var apiClient: APIClientProtocol?

    // MARK: - Setters
    func setView(_ view: CartoonDetailViewController) -> Self {
        self.view = view
        return self
    }

    func setInteractor(_ interactor: CartoonDetailInteractor) -> Self {
        self.interactor = interactor
        return self
    }

    func setPresenter(_ presenter: CartoonDetailPresenter) -> Self {
        self.presenter = presenter
        return self
    }

    func setRouter(_ router: CartoonDetailRouter) -> Self {
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
        let view = self.view ?? CartoonDetailViewController()
        let apiClient = self.apiClient ?? APIClient()
        let interactor = self.interactor ?? CartoonDetailInteractor(apiClient: apiClient)
        let presenter = self.presenter ?? CartoonDetailPresenter()
        let router = self.router ?? CartoonDetailRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
        router.viewController = view

        return view
    }
}
