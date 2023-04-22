//
//  TuiCardStack.swift
//  itTinkof2023App
//
//  Created by Roman Pozdnyakov on 22.04.2023.
//

import UIKit

class TuiCardStack: UIView {
    
    // MARK: - properties
    
    private var headerButtonAction: ((UIButton) -> Void)?
    private var bottomButtonAction: ((UIButton) -> Void)?
    
    // MARK: - UI properties
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .tuiGray51
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var headerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.tuiBlue249, for: .normal)
        button.addTarget(self, action: #selector(headerButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var bottomButton: UIButton = {
        let button = TuiButton()
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(buttonPressedAction(_:)), for: .touchUpInside)
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
        setupHeaderLabel()
        setupHeaderButton()
        setupStackView()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .tuiWhite
        layer.cornerRadius = 24
        clipsToBounds = true
    }
    
    private func setupHeaderLabel() {
        addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    private func setupHeaderButton() {
        addSubview(headerButton)
        headerButton.setContentHuggingPriority(.required, for: .horizontal)
        headerButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        NSLayoutConstraint.activate([
            headerButton.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            headerButton.leadingAnchor.constraint(equalTo: headerLabel.trailingAnchor, constant: 16),
            headerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    private func setupStackView() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20),
        ])
    }
    
    private func setupBottomButton() {
        addSubview(bottomButton)
        NSLayoutConstraint.activate([
            bottomButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            bottomButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bottomButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            bottomButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            bottomButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    // MARK: - actions
    
    @objc private func headerButtonPressed(_ sender: UIButton) {
        headerButtonAction?(sender)
    }
    
    @objc private func buttonPressedAction(_ sender: UIButton) {
        bottomButtonAction?(sender)
    }
    
    // MARK: - setup with data
    
    func setup(with data: TuiCardStackData) {
        backgroundColor = data.color.value
        headerLabel.text = data.header
        headerButton.setTitle(data.headerButton, for: .normal)
        
        for cardData in data.cards {
            let cardView = getCardView(from: cardData)
            stackView.addArrangedSubview(cardView)
        }
        
        headerButtonAction = data.headerButtonAction
        bottomButtonAction = data.bottomButtonAction
        bottomButton.removeFromSuperview()
        if bottomButtonAction != nil {
            setupBottomButton()
        }
        bottomButton.setTitle(data.bottomButtonTitle, for: .normal)
    }
    
    private func getCardView(from data: TuiCardStackData.Card) -> UIView {
        let tuiTitleCard = TuiTitleSlimCard()
        tuiTitleCard.setup(with: TuiTitleSlimCardData(title: data.title,
                                                      description: data.description))
        return tuiTitleCard
    }
}

struct TuiCardStackData {
    let header: String
    let headerButton: String
    let color: Color
    let cards: [Card]
    let bottomButtonTitle: String?
    let headerButtonAction: ((UIButton) -> Void)?
    let bottomButtonAction: ((UIButton) -> Void)?
    
    struct Card {
        let title: String
        let description: String
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
