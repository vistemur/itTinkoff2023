//
//  TuiCard.swift
//  itTinkof2023App
//
//  Created by Roman Pozdnyakov on 22.04.2023.
//

import UIKit

class TuiCard: UIView {
    
    // MARK: - properties
    
    private var buttonAction: ((UIButton) -> Void)?
    private var imagePositoin: TuiCardData.ImagePositoin?
    
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
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .tuiGray51
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var subheaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .tuiGray146
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var tuiButton: TuiButton = {
        let button = TuiButton()
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(buttonPressedAction(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Constraints
    
    private lazy var starImageViewLeadingConstraint = starImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
    private lazy var starImageViewTrailingConstraint = starImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
    private lazy var textStackViewLeadingTostarImageViewConstraint = textStackView.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor
                                                                                                            , constant: 16)
    private lazy var textStackViewLeadingToViewConstraint = textStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
    private lazy var textStackViewTrailngTostarImageViewConstraint = textStackView.trailingAnchor.constraint(equalTo: starImageView.leadingAnchor, constant: -16)
    private lazy var textStackViewTrailngToViewConstraint = textStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)

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
        backgroundColor = .tuiWhite
        layer.cornerRadius = 24
        clipsToBounds = true
    }
    
    private func setupStarImageView() {
        addSubview(starImageView)
        NSLayoutConstraint.activate([
            starImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            starImageViewTrailingConstraint,
            starImageView.widthAnchor.constraint(equalToConstant: 40),
            starImageView.heightAnchor.constraint(equalToConstant: 40),
            starImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16),
        ])
    }
    
    private func setupTextStackView() {
        textStackView.addArrangedSubview(headerLabel)
        addSubview(textStackView)
        NSLayoutConstraint.activate([
            textStackView.centerYAnchor.constraint(equalTo: starImageView.centerYAnchor),
            textStackViewLeadingToViewConstraint,
            textStackViewTrailngTostarImageViewConstraint,
            textStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -18),
        ])
    }
        
    private func setupTuiButton() {
        addSubview(tuiButton)
        NSLayoutConstraint.activate([
            tuiButton.topAnchor.constraint(equalTo: textStackView.bottomAnchor, constant: 14),
            tuiButton.topAnchor.constraint(greaterThanOrEqualTo: starImageView.bottomAnchor, constant: 16),
            tuiButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tuiButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tuiButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            tuiButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    // MARK: - actions
    
    @objc private func buttonPressedAction(_ sender: UIButton) {
        buttonAction?(sender)
    }
    
    // MARK: - setup with data
    
    func setup(with data: TuiCardData) {
        clearSubviews()
        backgroundColor = data.color.value
        
        self.imagePositoin = data.imagePositoin
        switch data.imagePositoin {
        case .right:
            setupRightImagePosition()
        case .left:
            setupLeftImagePosition()
        }
        headerLabel.text = data.header
        if let subheaderText = data.subheader {
            subheaderLabel.text = subheaderText
            textStackView.addArrangedSubview(subheaderLabel)
        }
        if let buttonAction = data.buttonAction {
            self.buttonAction = buttonAction
            setupTuiButton()
        }
        tuiButton.setTitle(data.buttonTitle, for: .normal)
    }
    
    private func setupRightImagePosition() {
        starImageViewLeadingConstraint.isActive = false
        textStackViewLeadingTostarImageViewConstraint.isActive = false
        textStackViewTrailngToViewConstraint.isActive = false
        
        starImageViewTrailingConstraint.isActive = true
        textStackViewLeadingToViewConstraint.isActive = true
        textStackViewTrailngTostarImageViewConstraint.isActive = true
    }
    
    private func setupLeftImagePosition() {
        starImageViewTrailingConstraint.isActive = false
        textStackViewLeadingToViewConstraint.isActive = false
        textStackViewTrailngTostarImageViewConstraint.isActive = false
        
        starImageViewLeadingConstraint.isActive = true
        textStackViewLeadingTostarImageViewConstraint.isActive = true
        textStackViewTrailngToViewConstraint.isActive = true
    }
    
    private func clearSubviews() {
        tuiButton.removeFromSuperview()
        textStackView.removeArrangedSubview(subheaderLabel)
        subheaderLabel.removeFromSuperview()
    }
}

struct TuiCardData {
    let header: String
    let subheader: String?
    let imagePositoin: ImagePositoin
    let color: Color
    let buttonTitle: String?
    let buttonAction: ((UIButton) -> Void)?
    
    enum ImagePositoin {
        case left
        case right
    }
    
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
