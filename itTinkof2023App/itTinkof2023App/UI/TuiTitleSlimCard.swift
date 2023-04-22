//
//  TuiTitleSlimCard.swift
//  itTinkof2023App
//
//  Created by Roman Pozdnyakov on 22.04.2023.
//

import UIKit

class TuiTitleSlimCard: UIView {
    
    // MARK: - properties
    
    private var closeButtonAction: ((UIButton) -> Void)?
    
    // MARK: - UI properties
    
    private lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .star
        return imageView
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .tuiGray51
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .tuiGray146
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - setup
    
    private func setup() {
        setupView()
        setupStarImageView()
        setupTextStackView()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .none
        clipsToBounds = true
    }
    
    private func setupStarImageView() {
        addSubview(starImageView)
        NSLayoutConstraint.activate([
            starImageView.topAnchor.constraint(equalTo: topAnchor),
            starImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            starImageView.widthAnchor.constraint(equalToConstant: 40),
            starImageView.heightAnchor.constraint(equalToConstant: 40),
            starImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
        ])
    }
    
    private func setupTextStackView() {
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(descriptionLabel)
        addSubview(textStackView)
        NSLayoutConstraint.activate([
            textStackView.centerYAnchor.constraint(equalTo: starImageView.centerYAnchor),
            textStackView.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 16),
            textStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
        ])
    }
    
    // MARK: - actions
    
    @objc private func closeButtonPressed(_ sender: UIButton) {
        closeButtonAction?(sender)
    }
    
    // MARK: - setup with data
    
    func setup(with data: TuiTitleSlimCardData) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }
}

struct TuiTitleSlimCardData {
    let title: String
    let description: String
}
