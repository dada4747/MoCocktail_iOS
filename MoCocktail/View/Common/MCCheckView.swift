//
//  MCCheckView.swift
//  MoCocktail
//
//  Created by Admin on 24/08/22.
//

import UIKit

protocol CheckBoxDelegate {
    func selected(isSelected: Bool)
}
class MCChechBox: UIView {
    var isSelected = false
    var delegate : CheckBoxDelegate?
    let imageView : UIButton = {
        let iv = UIButton()
        iv.layer.borderColor = AppColors.appTertiary100.cgColor
        iv.layer.borderWidth = 1
        iv.layer.cornerRadius = 2
        return iv
    }()
    let label = MCSmallLabel(font: AppFonts.SmallerRegular!, color: AppColors.appTertiary100)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

            configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(title: String) {
        super.init(frame: .zero)
        self.label.text = title
        label.textColor = AppColors.appTertiary100
        configure()
    }
    func configure() {
        self.addSubview(imageView)
        tintColor = .white
        imageView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 17, height: 17)
        imageView.setWidth(width: 17)
        imageView.setHeight(height: 17)
        imageView.centerY(inView: self)
        imageView.anchor(left: self.leftAnchor, paddingLeft: 0)
        imageView.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
        self.addSubview(label)
        label.anchor(top: self.topAnchor, left: imageView.rightAnchor, right: self.rightAnchor, paddingLeft: 5, paddingRight: 5, height: 17)
    }

    @objc func selectButton(){
        if !isSelected {
            delegate?.selected(isSelected: true)
            imageView.setImage(UIImage(systemName: "checkmark"), for: .normal)
            imageView.backgroundColor = AppColors.appTertiary100
            isSelected = !isSelected
            
        } else {
            delegate?.selected(isSelected: false)
            imageView.setImage(UIImage(systemName: "unchecked"), for: .normal)//
            imageView.backgroundColor = .clear
            isSelected = !isSelected
        }
        
    }
}

