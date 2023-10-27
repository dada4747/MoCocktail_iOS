//
//  MCOutlineButton.swift
//  MoCocktail
//
//  Created by Admin on 10/08/22.
//

import UIKit

class MCOutlineButton: UIButton {
    
    // MARK: - Default initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom initializer for button
    init(titleColor: UIColor, title: String, font: UIFont) {
        super.init(frame: .zero)
        
        self.setTitleColor(titleColor, for: .normal)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.layer.borderColor = titleColor.cgColor
        configure()
    }
    
    // MARK: - Configure GFButton
    private func configure() {
        layer.cornerRadius      = 10
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 1
        backgroundColor = .white
        
    }
    
    // MARK: - Custom initializer for background button
    func set(titleColor: UIColor, title: String, font: UIFont) {
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = font
        layer.borderColor = titleColor.cgColor
        
    }
    func setFill(titleColor: UIColor, backgroundColor: UIColor){
        setTitleColor(titleColor, for: .normal)
        layer.borderColor = titleColor.cgColor
        self.backgroundColor = backgroundColor
    }
}
