//
//  MCTitleTextField.swift
//  MoCocktail
//
//  Created by Admin on 11/08/22.
//

import UIKit

class MCTitleTextField: UIView {
    //MARK:- Label
    let label = MCSmallLabel(font: AppFonts.smallRegular!, color: AppColors.appBlack)
    
    var textField = MCInputTextField()
    //MARK:- Empty Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    //MARK:- Initializer
//    init(title: String, image: UIImage, placeholder: String, height: CGFloat) {
//        super.init(frame: .zero)
//        label.text = title
////        textField.set(image: image, placeholder: placeholder, height: height)
//        configure()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK:- Configure UI
    private func configure(){
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.anchor(top: topAnchor, left: leftAnchor, paddingTop: 0, paddingLeft: 0)
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.anchor(top: label.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 0, paddingRight: 0)
    }
    //MARK:- Set properties
    func set(title: String, image: UIImage, placeholder: String, height: CGFloat, textField: UITextField) {
        label.text = title
        self.textField.set(image: image, placeholder: placeholder, height: height, textField: textField)
        configure()
    }
    func changeBorderColor(color: CGColor){
        textField.layer.borderColor = color
    }
}

