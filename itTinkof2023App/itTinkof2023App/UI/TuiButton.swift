//
//  TuiButton.swift
//  itTinkof2023App
//
//  Created by Roman Pozdnyakov on 22.04.2023.
//

import UIKit

class TuiButton: UIButton {
    
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
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.tuiBlue249, for: .normal)
        backgroundColor = .tuiGray3
        layer.cornerRadius = 12
        setupActions()
    }
    
    private func setupActions() {
        addTarget(self, action: #selector(touchStarted), for: .touchDown)
        addTarget(self, action: #selector(touchStarted), for: .touchDragEnter)
        addTarget(self, action: #selector(touchEnded), for: .touchUpInside)
        addTarget(self, action: #selector(touchEnded), for: .touchDragExit)
    }
    
    // MARK: - Actions
    
    @objc private func touchStarted() {
        backgroundColor = .tuiGray6
    }
    
    @objc private func touchEnded() {
        backgroundColor = .tuiGray3
    }
}
