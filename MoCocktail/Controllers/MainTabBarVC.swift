//
//  MainTabBarVC.swift
//  MoCocktail
//
//  Created by Admin on 31/08/22.
//

import UIKit

class MainTabBarVC: UITabBarController {
    //MARK: - LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = { () -> AppTabBar in
            let tabBar = AppTabBar()
            tabBar.itemPositioning = .fill
            tabBar.delegate = self
            return tabBar
        }()
//        navigationController.
        self.setValue(tabBar, forKey: "tabBar")
        setupMiddleButton()
        let vc1 = UINavigationController(rootViewController: HomeVC())
        let vc2 = UINavigationController(rootViewController: SavedRecipesVC())
        let vc3 = UINavigationController(rootViewController: CreateRecipeVC())
        let vc4 = UINavigationController(rootViewController: NotificationsVC())
        let vc5 = UINavigationController(rootViewController: ProfileVC())
        vc1.isNavigationBarHidden = true
        vc1.navigationController?.isNavigationBarHidden = true
        vc1.navigationController?.isToolbarHidden = true

        vc1.tabBarItem.image =  AppIcons.outline_home!.resizeImage(targetSize: CGSize(width: 24, height: 24))
        vc2.tabBarItem.image = AppIcons.outline_nav!.resizeImage(targetSize: CGSize(width: 24, height: 24))
        vc3.tabBarItem.image = AppIcons.bold_star!.resizeImage(targetSize: CGSize(width: 1, height: 1))
        vc4.tabBarItem.image = AppIcons.outline_notification!.resizeImage(targetSize: CGSize(width: 24, height: 24))
        vc5.tabBarItem.image = AppIcons.outline_profile!.resizeImage(targetSize: CGSize(width: 24, height: 24))
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
        tabBar.tintColor = AppColors.appPrimary50
        view.backgroundColor = .white
        
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tabBar.itemPositioning = .centered
//        self.tabBar.itemSpacing = UIScreen.main.bounds.width / 8
    }
    //MARK: -  Methods
    func setupMiddleButton() {
        let middleBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-25, y: -20, width: 50, height: 50))
        middleBtn.layer.cornerRadius = middleBtn.frame.size.width / 2
        middleBtn.backgroundColor = AppColors.appPrimary50
        middleBtn.setImage(AppIcons.ic_plus?.resizeImage(targetSize: CGSize(width: 24, height: 24)), for: .normal)
        self.tabBar.addSubview(middleBtn)
        middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)
        self.view.layoutIfNeeded()
    }
    //MARK: - OBJC Funcs
    // Menu Button Touch Action
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 2   //to select the middle tab. use "1" if you have only 3 tabs.
    }
    
}
//MARK: - Custom tab bar

class AppTabBar: UITabBar {
    
    private var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        self.addShape()
        
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = #colorLiteral(red: 0.9782002568, green: 0.9782230258, blue: 0.9782107472, alpha: 1)
        shapeLayer.lineWidth = 0.5
        shapeLayer.shadowOffset = CGSize(width:0, height:0)
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowColor = UIColor.gray.cgColor
        shapeLayer.shadowOpacity = 0.1
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    func createPath() -> CGPath {
        let height: CGFloat = 86.0
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - height ), y: 0))
        path.addCurve(to: CGPoint(x: centerWidth, y: height - 40),
                      controlPoint1: CGPoint(x: (centerWidth - 30), y: 0), controlPoint2: CGPoint(x: centerWidth - 35, y: height - 40))
        path.addCurve(to: CGPoint(x: (centerWidth + height ), y: 0),
                      controlPoint1: CGPoint(x: centerWidth + 35, y: height - 40), controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        return path.cgPath
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        for member in subviews.reversed() {
            let subPoint = member.convert(point, from: self)
            guard let result = member.hitTest(subPoint, with: event) else { continue }
            return result
        }
        return nil
    }
}
//MARK: -
