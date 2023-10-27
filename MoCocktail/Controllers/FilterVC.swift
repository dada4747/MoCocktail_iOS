//
//  FilterVC.swift
//  MoCocktail
//
//  Created by Admin on 30/09/22.
//

import UIKit

class FilterVC: UIViewController {
    let bottomSheet : UIView = {
        let view = UIView()
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        view.layer.cornerRadius = 50
        view.backgroundColor = .white
        
        return view
    }()
    let line = MCLineView(color: AppColors.appGray3)
    let titleLabel = MCBodyLabel(font:  AppFonts.normalBold!, textAlignment: .center, text: "Filter Search")
    let type_label = MCBodyLabel(font:  AppFonts.normalBold!, textAlignment: .center, text: "Type")
    let rate_label = MCBodyLabel(font:  AppFonts.normalBold!, textAlignment: .center, text: "Rate")
    let category_label = MCBodyLabel(font:  AppFonts.normalBold!, textAlignment: .center, text: "Category")

    let typ_array : [String] = ["all", "alchoholic", "non-alcoholic", "optional"]
    let category_array : [String] = ["all", "alchoholic", "non-alcoholic", "optional", "veg", "glass"]
    let rate_array : [String] = ["5", "4", "2", "3", "1"]
    var selectedType: String? = "all"
    var selectedRating: String?
    var selectedCAtegory: String?
    private let type_collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
//        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        return collectionView
    }()
    
    private let rate_collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
//        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        return collectionView
    }()
    private let category_collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
//        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setUpBottomSheet()
        setUpLine()
        setUptitleLabel()
        setUptype_label()
        setUpTypeCollectionView()
        setUprate_label()
        setUpRateCollectionView()
        
        setUpcategory_label()
        setUpCategory_collectionView()
//        setupc
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    func setUpBottomSheet(){
        view.addSubview(bottomSheet)
        bottomSheet.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    func setUpLine(){
        bottomSheet.addSubview(line)
        line.centerX(inView: bottomSheet)
        line.anchor(top: bottomSheet.topAnchor, paddingTop: 10, width: 100, height: 2)
    }
    func setUptitleLabel(){
        bottomSheet.addSubview(titleLabel)
        titleLabel.centerX(inView: bottomSheet)
        titleLabel.anchor(top: line.bottomAnchor, paddingTop: 11.5, height: 21)
    }
    func setUptype_label(){
        bottomSheet.addSubview(type_label)
        type_label.textAlignment = .left
        type_label.anchor(top: titleLabel.bottomAnchor, left: bottomSheet.leftAnchor, right: bottomSheet.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10, height: 21)
    }
    
    func setUpTypeCollectionView(){
        type_collectionView.delegate = self
        type_collectionView.dataSource = self
        type_collectionView.isScrollEnabled = false

        bottomSheet.addSubview(type_collectionView)
        type_collectionView.anchor(top: type_label.bottomAnchor, left: bottomSheet.leftAnchor, right: bottomSheet.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10, height: 78)
    }
    func setUprate_label() {
        bottomSheet.addSubview(rate_label)
        rate_label.textAlignment = .left
        rate_label.anchor(top: type_collectionView.bottomAnchor, left: bottomSheet.leftAnchor, right: bottomSheet.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10, height: 21)
        
    }
    func setUpRateCollectionView(){
        rate_collectionView.delegate = self
        rate_collectionView.dataSource = self
        rate_collectionView.isScrollEnabled = false

        bottomSheet.addSubview(rate_collectionView)
        rate_collectionView.anchor(top: rate_label.bottomAnchor, left: bottomSheet.leftAnchor, right: bottomSheet.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10, height: 34)
    }
    
    func setUpcategory_label() {
        bottomSheet.addSubview(category_label)
        category_label.textAlignment = .left
        category_label.anchor(top: rate_collectionView.bottomAnchor, left: bottomSheet.leftAnchor, right: bottomSheet.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10, height: 21)
    }
    func setUpCategory_collectionView(){
        category_collectionView.delegate = self
        category_collectionView.dataSource = self
        category_collectionView.isScrollEnabled = false

        bottomSheet.addSubview(category_collectionView)
        category_collectionView.anchor(top: category_label.bottomAnchor, left: bottomSheet.leftAnchor, bottom: bottomSheet.bottomAnchor, right: bottomSheet.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 20, paddingRight: 10)
    }
}
extension FilterVC : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.type_collectionView {

