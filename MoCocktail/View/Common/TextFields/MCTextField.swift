//
//  MCTextField.swift
//  MoCocktail
//
//  Created by Admin on 20/08/22.
//

import UIKit

class MCTextField: UITextField {
    // MARK: - Default Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure GFTextField
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        borderStyle  = .none
        textColor    = AppColors.appBlack
        font         = AppFonts.smallRegular
        tintColor    = AppColors.appBlack
        keyboardAppearance = .dark
        tintColor = AppColors.appGray2
    }
    
}
