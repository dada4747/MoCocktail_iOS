//
//  MCLine.swift
//  MoCocktail
//
//  Created by Admin on 15/08/22.
//

import UIKit

class MCLineView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(color: UIColor) {
        super.init(frame: .zero)
        layer.borderColor = color.cgColor
        layer.borderWidth = 2
        translatesAutoresizingMaskIntoConstraints = false
        
    }

}
