//
//  UIFont_Ext.swift
//  MoCocktail
//
//  Created by Admin on 10/08/22.
//

import UIKit

// MARK: Poppins UIFont
extension UIFont {
    static func poppinsBold(size: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-Bold", size: size)
    }
    
    static func poppinsRegular(size: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-Regular", size: size)
    }
}
