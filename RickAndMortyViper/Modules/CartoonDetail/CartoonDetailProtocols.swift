//
//  CartoonDetailViewProtocol.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-22.
//
import UIKit

protocol CartoonDetailViewProtocol: AnyObject {
    func showCartoonDetail(_ cartoon: CartoonDetail)
    func showError(_ message: String)
}

protocol CartoonDetailPresenterProtocol {
    func viewDidLoad()
}

protocol CartoonDetailInteractorProtocol {
    func fetchCartoonDetail()
}

protocol CartoonDetailRouterProtocol {
    
}
