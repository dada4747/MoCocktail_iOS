//
//  OnboardingViewController.swift
//  MoCocktail
//
//  Created by Admin on 12/08/22.
//

import UIKit

class OnboardingVC: UIViewController {
    //MARK: - Initialize UI Elements
    let tagView : UIView = {
        let view = UIView()
        view.setHeight(height: 22)
        return view
    }()
    
    let starImage : UIImageView = {
        let img = UIImageView()
        img.image = AppIcons.bold_star_wt
        return img
    }()
    
    let tagLabel : UILabel = {
        let countTag = [NSAttributedString.Key.font: AppFonts.normalBold]
        var attributedString = NSMutableAttributedString(string: "60k+", attributes: countTag as [NSAttributedString.Key : Any])
        let tagText = [NSAttributedString.Key.font: AppFonts.NormalRegular]
        attributedString.append(
            NSAttributedString(string: "Premium recipes", attributes: tagText as [NSAttributedString.Key : Any]))
        let label = UILabel()
        label.attributedText = attributedString
        label.textColor = AppColors.appWhite
        return label
    }()
    
    let logoImage : UIImageView = {
        let img = UIImageView()
        img.image = AppImages.appLogo
        return img
    }()
    
    var headerTitleLabel : UILabel   = {
        var paragraphStyle   = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.8
        let label            = UILabel()
        label.attributedText = NSMutableAttributedString(string: "Let’s\nMixing",
                                                         attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]);
        label.numberOfLines  = 2
        label.textAlignment  = .center
        label.font           = AppFonts.titleBold
        label.textColor      = AppColors.appPrimary0
        label.setWidth(width: 247)
        return label
    }()
    
    let captionLabel : UILabel = {
        let label = UILabel()
        label.text = "Find best recipes for \nCocktails"
        label.font = AppFonts.mediumRegular
        label.textColor = AppColors.appWhite
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    lazy var backgroundImageView : UIImageView = {
        var iv = UIImageView()
        iv = UIImageView(frame: view.bounds)
        iv.contentMode =  UIView.ContentMode.scaleToFill
        iv.clipsToBounds = true
        iv.image = AppImages.backgroundImage
        iv.center = view.center
        return iv
    }()
    
    let rightArrowIcon: UIImageView = UIImageView(image: AppIcons.bold_rightArrow_wt)
    
    let startButton : UIButton =  {
        let btn = MCFillButton()
        btn.set(backgroundColor: AppColors.appPrimary50, title: "Start Mixing", font: AppFonts.mediumBold!)
        return btn
    }()
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        view.addSubview(headerTitleLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerTitleLabel.center = view.center
        animateHeader()
        setTagLabel()
        setLogoImage()
        setStartButton()
        setContent()
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           navigationController?.isNavigationBarHidden = true
       }

    //MARK: - Configure UI Elements
    func assignbackground(){
        view.addSubview(backgroundImageView)
        self.view.sendSubviewToBack(backgroundImageView)
        addBlurEffect()
    }
    
    func addBlurEffect(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemChromeMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }
    
    func setTagLabel(){
        view.addSubview(tagView)
        tagView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 13, paddingLeft: 85, paddingRight: 85, height: 22)
        tagView.addSubview(starImage)
        starImage.anchor(top: tagView.topAnchor, left: tagView.leftAnchor, bottom: tagView.bottomAnchor, paddingTop: 3, paddingLeft: 0, paddingBottom: 3, width: 16, height: 16)
        tagView.addSubview(tagLabel)
        tagLabel.anchor(top: tagView.topAnchor, left: starImage.rightAnchor, bottom: tagView.bottomAnchor, right: tagLabel.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0)
    }
    
    func setLogoImage(){
        view.addSubview(logoImage)
        logoImage.anchor(top: tagView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 48, paddingRight: 48, height: 300)
    }
    
    func setStartButton(){
        view.addSubview(startButton)
        startButton.anchor( left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 85, paddingBottom: 48, paddingRight: 85, height: 54)
        
        startButton.addSubview(rightArrowIcon)
        rightArrowIcon.anchor(top: startButton.topAnchor, bottom: startButton.bottomAnchor, right: startButton.rightAnchor, paddingTop: 20, paddingBottom: 20, paddingRight: 30, width: 13.33)
        startButton.addTarget(self, action: #selector(startButtonClick), for: .touchUpInside )
    }
    
    func setContent() {
        self.view.addSubview(captionLabel)
        captionLabel.anchor(left: view.leftAnchor, bottom: startButton.topAnchor, right: view.rightAnchor, paddingLeft: 67, paddingBottom: 40, paddingRight: 67)
    }
    //MARK: Animate function
    private func animateHeader(){
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.width * 3
            let diffX  = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            self.headerTitleLabel.frame = CGRect(x: -(diffX/2), y: diffY/5, width: size, height: size)
        } completion: { isCompleted in
            if isCompleted {
            }
        }
    }
    //MARK: - OBJC Method
    @objc func startButtonClick(){
        navigationController?.pushViewController(SignInVC(), animated: true)
//        self.navigationController?.pushViewController(SignInViewController(), animated: true)

    }
    //MARK: - Custom Fuction
    //MARK: -
}
