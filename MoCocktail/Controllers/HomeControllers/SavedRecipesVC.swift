//
//  SavedRecipesVC.swift
//  MoCocktail
//
//  Created by Admin on 31/08/22.
//

import UIKit

class SavedRecipesVC: UIViewController {
    let headerView : UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.setHeight(height: 69)

        return v
    }()
    
    let titleLabel = MCTitleLabel()
    
    let tbl_t : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.allowsSelection = false
        table.showsVerticalScrollIndicator = false
        table.register(IngridentTableViewCell.self, forCellReuseIdentifier: "IngridentTableViewCell")
        return table
    }()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 236, height: 254)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .gray
        collectionView.register(TrendCollectionViewCell.self, forCellWithReuseIdentifier: "TrendCollectionViewCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        configureUI()
        
//        title = "Saved"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("asdfghk")
    }
    func configureUI(){
        setHeaderUI()
        setUpCollectionView()
    }
    func setHeaderUI(){
        view.addSubview(headerView)
        
        headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0)
        headerView.addSubview(titleLabel)
        titleLabel.text = "Saved recipes"
        titleLabel.font = AppFonts.largeBold
        titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive =  true
        titleLabel.anchor(left: headerView.leftAnchor, paddingLeft: 22, height: 29)
        
    }
    func setUpCollectionView(){
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.anchor(top: headerView.bottomAnchor, left: view.leftAnchor,bottom: view.bottomAnchor, right: view.rightAnchor)
        collectionView.reloadData()
    }
}
extension SavedRecipesVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendCollectionViewCell", for: indexPath) as? TrendCollectionViewCell
        //    cell!.setData(model: viewModel.arrayOfList.prefix(10)[indexPath.row])// distance(from: 0, to: 10)[indexPath.row])
        
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10//viewModel.arrayOfList.prefix(10).count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 40, height: 254)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 20)
    }
}
