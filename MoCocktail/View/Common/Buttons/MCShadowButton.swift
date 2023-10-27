//
//  MCShadowButton.swift
//  MoCocktail
//
//  Created by Admin on 15/08/22.
//

import UIKit

class MCShadowButton: UIButton {

        let imgView : UIImageView = {
            let iv = UIImageView()
            iv.setWidth(width: 24)
            iv.setHeight(height: 24)
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
        }()
        override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }
        
        init(icon: UIImage) {
            super.init(frame: .zero)
            self.imgView.image = icon
            configure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configure(){
            addSubview(imgView)
            imgView.centerX(inView: self)
            imgView.centerY(inView: self)
            layer.shadowColor = AppColors.appGray1.cgColor
            layer.cornerRadius = 10
            translatesAutoresizingMaskIntoConstraints = false
            layer.borderWidth = 2
            layer.borderColor = AppColors.appGray4.cgColor
        }
        func addTarget(target : Any, action: Selector, forEvent : UIControl.Event) {
            self.addTarget(target, action: action,for: forEvent)
        }
    }
    
