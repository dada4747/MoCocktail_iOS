//
//  MCScrollViewController.swift
//  MoCocktail
//
//  Created by Admin on 18/08/22.
//


import UIKit

class MCScrollVC: UIViewController {
    //MARK: - Variables
    let scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .clear
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    
    let contentView : UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    //MARK: - LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupHideKeyboardOnTap()
        setupScrollView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        registerKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            NotificationCenter.default.removeObserver(self)
            
        }
    //MARK: - Functions
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    //MARK: - OBJC Methods
    @objc func keyboardWillShow(notification: NSNotification) {
        let userInfo: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardInfo = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue
        let keyboardSize = keyboardInfo.cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    //MARK: - Configure UI
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
                                        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
                                        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                                        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                                        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)])
    }
}

