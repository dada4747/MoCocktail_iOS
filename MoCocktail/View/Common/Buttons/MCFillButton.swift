//
//  MCFillButton.swift
//  MoCocktail
//
//  Created by Admin on 10/08/22.
//

import UIKit

class MCFillButton: UIButton {
    
    // MARK: - Default initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom initializer for button
    init(backgroundColor: UIColor, title: String, font: UIFont) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        configure()
    }
    
    // MARK: - Configure GFButton
    private func configure() {
        layer.cornerRadius      = 10
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Custom initializer for background button
    func set(backgroundColor: UIColor, title: String, font: UIFont) {
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        titleLabel?.font = font
    }
}
