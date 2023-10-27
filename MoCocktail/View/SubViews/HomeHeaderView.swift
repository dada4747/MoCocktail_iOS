//
//  HomeHeaderView.swift
//  MoCocktail
//
//  Created by Admin on 20/09/22.
//

import UIKit

class MainTableHeader: UIView {
    let helloLebal = MCTitleLabel()
    let quoteLabel = MCSmallLabel(font: AppFonts.smallRegular!, color: AppColors.appGray3)
    let profileImage : UIImageView = {
        let img = UIImageView()
        img.backgroundColor = AppColors.appGray4
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        img.image = AppIcons.bold_profile
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    let searchTextField = MCTextField()
    let searchButton = MCInputTextField()
    let btn = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //        heroImageView.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUp() {
        setUpHelloLabel()
        setUpQuoteLabel()
        setUpProfileImg()
        setUpSearch()
    }
    func setUpHelloLabel(){
        self.addSubview(helloLebal)
        helloLebal.text = "Hello Rahul"
        helloLebal.anchor(top: self.topAnchor, left: self.leftAnchor, paddingTop: 30, paddingLeft: 20, height: 30)
    }
    func setUpQuoteLabel(){
        self.addSubview(quoteLabel)
        quoteLabel.text = "What are you doing today?"
        quoteLabel.anchor(top: helloLebal.bottomAnchor, left: self.leftAnchor, paddingTop: 0, paddingLeft: 20, height: 17)
    }
    func setUpProfileImg(){
        self.addSubview(profileImage)
        profileImage.anchor(top: self.safeAreaLayoutGuide.topAnchor, right: self.rightAnchor, paddingTop: 30, paddingRight: 20, width: 40, height: 40)
    }
    func setUpSearch(){
        self.addSubview(searchButton)
        searchButton.set(image: AppIcons.outline_search_normal, placeholder: "Search", height: 40, textField: searchTextField)
        searchButton.anchor(top: quoteLabel.bottomAnchor, left: self.leftAnchor,right: self.rightAnchor, paddingTop: 28, paddingLeft: 20, paddingRight: 20, height: 40)
        addSubview(btn)
//        searchButton.set(image: AppIcons.outline_search_normal, placeholder: "Search", height: 40, textField: searchTextField)
        btn.anchor(top: quoteLabel.bottomAnchor, left: self.leftAnchor,right: self.rightAnchor, paddingTop: 28, paddingLeft: 20, paddingRight: 20, height: 40)
    }
}
