//
//  UIViewController_Ext.swift
//  MoCocktail
//
//  Created by Admin on 19/08/22.
//

import UIKit
import SafariServices
fileprivate var containerView: UIView!

extension UIViewController {
    
    // Call this once to dismiss open keyboards by tapping anywhere in the view controller
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }

    // Dismisses the keyboard from self.view
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }

            
        // MARK: - Present Alert dialog
//        func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
//            // when you have code running in background queue and you need specific block of code run on the main queue
//            DispatchQueue.main.async {
//                let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
//                alertVC.modalPresentationStyle  = .overFullScreen
//                alertVC.modalTransitionStyle    = .crossDissolve
//                self.present(alertVC, animated: true)
//            }
//        }
        
        // MARK: - Show loading view
        func showLoadingView() {
            containerView = UIView(frame: view.bounds)
            view.addSubview(containerView)
            containerView.backgroundColor   = .systemBackground
            containerView.alpha             = 0
            
            UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
            
            let activityIndicator = UIActivityIndicatorView(style: .large)
            containerView.addSubview(activityIndicator)
            
            activityIndicator.translatesAutoresizingMaskIntoConstraints  = false
            NSLayoutConstraint.activate([
                activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            activityIndicator.startAnimating()
        }
        
        // MARK: - Dissmiss  Loading view
        func dismissLoadingView() {
            DispatchQueue.main.async {
                containerView.removeFromSuperview()
                containerView = nil
            }
            
        }
        
        // MARK: - Method for show empty screens
//        func showEmptyStateView(with message: String, in view: UIView) {
//            let emptyStateView = GFEmptyStateView(message: message)
//            emptyStateView.frame = view.bounds
//            view.addSubview(emptyStateView)
//        }
        
        // MARK: - Present safari vc
        func presentSafariVC(with url: URL) {
            let safariVC = SFSafariViewController(url: url)
            safariVC.preferredControlTintColor = .systemGreen
            present(safariVC, animated: true)
        }
    
}



//class GFAlertVC: UIViewController {
//
//    let containerView   = UIView()
//    let titleLabel      = GFTitleLabel(textAlignment: .center, fontSize: 20)
//    let messageLabel    = GFBodyLabel(textAlignment: .center)
//    let actionButton    = GFButton(backgroundColor: .systemPink, title: "Ok")
//
//    var alertTitle  : String?
//    var message     : String?
//    var buttonTitle : String?
//
//    //MARK: - Custom Initialiser for alert
//    init(title: String, message: String, buttonTitle: String){
//        super.init(nibName: nil, bundle: nil)
//        self.alertTitle     = title
//        self.message        = message
//        self.buttonTitle    = buttonTitle
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
//        configureContainerView()
//        configureTitleLabel()
//        configureActionButton()
//        configureMessageLabel()
//    }
//
//    //MARK: - Configure Container
//    func configureContainerView() {
//        view.addSubview(containerView)
//
//        containerView.backgroundColor                           = .systemBackground
//        containerView.layer.cornerRadius                        = 16
//        containerView.layer.borderWidth                         = 2
//        containerView.layer.borderColor                         = UIColor.white.cgColor
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            containerView.widthAnchor.constraint(equalToConstant: 280),
//            containerView.heightAnchor.constraint(equalToConstant: 220)
//        ])
//    }
//
//    //MARK: - Configure Title Label
//    func configureTitleLabel() {
//        containerView.addSubview(titleLabel)
//        titleLabel.text = alertTitle ?? "Something went wrong"
//
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
//            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//            titleLabel.heightAnchor.constraint(equalToConstant: 28)
//        ])
//    }
//
//    //MARK: - Configure Action Button
//    func configureActionButton() {
//        containerView.addSubview(actionButton)
//        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
//        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
//
//        NSLayoutConstraint.activate([
//            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
//            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,  constant: 20),
//            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//            actionButton.heightAnchor.constraint(equalToConstant: 44)
//        ])
//    }
//
//    //MARK: - Configure MessageLabel
//    func configureMessageLabel() {
//        containerView.addSubview(messageLabel)
//        messageLabel.text = message ?? "Unable to complete request"
//        messageLabel.numberOfLines = 4
//
//        NSLayoutConstraint.activate([
//            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
//            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
//
//        ])
//    }
//
//    //MARK: - Objc func for action button
//    @objc func dismissVC() {
//        dismiss(animated: true)
//    }
//}
extension UIWindow{
    
}
extension UIViewController {
    private static let association = ObjectAssociation<UIActivityIndicatorView>()
    
    var thisActivityIndicator: UIActivityIndicatorView {
        set { UIViewController.association[self] = newValue }
        get {
            if let indicator = UIViewController.association[self] {
                return indicator
            } else {
                UIViewController.association[self] = UIActivityIndicatorView.customIndicator(at: self.view.center)
                return UIViewController.association[self]!
            }
        }
    }
    
    // MARK: - Activity Indicator
    
    public func startIndicatingActivity() {
        DispatchQueue.main.async {
            self.view.addSubview(self.thisActivityIndicator)
            self.thisActivityIndicator.startAnimating()
        }
    }
    
    public func stopIndicatingActivity() {
        DispatchQueue.main.async {
            self.thisActivityIndicator.removeFromSuperview()
            self.thisActivityIndicator.stopAnimating()
        }
    }
}
public final class ObjectAssociation<T: AnyObject> {
    
    private let policy: objc_AssociationPolicy
    
    /// - Parameter policy: An association policy that will be used when linking objects.
    public init(policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
        
        self.policy = policy
    }
    
    /// Accesses associated object.
    /// - Parameter index: An object whose associated object is to be accessed.
    public subscript(index: AnyObject) -> T? {
        
        get { return objc_getAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque()) as! T? }
        set { objc_setAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque(), newValue, policy) }
    }
}
extension UIActivityIndicatorView {
    public static func customIndicator(at center: CGPoint) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        indicator.layer.cornerRadius = 0
        indicator.color = UIColor.black
        indicator.center = center
        indicator.backgroundColor = UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 0.5)
        indicator.hidesWhenStopped = true
        return indicator
    }
}
