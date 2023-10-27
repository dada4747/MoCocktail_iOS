//
//  MCSmallLabel.swift
//  MoCocktail
//
//  Created by Admin on 15/08/22.
//

import UIKit

class MCSmallLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(font: UIFont, color: UIColor) {
        super.init(frame: .zero)
        self.textAlignment          = textAlignment
        self.font                   = font
        textColor = color

        configure()
    }
    func setText(text: String){
        self.text = text
    }
    private func configure(){
        textAlignment               = textAlignment
//        textColor                   = AppColors.appBlack
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.9
        lineBreakMode               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
//        setHeight(height: 21)
    }
}
