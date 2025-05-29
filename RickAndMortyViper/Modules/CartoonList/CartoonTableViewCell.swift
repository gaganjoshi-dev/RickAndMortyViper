//
//  CartoonTableViewCell.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-22.
//


import UIKit



class CartoonTableViewCell: UITableViewCell {
    static let identifier = "CartoonTableViewCell"
    private var downloadTask: URLSessionDataTask?
    
    private let placeholderImage = UIImage.init(systemName: "person")
    
    /// This contains cartoon Image downloaded from server
    private let cartoonImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        return iv
    }()
    
    /// This contains nameLabel amd descriptionLabel
    private let labelsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    /// This contains cartoonImageView and labelsStackView
    private let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //This is cartoon Name
    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //This is cartoon decprition
    private let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14)
        lbl.textColor = .gray
        lbl.numberOfLines = 2
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(mainStackView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        downloadTask?.cancel()
        downloadTask = nil
        
    }
    
    private func setupConstraints() {
        labelsStackView.addArrangedSubview(nameLabel)
        labelsStackView.addArrangedSubview(descriptionLabel)
        mainStackView.addArrangedSubview(cartoonImageView)
        mainStackView.addArrangedSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cartoonImageView.heightAnchor.constraint(equalToConstant: 60),
            cartoonImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configure(with cartoon: Cartoon) {
        nameLabel.text = cartoon.name
        descriptionLabel.text = cartoon.species
        
        guard let url = URL(string: cartoon.image) else { return }
        
        cartoonImageView.loadImage(
            from: url,
            placeholder: placeholderImage,
            cache: ImageCache.shared
        )
       
    }
}
