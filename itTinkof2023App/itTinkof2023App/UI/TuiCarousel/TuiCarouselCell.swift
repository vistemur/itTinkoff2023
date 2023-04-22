//
//  TuiCarouselCell.swift
//  itTinkof2023App
//
//  Created by Roman Pozdnyakov on 22.04.2023.
//

import UIKit

class TuiCarouselCell: UICollectionViewCell {
    static let id = "TuiCarouselCell"
    
    // MARK: - UI properties
    
    private lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .star
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .tuiGray51
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .tuiGray51
        label.numberOfLines = 1
        label.textAlignment = .left
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
        setupTitleLabel()
        setupSubtitleLabel()
    }
    
    private func setupView() {
        backgroundColor = .tuiGray3
        layer.cornerRadius = 12
    }
    
    private func setupStarImageView() {
        contentView.addSubview(starImageView)
        NSLayoutConstraint.activate([
            starImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            starImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            starImageView.widthAnchor.constraint(equalToConstant: 40),
            starImageView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
        ])
    }
    
    private func setupSubtitleLabel() {
        contentView.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    
    // MARK: - setup with data
    
    func setup(with data: TuiCarouselCellData) {
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
    }
}

struct TuiCarouselCellData {
    let title: String
    let subtitle: String
}
