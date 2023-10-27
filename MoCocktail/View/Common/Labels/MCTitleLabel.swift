//
//  MCTitleLabel.swift
//  MoCocktail
//
//  Created by Admin on 15/08/22.
//

import UIKit

class MCTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure(){
        textAlignment               = textAlignment
        font                        = AppFonts.mediumBold
        textColor                   = AppColors.appBlack
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.9
        lineBreakMode               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}

