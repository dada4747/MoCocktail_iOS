//
//  ViewController3.swift
//  MoCocktail
//
//  Created by Admin on 29/09/22.
//

import UIKit

class ViewController3: UIViewController {
    let backButton: UIButton = {
        let btn = UIButton()
        btn.setImage(AppIcons.outline_arrow_right, for: .normal)
        btn.tintColor = .black
        btn.setHeight(height: 20)
        btn.setWidth(width: 20)
        return btn
    }()
    let titleLabel = MCTitleLabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        //        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .lightGray
        setBackButton()
        
        // Do any additional setup after loading the view.
    }
    func setBackButton(){
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 14, paddingLeft: 30)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(titleLabel)
        titleLabel.text = "Search recipes"
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: backButton.rightAnchor, paddingTop: 10, paddingLeft: 69, width: 136, height: 27)
    }
    @objc func backAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
