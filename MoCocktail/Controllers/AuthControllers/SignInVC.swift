//
//  SignInViewController.swift
//  MoCocktail
//
//  Created by Admin on 14/08/22.
//

import UIKit

protocol AuthenticationDelegate: AnyObject {
    func authenticationCompleted()
}
protocol AuthenticationControllerProtocol {
    func checkFormStatus(vm: String, tf: UITextField )
    func checkFormValidation()
}
class SignInVC: MCScrollVC {
    private var viewModel = SignInViewModel()
    weak var delegate     : AuthenticationDelegate?
    
    //MARK:- Initialize
    var emailTextField    = MCTextField()
    let passwordTextField = MCTextField()
    let headerLabel       = MCHeaderLabel(text:"Hello,",
                                          textAlignment: .left)
    let welcomeLabel      = MCBodyLabel(font: AppFonts.largeRegular!,
                                        textAlignment: .left,
                                        text: "Welcome Back!")
    let emailContainer    = MCTitleTextField()
    let passwordContainer = MCTitleTextField()
    let forgotPassword    = MCOutlineButton(titleColor: AppColors.appTertiary100,
                                            title: AppPlaceholder.forgotPassword,
                                            font: AppFonts.SmallerRegular!
    )
    let signInButton      = MCFillButton(backgroundColor: AppColors.appSecondary80,
                                         title: AppTitles.signIn,
                                         font: AppFonts.normalBold!)
    let lineView          = MCLineView(color: AppColors.appGray4)
    let optionLabel       = MCBodyLabel(font: AppFonts.SmallerBold!,
                                        textAlignment: .center,
                                        text: "Or Sign in With")
    let lineView2         = MCLineView(color: AppColors.appGray4)
    let googleButton      = MCShadowButton(icon: AppImages.google!)
    let facebookButton    = MCShadowButton(icon: AppImages.facebook!)
    let showSignUpBtn         = MCAttributeButton(text1: "Don’t have an account? ",
                                              text2:  AppTitles.singup,
                                              attColor1: AppColors.appBlack,
                                              attColor2: AppColors.appTertiary100)
    //MARK:- Variables
    let lastView: UIView  = {
        let v             = UIView()
        v.backgroundColor = .gray
        return v
    }()
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    navigationController?.isNavigationBarHidden = true

