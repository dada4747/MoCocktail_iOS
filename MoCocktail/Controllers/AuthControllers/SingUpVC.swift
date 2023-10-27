//
//  SingUpVCViewController.swift
//  MoCocktail
//
//  Created by Admin on 22/08/22.
//

import UIKit

class SingUpVC: MCScrollVC {
    weak var delegate : AuthenticationDelegate?
    private var viewModel = SignUpViewModel()
    var isCheckSelect = false
    //MARK: - Initializer
    let headerLabel         = MCBodyLabel(font: AppFonts.largeBold!, textAlignment: .left, text: "Create an account")
    let subHeaderLabel      = MCBodyLabel(font: AppFonts.SmallerRegular!, textAlignment: .left, text: "Let’s help you set up your account, it won’t take long.")
    let nameTextField       = MCTextField()
    let emailTextField      = MCTextField()
    let passwordTextField   = MCTextField()
    let confirmPasswordTF   = MCTextField()
    let nameContainer       = MCTitleTextField()
    let emailContainer      = MCTitleTextField()
    let passwordContainer   = MCTitleTextField()
    let confirmPasswordC    = MCTitleTextField()
    let chechbox            = MCChechBox(title: "Accept terms & Condition")
    let signUpButton        = MCFillButton(backgroundColor: AppColors.appSecondary80, title: "Sign Up", font: AppFonts.normalBold!)
    let lineView            = MCLineView(color: AppColors.appGray4)
    let optionLabel         = MCBodyLabel(font: AppFonts.SmallerBold!,
                                          textAlignment: .center,
                                          text: "Or Sign in With")
    let lineView2           = MCLineView(color: AppColors.appGray4)
    let googleButton        = MCShadowButton(icon: AppImages.google!)
    let facebookButton      = MCShadowButton(icon: AppImages.facebook!)
    let showSignIn           = MCAttributeButton(text1: "Already a member? ",
                                                 text2:  AppTitles.signIn,
                                                 attColor1: AppColors.appBlack,
                                                 attColor2: AppColors.appTertiary100)
    //MARK:- Variables
    //MARK:- LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.appWhite
        setUpUI()
        setUpTargets()
    }
    
    //MARK:- Set UI
    func setUpUI() {
        
        setUpHeaderTitle()
        setUpSubHeader()
        setUpNameContainer()
        setUpEmailContainer()
        setUpPasswordContainer()
        setUpConfirmPasswordC()
        chechBook()
        signUpButtonConfig()
        setUpOptionLabel()
        setUpGoogleButton()
        setUpFacebookButton()
        setUpSignUpOption()
    }
    //MARK: - Targets
    func setUpTargets() {
        chechbox.delegate = self
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        confirmPasswordTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        signUpButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        showSignIn.addTarget(self, action: #selector(showSignInVC), for: .touchUpInside)
        
        facebookButton.addTarget(target: self, action: #selector(handleFaceBookSignUp), forEvent: .touchUpInside)
        googleButton.addTarget(target: self, action: #selector(handleGoogleSignUp), forEvent: .touchUpInside)
        
        
    }
    //MARK: - Configure UI
    func setUpHeaderTitle() {
        contentView.addSubview(headerLabel)
        headerLabel.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 10, paddingLeft: 30, paddingRight: 30, height: 30)
    }
    func setUpSubHeader(){
        contentView.addSubview(subHeaderLabel)
        subHeaderLabel.anchor(top: headerLabel.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 5, paddingLeft: 30, paddingRight: 150)
    }
    
    func setUpNameContainer(){
        contentView.addSubview(nameContainer)
        nameContainer.set(title: "Name", image: AppIcons.person_circle!, placeholder: "Enter Name", height: 55, textField: nameTextField)
        nameContainer.anchor(top: subHeaderLabel.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 20, paddingLeft: 30, paddingRight: 30)
    }
    func setUpEmailContainer(){
        contentView.addSubview(emailContainer)
        emailContainer.set(title: AppTitles.email, image: AppIcons.envelope_circle!, placeholder: AppPlaceholder.emailPlaceholder, height: 55, textField: emailTextField)
        emailContainer.anchor(top: nameContainer.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 20, paddingLeft: 30, paddingRight: 30)
    }
    func setUpPasswordContainer(){
        contentView.addSubview(passwordContainer)
        passwordContainer.set(title: AppTitles.password, image: AppIcons.lock_circle!, placeholder: AppPlaceholder.passwordPlaceholder, height: 55, textField: passwordTextField)
        passwordContainer.anchor(top: emailContainer.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 20, paddingLeft: 30, paddingRight: 30)
    }
    func setUpConfirmPasswordC(){
        contentView.addSubview(confirmPasswordC)
        confirmPasswordC.set(title: AppTitles.confirmPassword, image: AppIcons.lock_sqr!, placeholder: AppPlaceholder.passwordPlaceholder, height: 55, textField: confirmPasswordTF)
        confirmPasswordC.anchor(top: passwordContainer.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 20, paddingLeft: 30, paddingRight: 30)
    }
    func chechBook(){
        contentView.addSubview(chechbox)
        chechbox.anchor(top: confirmPasswordC.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 20, paddingLeft: 30, paddingRight: 30,height: 17)
    }
    func signUpButtonConfig() {
        contentView.addSubview(signUpButton)
        signUpButton.anchor(top: chechbox.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 26, paddingLeft: 30, paddingRight: 30, height: 60)
    }
    func setUpOptionLabel(){
        contentView.addSubview(lineView)
        lineView.anchor(top: signUpButton.bottomAnchor, left: contentView.leftAnchor, paddingTop: 29, paddingLeft: 90, width: 50, height: 1)
        contentView.addSubview(optionLabel)
        optionLabel.textColor = AppColors.appGray4
        optionLabel.anchor(top: signUpButton.bottomAnchor, left: lineView.rightAnchor, paddingTop: 20, paddingLeft: 8,height: 17)
        contentView.addSubview(lineView2)
        lineView2.anchor(top: signUpButton.bottomAnchor, right: contentView.rightAnchor, paddingTop: 29, paddingRight: 90, width: 50, height: 1)
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
    //MARK: - @Objc Methods
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == nameTextField {
            viewModel.name = textField.text
            checkFormStatus(vm: viewModel.name!, tf: textField)
        } else if textField == emailTextField {
            viewModel.email = textField.text
            checkFormStatus(vm: viewModel.email!, tf: textField)
        }else if textField == passwordTextField {
            viewModel.password = textField.text
            checkFormStatus(vm:  viewModel.password!, tf: textField)
        } else if textField == confirmPasswordTF {
            viewModel.confirmPassword = textField.text
            checkFormStatus(vm:  viewModel.confirmPassword!, tf: textField)
            
        } else {
            viewModel.isCheckSelect = isCheckSelect
        }
        viewModel.isCheckSelect = isCheckSelect
        
        checkFormValidation()
    }
    @objc func showSignInVC() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleSignUp(){
        print("signUpClicked")
        self.delegate?.authenticationCompleted()
        
    }
    @objc func handleGoogleSignUp(){
        print("google in clicked")
    }
    
    @objc func handleFaceBookSignUp(){
        print("facebook clicked")
    }
}
//MARK: - Delegates
extension SingUpVC : CheckBoxDelegate, AuthenticationControllerProtocol {
    
    func selected(isSelected: Bool) {
        self.isCheckSelect = isSelected
        viewModel.isCheckSelect = isSelected
        checkFormValidation()
    }
    func checkFormStatus(vm: String, tf: UITextField) {
        if tf == nameTextField {
            if !(vm.isValidInput()) {
                nameContainer.changeBorderColor(color: AppColors.appError100.cgColor)
            } else {
                nameContainer.changeBorderColor(color: AppColors.appSucess100.cgColor)
            }
        } else if tf == emailTextField {
            if !(vm.isValidEmail()) {
                emailContainer.changeBorderColor(color: AppColors.appError100.cgColor)
            } else {
                emailContainer.changeBorderColor(color: AppColors.appSucess100.cgColor)
            }
        } else if tf == passwordTextField {
            if !(vm.isValidPassword()) {
                passwordContainer.changeBorderColor(color: AppColors.appError100.cgColor)
                
            } else {
                passwordContainer.changeBorderColor(color: AppColors.appSucess100.cgColor)
            }
        }else if tf == confirmPasswordTF {
            if !(vm == viewModel.password) {
                confirmPasswordC.changeBorderColor(color: AppColors.appError100.cgColor)
                
            } else {
                confirmPasswordC.changeBorderColor(color: AppColors.appSucess100.cgColor)
            }
        }
    }
    
    func checkFormValidation() {
        if viewModel.isFormValid {
            signUpButton.isEnabled       = true
            signUpButton.backgroundColor = AppColors.appSecondary100
        } else {
            signUpButton.isEnabled       = false
            signUpButton.backgroundColor = AppColors.appSecondary80
        }
    }    
}
