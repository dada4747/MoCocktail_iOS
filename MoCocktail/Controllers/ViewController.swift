//
//  ViewController.swift
//  MoCocktail
//
//  Created by Admin on 09/08/22.
//

import UIKit

class ViewController: UIViewController, AuthenticationDelegate {
    func authenticationCompleted() {
//        presentLoginScreen()
        dismiss(animated: true, completion: nil)

        k.set(title: "Email", image: AppIcons.bold_profile!, placeholder: "Please Enter your Email", height: 55, textField: textField)
        view.backgroundColor = AppColors.appSecondary60
    set()
    }
    
    let textField : UITextField = {
        let tf          = UITextField()
        tf.borderStyle  = .none
        tf.textColor    = AppColors.appBlack
        tf.font         = AppFonts.smallRegular
        tf.tintColor    = AppColors.appBlack
        tf.keyboardAppearance = .dark
        return tf
    }()
    let k = MCTitleTextField()
    let l = MCTitleLabel()
    let b = MCBodyLabel(font: AppFonts.smallRegular!,textAlignment: .center, text: "some text")
    let c = MCSmallLabel(font: AppFonts.SmallerRegular!, color: AppColors.appBlack)


    let iv : UIImageView = {
        let iv = UIImageView()
        iv.image = AppIcons.bold_arrow_down
        return iv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
//        presentLoginScreen()
        authenticateUser()
//        k.set(title: "Email", image: AppIcons.bold_profile!, placeholder: "Please Enter your Email", height: 55, textField: textField)
//        view.backgroundColor = AppColors.appSecondary60
//        /*
//
//         */
//    set()
    }
    func authenticateUser() {
//        if Auth.auth().currentUser?.uid == nil {
            presentLoginScreen()
//        }
//        else {
//            fetchConversations()
//
//        }
    }
    func presentLoginScreen() {
        DispatchQueue.main.async {
            let controller      = SignInVC()
            controller.delegate = self
            let nav                    = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        }
    }
    func  set(){
        view.addSubview(l)
        l.backgroundColor = .gray
        l.text = "Search recipes"
        l.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            l.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            l.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            l.widthAnchor.constraint(equalToConstant: 350),
            l.heightAnchor.constraint(equalToConstant: 50)
        ])
        view.addSubview(b)
        b.backgroundColor = .gray
        b.text = "Search recipes"
        b.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            b.topAnchor.constraint(equalTo: view.topAnchor,constant: 180),
            b.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            b.widthAnchor.constraint(equalToConstant: 350),
            b.heightAnchor.constraint(equalToConstant: 50)
        ])
        view.addSubview(c)
        c.text = "Search recipes"
        c.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            c.topAnchor.constraint(equalTo: view.topAnchor,constant: 220),
            c.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            c.widthAnchor.constraint(equalToConstant: 350),
            c.heightAnchor.constraint(equalToConstant: 50)
        ])
        view.addSubview(k)

//        k.backgroundColor = AppColors.appGray4
//        k.textField.textField.isSecureTextEntry = true
        k.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            k.topAnchor.constraint(equalTo: l.bottomAnchor,constant: 150),
            k.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            k.widthAnchor.constraint(equalToConstant: 350),
            k.heightAnchor.constraint(equalToConstant: 81)
        ])
//        view.addSubview(iv)
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            iv.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            iv.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            iv.widthAnchor.constraint(equalToConstant: 100),
//            iv.heightAnchor.constraint(equalToConstant: 100)
//        ])

    }
}