        view.backgroundColor = AppColors.appWhite
        setupUI()
        addTargets()
    }
    
    //MARK:- Set UI
    func setupUI(){
        setUpHeader()
        setUpWelcomeLabel()
        setUpEmailTextField()
        setUpPasswordTextField()
        setUpForgotButton()
        setUpSignInButton()
        setUpOptionLabel()
        setUpFacebookButton()
        setUpGoogleButton()
        setUpSignUpOption()
        lastViewConfig()
    }
    //MARK: - Targets
    func addTargets() {
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        forgotPassword.addTarget(self, action: #selector(showForgotPassword), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        showSignUpBtn.addTarget(self, action: #selector(showSignUp), for: .touchUpInside)
        googleButton.addTarget(target: self, action: #selector(handleGoogleSignIn), forEvent: .touchUpInside)
        facebookButton.addTarget(target: self, action: #selector(handleFaceBookSignIn), forEvent: .touchUpInside)
        
    }
    //MARK:- ConfigureUI
    func setUpHeader(){
        contentView.addSubview(headerLabel)
        headerLabel.anchor(top: contentView.topAnchor,
                           left: contentView.leftAnchor,
                           right: contentView.rightAnchor,
                           paddingTop: 50,
                           paddingLeft: 30,
                           paddingRight: 30,
                           height: 45)
    }
    
    func setUpWelcomeLabel(){
        contentView.addSubview(welcomeLabel)
        welcomeLabel.anchor(top: headerLabel.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 30, paddingRight: 30)
    }
    
    func setUpEmailTextField(){
        contentView.addSubview(emailContainer)
        emailContainer.set(title: AppTitles.email,
                           image: AppIcons.envelope_sqr!,
                           placeholder: AppPlaceholder.emailPlaceholder,
                           height: 55, textField: emailTextField)
        emailContainer.anchor(top: welcomeLabel.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 57, paddingLeft: 30, paddingRight: 30)
    }
    
    func setUpPasswordTextField(){
        contentView.addSubview(passwordContainer)
        passwordContainer.set(title: AppTitles.password,
                              image: AppIcons.lock_circle!,
                              placeholder: AppPlaceholder.passwordPlaceholder,
                              height: 55, textField: passwordTextField)
        passwordContainer.anchor(top: emailContainer.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 50, paddingLeft: 30, paddingRight: 30)
    }
    
    func setUpForgotButton(){
        contentView.addSubview(forgotPassword)
        forgotPassword.layer.borderColor = AppColors.appWhite.cgColor
        forgotPassword.anchor(top: passwordContainer.bottomAnchor, left: contentView.leftAnchor, paddingTop: 20, paddingLeft: 40, width: 97, height: 17)
    }
    
    func setUpSignInButton(){
        contentView.addSubview(signInButton)
        signInButton.anchor(top: forgotPassword.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 25, paddingLeft: 30, paddingRight: 30, height: 50)
    }
    func setUpOptionLabel(){
        contentView.addSubview(lineView)
        lineView.anchor(top: signInButton.bottomAnchor, left: contentView.leftAnchor, paddingTop: 29, paddingLeft: 90, width: 50, height: 1)
        contentView.addSubview(optionLabel)
        optionLabel.textColor = AppColors.appGray4
        optionLabel.anchor(top: signInButton.bottomAnchor, left: lineView.rightAnchor, paddingTop: 20, paddingLeft: 8,height: 17)
        contentView.addSubview(lineView2)
        lineView2.anchor(top: signInButton.bottomAnchor, right: contentView.rightAnchor, paddingTop: 29, paddingRight: 90, width: 50, height: 1)
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
        contentView.addSubview(showSignUpBtn)
        showSignUpBtn.translatesAutoresizingMaskIntoConstraints  = false
        showSignUpBtn.centerX(inView: view)
        showSignUpBtn.anchor(top: googleButton.bottomAnchor, paddingTop: 10, height: 17)
    }
    
    func lastViewConfig(){
        contentView.addSubview(lastView)
        lastView.backgroundColor = .clear
        lastView.anchor(top: showSignUpBtn.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 50)
    }
    //MARK:- OBJC Methods
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        if textField == emailTextField {
            viewModel.email = textField.text
            checkFormStatus(vm: viewModel.email!, tf: textField)
        }else {
            viewModel.password = textField.text
            checkFormStatus(vm:  viewModel.password!, tf: textField)
        }
        checkFormValidation()
        
    }
    @objc func showForgotPassword(){
        let vc = ForgotPasswordVC()
//        vc.delegate = delegate
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func handleSignIn() {
        print("signInEnabled")
    }
    @objc func handleGoogleSignIn(){
        print("google in clicked")
    }
    
    @objc func handleFaceBookSignIn(){
        print("facebook clicked")
    }
    
    @objc func showSignUp() {
        let vc = SingUpVC()
        vc.delegate = delegate
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //MARK:- Custom Methods & Functions
}
//MARK: - AuthenticationControllerProtocol
extension SignInVC : AuthenticationControllerProtocol {
    func checkFormStatus(vm: String, tf: UITextField ){
        if tf == emailTextField {
            if !(vm.isValidEmail()) {
                emailContainer.changeBorderColor(color: AppColors.appError100.cgColor)
            } else {
                emailContainer.changeBorderColor(color: AppColors.appSucess100.cgColor)
            }
        } else {
            if !(vm.isValidPassword()) {
                passwordContainer.changeBorderColor(color: AppColors.appError100.cgColor)
                
            } else {
                passwordContainer.changeBorderColor(color: AppColors.appSucess100.cgColor)
            }
        }
    }
    func checkFormValidation(){
        if viewModel.isFormValid {
            signInButton.isEnabled       = true
            signInButton.backgroundColor = AppColors.appSecondary100
        } else {
            signInButton.isEnabled       = false
            signInButton.backgroundColor = AppColors.appSecondary80
        }
    }
}
