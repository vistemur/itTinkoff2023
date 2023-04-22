//
//  TuiTitleCard.swift
//  itTinkof2023App
//
//  Created by Roman Pozdnyakov on 22.04.2023.
//

import UIKit

class TuiTitleCard: UIView {
    
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
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.close, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 12,
                                                left: 12,
                                                bottom: 12,
                                                right: 12)
        button.addTarget(self, action: #selector(closeButtonPressed(_:)), for: .touchUpInside)
        return button
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
        setupCloseButton()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .tuiWhite
        layer.cornerRadius = 24
        clipsToBounds = true
    }
    
    private func setupStarImageView() {
        addSubview(starImageView)
        NSLayoutConstraint.activate([
            starImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            starImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            starImageView.widthAnchor.constraint(equalToConstant: 40),
            starImageView.heightAnchor.constraint(equalToConstant: 40),
            starImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16),
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
            textStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -18),
        ])
    }
    
    private func setupCloseButton() {
        addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 48),
            closeButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    // MARK: - actions
    
    @objc private func closeButtonPressed(_ sender: UIButton) {
        closeButtonAction?(sender)
    }
    
    // MARK: - setup with data
    
    func setup(with data: TuiTitleCardData) {
        backgroundColor = data.color.value
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        closeButtonAction = data.closeButtonAction
        closeButton.isHidden = data.closeButtonAction == nil
    }
}

struct TuiTitleCardData {
    let title: String
    let description: String
    let color: Color
    let closeButtonAction: ((UIButton) -> Void)?
    
    enum Color {
        case white
        case light
        
        var value: UIColor {
            switch self {
            case .white:
                return .tuiWhite
            case .light:
                return .tuiWhite248
            }
        }
    }
}
