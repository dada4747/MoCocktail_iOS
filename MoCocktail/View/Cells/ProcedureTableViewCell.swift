//
//  ProcedureTableViewCell.swift
//  MoCocktail
//
//  Created by Admin on 26/07/23.
//

import UIKit

class ProcedureTableViewCell: UITableViewCell {
    let customContentView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.appIngredientCell
        view.layer.cornerRadius = 10
        return view
    }()
    let ingridentLabel = MCBodyLabel(font: AppFonts.normalBold!, textAlignment: .left, text: "Step 1")
    let ingridentDesc = MCSmallLabel(font: AppFonts.smallRegular!, color: AppColors.appGray3)

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
        contentView.addSubview(customContentView)
        customContentView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingLeft: 20, paddingBottom: 10, paddingRight: 20)
        customContentView.addSubview(ingridentLabel)
        ingridentLabel.text = "Step 1"
        ingridentLabel.anchor(top: customContentView.topAnchor, left: customContentView.leftAnchor, right: customContentView.rightAnchor, paddingTop: 12, paddingLeft: 16,paddingRight: 16, height: 22)
        customContentView.addSubview(ingridentDesc)
        ingridentDesc.numberOfLines = 0
        
        ingridentDesc.setText(text: "Far far away, behind the word mountains, far from the countries. Far far away, behind the word mountains, far from the countries.")
        ingridentDesc.anchor(top: ingridentLabel.bottomAnchor, left: customContentView.leftAnchor, bottom: customContentView.bottomAnchor, right: customContentView.rightAnchor, paddingTop: 12, paddingLeft: 16, paddingBottom: 12, paddingRight: 16)

        
    }
}
