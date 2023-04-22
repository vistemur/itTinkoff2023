//
//  TuiCarouselView.swift
//  itTinkof2023App
//
//  Created by Roman Pozdnyakov on 22.04.2023.
//

import UIKit

class TuiCarouselView: UIView {
    
    // MARK: - properties
    
    private var headerButtonAction: ((UIButton) -> Void)?
    private var bottomButtonAction: ((UIButton) -> Void)?
    private var cards = [TuiCarouselCellData]()
    
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
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TuiCarouselCell.self, forCellWithReuseIdentifier: TuiCarouselCell.id)
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 140, height: 140)
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 20,
                                           bottom: 0,
                                           right: 20)
        collectionView.collectionViewLayout = layout
        return collectionView
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
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 140),
        ])
    }
    
    private func setupBottomButton() {
        addSubview(bottomButton)
        NSLayoutConstraint.activate([
            bottomButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
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
    
    func setup(with data: TuiCarouselViewData) {
        cards = data.cards
        backgroundColor = data.color.value
        headerLabel.text = data.header
        headerButton.setTitle(data.headerButton, for: .normal)
        headerButtonAction = data.headerButtonAction
        bottomButtonAction = data.bottomButtonAction
        bottomButton.removeFromSuperview()
        if bottomButtonAction != nil {
            setupBottomButton()
        }
        bottomButton.setTitle(data.bottomButtonTitle, for: .normal)
        collectionView.reloadData()
    }
}

extension TuiCarouselView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TuiCarouselCell.id, for: indexPath) as! TuiCarouselCell
        cell.setup(with: cards[indexPath.row])
        return cell
    }
}

struct TuiCarouselViewData {
    let header: String
    let headerButton: String
    let color: Color
    let cards: [TuiCarouselCellData]
    let bottomButtonTitle: String?
    let headerButtonAction: ((UIButton) -> Void)?
    let bottomButtonAction: ((UIButton) -> Void)?
    
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

