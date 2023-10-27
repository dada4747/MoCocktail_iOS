//
//  MCTitleTextField.swift
//  MoCocktail
//
//  Created by Admin on 11/08/22.
//

import UIKit

class MCInputTextField: UIView {
    
    //MARK:- image view
    let imageView : UIImageView = {
        let iv          = UIImageView()
        iv.tintColor    = AppColors.appGray4
        iv.contentMode  = .scaleAspectFit
        iv.alpha        = 0.87
        return iv
    }()
    //MARK:- Empty Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    //MARK:- initializer with properties
//    init(image: UIImage?, placeholder: String, height: CGFloat) {
//        super.init(frame: .zero)
//        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor : AppColors.appGray4])
//        setHeight(height: height)
//        imageView.image = image
//        configure()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK:- configure UI
    private func configure(){
        
        layer.borderColor   = AppColors.appGray4.cgColor
        layer.borderWidth   = 1
        layer.cornerRadius  = 10
//        tintColor = AppColors.appGray1
//        imageView.tintColor = AppColors.appGray1
        
        addSubview(imageView)
        imageView.centerY(inView: self)
//        imageView.anchor(left: leftAnchor, paddingLeft: 8)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, width: 21)
//        imageView.setDimensions(height: 24, width: 24)
    }
    //MARK:- Set properties
    func set(image: UIImage?, placeholder: String, height: CGFloat, textField: UITextField) {
        addSubview(textField)
//        textField.delegate = self
        textField.centerY(inView: self)
        textField.anchor(left           : imageView.rightAnchor,
                         bottom         : bottomAnchor,
                         right          : rightAnchor,
                         paddingLeft    : 8,
                         paddingBottom  : -8)
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor : AppColors.appGray4])

        setHeight(height: height)
        imageView.image = image
    }
}

//extension MCInputTextField : UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        layer.borderColor =  AppColors.appSecondary80.cgColor
//    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        layer.borderColor = AppColors.appGray4.cgColor
//
//    }
//}
