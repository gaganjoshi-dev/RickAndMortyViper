//
//  CartoonListViewController.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-21.
//

import UIKit

protocol CartoonListViewProtocol: AnyObject {
    func showCartoons(_ cartoons: [Cartoon])
    func showError(_ message: String)
}

class CartoonListViewController: UIViewController, CartoonListViewProtocol, UITableViewDataSource, UITableViewDelegate {
    
    var presenter: CartoonListPresenterProtocol?
    
    private var cartoons: [Cartoon] = []
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cartoons"
        setupTableView()
        presenter?.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CartoonTableViewCell.self, forCellReuseIdentifier: CartoonTableViewCell.identifier)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func showCartoons(_ cartoons: [Cartoon]) {
        self.cartoons = cartoons
        tableView.reloadData()
    }
    
    func showError(_ message: String) {
        print("Error: \(message)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartoons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartoon = cartoons[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartoonTableViewCell.identifier, for: indexPath) as? CartoonTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: cartoon)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cartoon = cartoons[indexPath.row]
        presenter?.didSelectCartoon(cartoon)
    }
}
