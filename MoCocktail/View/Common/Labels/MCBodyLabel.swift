//
//  MCBodyLabel.swift
//  MoCocktail
//
//  Created by Admin on 15/08/22.
//

import UIKit

class MCBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(font: UIFont, textAlignment: NSTextAlignment, text: String) {
        super.init(frame: .zero)
        self.textAlignment          = textAlignment
        self.font                   = font
        self.text                   = text

        configure()
    }
    private func configure(){
        textColor                   = AppColors.appBlack
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.9
        numberOfLines               = 0
        lineBreakMode               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
