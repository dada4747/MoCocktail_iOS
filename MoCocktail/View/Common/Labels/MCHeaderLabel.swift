//
//  MCHeaderLabel.swift
//  MoCocktail
//
//  Created by Admin on 15/08/22.
//

import UIKit

class MCHeaderLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(text : String,textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment          = textAlignment
        self.text                   = text

        configure()
    }
    private func configure(){
        textAlignment               = textAlignment
        font                        = AppFonts.headerBold
        textColor                   = AppColors.appBlack
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.9
        lineBreakMode               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
