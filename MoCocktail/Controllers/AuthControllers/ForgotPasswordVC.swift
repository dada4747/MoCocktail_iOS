//
//  ForgotPasswordVC.swift
//  MoCocktail
//
//  Created by Admin on 30/08/22.
//

import UIKit

class ForgotPasswordVC: MCScrollVC {
    //MARK: - Variables Declaration
    private var viewModel   = ForgotPasswordViewModel()
    let headerLabel         = MCBodyLabel(font: AppFonts.largeBold!, textAlignment: .left, text: "Forgot Password?")
    let subHeaderLabel      = MCBodyLabel(font: AppFonts.SmallerRegular!, textAlignment: .left, text: "Please Enter your email id to receive new password.")
    let emailTextField      = MCTextField()
    let emailContainer      = MCTitleTextField()
    let sendButton        = MCFillButton(backgroundColor: AppColors.appSecondary80, title: "Send", font: AppFonts.normalBold!)
    let optionLabel         = MCBodyLabel(font: AppFonts.SmallerBold!,
                                          textAlignment: .center,
                                          text: "Or Sign in With")
    let lineView            = MCLineView(color: AppColors.appGray4)
    let lineView2           = MCLineView(color: AppColors.appGray4)
    let googleButton        = MCShadowButton(icon: AppImages.google!)
    let facebookButton      = MCShadowButton(icon: AppImages.facebook!)
    let showSignIn          = MCAttributeButton(text1: "Already a member? ",
                                                 text2:  AppTitles.signIn,
                                                 attColor1: AppColors.appBlack,
                                                 attColor2: AppColors.appTertiary100)
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.appWhite
        setupUI()
        addTarget()

    }
    //MARK: - Setup UI
    func setupUI() {
        setUpHeaderTitle()
        setUpSubHeader()
        setupEmailContainer()
        sendEmailButtonConfig()
        setUpOptionLabel()
        setUpGoogleButton()
        setUpFacebookButton()
        setUpSignUpOption()
    }
    //MARK: - Configure UI
    func addTarget() {
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        showSignIn.addTarget(self, action: #selector(showSignInView), for: .touchUpInside)
    }

    
    func setUpHeaderTitle() {
        contentView.addSubview(headerLabel)
        headerLabel.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 10, paddingLeft: 30, paddingRight: 30, height: 30)
    }
    func setUpSubHeader(){
        contentView.addSubview(subHeaderLabel)
        subHeaderLabel.anchor(top: headerLabel.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 5, paddingLeft: 30, paddingRight: 150)
    }
    func setupEmailContainer(){
        contentView.addSubview(emailContainer)
        emailContainer.set(title: "Email", image: AppIcons.envelope_circle!, placeholder: "Enter Email", height: 55, textField: emailTextField)
        emailContainer.anchor(top: subHeaderLabel.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 20, paddingLeft: 30, paddingRight: 30)
    }
    func sendEmailButtonConfig() {
        contentView.addSubview(sendButton)
        sendButton.anchor(top: emailContainer.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 26, paddingLeft: 30, paddingRight: 30, height: 60)
    }
    
    func setUpOptionLabel(){
        contentView.addSubview(lineView)
        lineView.anchor(top: sendButton.bottomAnchor, left: contentView.leftAnchor, paddingTop: 29, paddingLeft: 90, width: 50, height: 1)
        contentView.addSubview(optionLabel)
        optionLabel.textColor = AppColors.appGray4
        optionLabel.anchor(top: sendButton.bottomAnchor, left: lineView.rightAnchor, paddingTop: 20, paddingLeft: 8,height: 17)
        contentView.addSubview(lineView2)
        lineView2.anchor(top: sendButton.bottomAnchor, right: contentView.rightAnchor, paddingTop: 29, paddingRight: 90, width: 50, height: 1)
    }
    func setUpGoogleButton(){
        contentView.addSubview(googleButton)
        googleButton.anchor(top: optionLabel.bottomAnchor, left: contentView.leftAnchor, paddingTop: 20, paddingLeft: 131, width: 44, height: 44)
    }
    func setUpFacebookButton(){
        contentView.addSubview(facebookButton)
        facebookButton.anchor(top: optionLabel.bottomAnchor, right: contentView.rightAnchor, paddingTop: 20, paddingRight: 131, width: 44, height: 44)
        
    }
    func setUpSignUpOption(){
        contentView.addSubview(showSignIn)
        showSignIn.translatesAutoresizingMaskIntoConstraints  = false
        showSignIn.centerX(inView: contentView)
        showSignIn.anchor(top: facebookButton.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 10)
        
    }
    //MARK: - @OBJC Methods
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        if textField == emailTextField {
            viewModel.email = textField.text
            checkFormStatus(vm: viewModel.email!, tf: textField)
        }
        checkFormValidation()
        
    }
    @objc func showSignInView(){
        navigationController?.popViewController(animated: true)

    }
}
//MARK: - AuthenticationControllerProtocol
extension ForgotPasswordVC: AuthenticationControllerProtocol {
    func checkFormStatus(vm: String, tf: UITextField) {
        if !(vm.isValidEmail()) {
            emailContainer.changeBorderColor(color: AppColors.appError100.cgColor)
        } else {
            emailContainer.changeBorderColor(color: AppColors.appSucess100.cgColor)
        }
    }
    func checkFormValidation(){
            if viewModel.isFormValid {
                sendButton.isEnabled       = true
                sendButton.backgroundColor = AppColors.appSecondary100
            } else {
                sendButton.isEnabled       = false
                sendButton.backgroundColor = AppColors.appSecondary80
            }
        }
}
