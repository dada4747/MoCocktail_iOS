//
//  IngridentTableViewCell.swift
//  MoCocktail
//
//  Created by Admin on 26/07/23.
//

import UIKit

class IngridentTableViewCell: UITableViewCell {
    let customContentView:  UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.appIngredientCell
        view.layer.cornerRadius = 10
        return view
    }()
    let ingredView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
//        view.setHeight(height: 52)
//        view.setHeight(height: 52)
        view.layer.cornerRadius = 10
        return view
    }()
    
    let ingridentImg : UIImageView = {
        let img = UIImageView()
        img.setWidth(width: 28)
        img.setHeight(height: 32)
        img.image = AppImages.appLogo
        img.clipsToBounds = true
        return img
    }()
    let ingridentLabel = MCBodyLabel(font: AppFonts.normalBold!, textAlignment: .left, text: "Bread")
    let ingridentValue = MCSmallLabel(font: AppFonts.smallRegular!, color: AppColors.appGray3)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(){
//        contentView.layer.cornerRadius = 10
//        contentView.backgroundColor = .lightGray
        contentView.addSubview(customContentView)
        customContentView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor,paddingLeft: 20, paddingBottom:  10, paddingRight: 20)
        
        customContentView.addSubview(ingredView)
        ingredView.anchor(top: customContentView.topAnchor, left: customContentView.leftAnchor, bottom: customContentView.bottomAnchor, paddingTop: 12, paddingLeft: 16, paddingBottom: 12, width: 52, height: 52)
        
        ingredView.addSubview(ingridentImg)
        ingridentImg.centerYAnchor.constraint(equalTo: ingredView.centerYAnchor).isActive = true
        ingridentImg.centerXAnchor.constraint(equalTo: ingredView.centerXAnchor).isActive = true
        
        customContentView.addSubview(ingridentValue)
        
        ingridentValue.text = "100ML"
        ingridentValue.setHeight(height: 20)
//        ingridentValue.setWidth(width: 40)
        ingridentValue.centerYAnchor.constraint(equalTo: customContentView.centerYAnchor).isActive = true
        ingridentValue.widthAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        ingridentValue.anchor(right: customContentView.rightAnchor, paddingRight: 16)
        
        customContentView.addSubview(ingridentLabel)
        ingridentLabel.centerYAnchor.constraint(equalTo: customContentView.centerYAnchor).isActive = true
        ingridentLabel.anchor(left: ingredView.rightAnchor, right: ingridentValue.leftAnchor, paddingLeft: 16, paddingRight:  20)
    }
}



