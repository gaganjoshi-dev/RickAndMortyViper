//
//  CartoonDetailInteractor.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-22.
//

protocol CartoonDetailInteractorOutputProtocol: AnyObject {
    func cartoonDetailFetched(_ cartoons: CartoonDetail)
    func cartoonDetailFetchFailed(_ message: String)
}

class CartoonDetailInteractor: CartoonDetailInteractorProtocol {
    var presenter: CartoonDetailPresenter?
    var cartoonID: Int?
    
    weak var output: CartoonDetailInteractorOutputProtocol?
    
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient(), cartoonID: Int? = nil) {
        self.apiClient = apiClient
        self.cartoonID = cartoonID
    }

    func fetchCartoonDetail() {
        Task {
            do {
                guard let cartoonID else {
                    return
                }
                let cartoon = try await apiClient.fetchCartoonDetail(id: cartoonID)
                output?.cartoonDetailFetched(cartoon)
            } catch {
                output?.cartoonDetailFetchFailed(error.localizedDescription)
            }
        }
    }
}
