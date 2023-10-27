//
//  MCAttributeButton.swift
//  MoCocktail
//
//  Created by Admin on 15/08/22.
//

import UIKit


class MCAttributeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(text1: String, text2: String, attColor1: UIColor, attColor2: UIColor) {
        super.init(frame: .zero)
        
        let att = NSMutableAttributedString(string: "\(text1)\(text2)")
        att.addAttribute(NSAttributedString.Key.font, value: AppFonts.SmallerBold, range: NSRange(location: 0, length: text1.count))
        
        att.addAttribute(NSAttributedString.Key.foregroundColor, value: attColor1, range: NSRange(location: 0, length: text1.count))
        att.addAttribute(NSAttributedString.Key.font, value: AppFonts.SmallBold,  range: NSRange(location: text1.count, length: text2.count))
        att.addAttribute(NSAttributedString.Key.foregroundColor, value: attColor2, range: NSRange(location: text1.count, length: text2.count))
        setAttributedTitle(att, for: .normal)
        
    }
    func configure(){
        
    }
}