        return typ_array.count// sectionTitles.count
        } else if collectionView == self.rate_collectionView {
            return rate_array.count
        } else {
            return category_array.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.type_collectionView {
            let item = typ_array[indexPath.item]//[indexPath.row]
                   let itemWidth = item.size(withAttributes: [
                       NSAttributedString.Key.font :AppFonts.SmallBold!
                   ]).width + 10
            
            return CGSize(width: itemWidth, height: 34)
            
        } else if collectionView == self.category_collectionView {
            let item = category_array[indexPath.item]//[indexPath.row]
                   let itemWidth = item.size(withAttributes: [
                       NSAttributedString.Key.font :AppFonts.SmallBold!
                   ]).width + 10
            
            return CGSize(width: itemWidth, height: 34)
            
        } else  {
            return CGSize(width: 51 , height: 28)
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell

        if collectionView == self.type_collectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.subTitle.text = typ_array [indexPath.item]//sectionTitles[indexPath.row]
            if selectedType == typ_array[indexPath.row]
            {
                cell.view.backgroundColor = AppColors.appPrimary50
                cell.subTitle.textColor = .white
            }
            else
            {
                cell.subTitle.textColor = AppColors.appPrimary50
                cell.view.backgroundColor = .white
                cell.layer.borderColor = AppColors.appPrimary50.cgColor
                cell.layer.borderWidth = 1
                cell.layer.cornerRadius = 10

            }
            
//            return cell
            
        } else if collectionView == self.category_collectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            
            cell.subTitle.text = category_array [indexPath.item]//sectionTitles[indexPath.row]
        
            if selectedCAtegory == category_array[indexPath.row]
                
            {
                
                cell.view.backgroundColor = AppColors.appPrimary50
                cell.subTitle.textColor = .white
            }
            else
            {
                
                cell.subTitle.textColor = AppColors.appPrimary50
                cell.view.backgroundColor = .white
                cell.layer.borderColor = AppColors.appPrimary50.cgColor
                cell.layer.borderWidth = 1
                cell.layer.cornerRadius = 10

            }
            
//            return cell
            
        } else {
            let img : UIImageView = {
                let i = UIImageView()
                i.image = AppIcons.bold_star
                i.translatesAutoresizingMaskIntoConstraints =  false
                return i
            }()

            cell.view.addSubview(img)
            cell.subTitle.text = rate_array [indexPath.item]//sectionTitles[indexPath.row]
            img.anchor(top: cell.view.topAnchor, right: cell.view.rightAnchor, paddingTop: 5, paddingRight: 5, width: 12, height: 12)
            if selectedRating == rate_array[indexPath.row]
                
            {
                img.image = AppIcons.bold_star_wt

                cell.view.backgroundColor = AppColors.appPrimary50
                cell.subTitle.textColor = .white
            }
            else
            {
//                cell.view.addSubview(img)
                img.image = AppIcons.bold_star
//                img.anchor(top: cell.view.topAnchor, right: cell.view.rightAnchor, paddingTop: 5, paddingRight: 5, width: 12, height: 12)
                
                cell.subTitle.textColor = AppColors.appPrimary50
                cell.view.backgroundColor = .white
                cell.layer.borderColor = AppColors.appPrimary50.cgColor
                cell.layer.borderWidth = 1
                cell.layer.cornerRadius = 10

            }
            
//            return cell //UICollectionViewCell()
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.type_collectionView {
            selectedType = typ_array[indexPath.row]
//            selectedIndex = indexPath.row
//            loadSubCollection(c: catViewModel.arrayOfList[indexPath.row].strCategory)
            self.type_collectionView.reloadData()
        }else if collectionView == self.category_collectionView {
            selectedCAtegory = category_array[indexPath.row]
            self.category_collectionView.reloadData()
        }else {
            selectedRating = rate_array[indexPath.row]
            self.rate_collectionView.reloadData()
        }
    }
}
