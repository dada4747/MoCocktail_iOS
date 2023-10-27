//
//  RecipeDetaisVC.swift
//  MoCocktail
//
//  Created by Admin on 07/10/22.
//

import Foundation
import UIKit

class RecipeDetaisVC: UIViewController {
    enum OptionType {
        case Ingredent
        case Procedure
    }
    
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
    //    let view =UI
    let backButton: UIButton = {
        let btn = UIButton()
        btn.setImage(AppIcons.outline_arrow_right, for: .normal)
        btn.tintColor = .black
        btn.setHeight(height: 24)
        btn.setWidth(width: 24)
        return btn
    }()
    let optionsButton: UIButton = {
        let btn = UIButton()
        btn.setImage(AppIcons.outline_arrow_right, for: .normal)
        btn.tintColor = .black
        btn.setHeight(height: 24)
        btn.setWidth(width: 24)
        return btn
    }()
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImages.backgroundImage
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        //        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let ratingReviewView: UIView = {
        let view = UIView()
        //        view.backgroundColor = .gray
        view.setHeight(height: 20)
        return view
    }()
    
    private let starImage: UIImageView = {
        let img = UIImageView()
        img.image = AppIcons.bold_star
        img.setWidth(width: 16)
        img.setHeight(height: 16)
        return img
    }()
    let ratingCount = MCBodyLabel(font: AppFonts.SmallBold!, textAlignment: .left, text: "4.5")
    let reviewLabel = MCSmallLabel(font: AppFonts.smallRegular!, color: AppColors.appGray3)
    private let profilView : UIView = {
        let view = UIView()
        //        view.backgroundColor = .gray
        return view
    }()
    let profileImageView : UIImageView = {
        let img = UIImageView()
        img.setWidth(width: 41)
        img.setHeight(height: 41)
        img.layer.cornerRadius = 41/2
        img.image = AppImages.backgroundImage
        img.clipsToBounds = true
        return img
    }()
    let profileName = MCBodyLabel(font: AppFonts.normalBold!, textAlignment: .left, text: "Rahul Adusre")
    let followButton      = MCFillButton(backgroundColor: AppColors.appPrimary50,
                                         title: "Follow",
                                         font: AppFonts.normalBold!)
    private let locationImage: UIImageView = {
        let img = UIImageView()
        img.image = AppIcons.bold_location
        img.setWidth(width: 16)
        img.setHeight(height: 16)
        return img
    }()
    let locationLabel = MCSmallLabel(font: AppFonts.smallRegular!, color: AppColors.appGray3)
    
    let optionView: UIView = {
        let view = UIView()
        //        view.backgroundColor = .gray
        return view
    }()
    let ingridentButton      = MCOutlineButton(titleColor: .white,
                                               title: "Ingrident",
                                               font: AppFonts.normalBold!)
    
    let procedureButton      = MCOutlineButton(titleColor: AppColors.appPrimary50,
                                               title: "Procedure",
                                               font: AppFonts.normalBold!)
    
    let tbl_t : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.allowsSelection = false
        table.showsVerticalScrollIndicator = false
        table.register(IngridentTableViewCell.self, forCellReuseIdentifier: "IngridentTableViewCell")
        table.register(ProcedureTableViewCell.self, forCellReuseIdentifier: "ProcedureTableViewCell")
        return table
    }()
    
    let titleLabel = MCTitleLabel()
    
    
    var optionType : OptionType = .Ingredent
    let array = ["Far far away, behind the word mountains, far from the countries. Far far away, behind the word mountains, far from the countries.", "Far far away, behind the word mountains", "Far far away, behind the word mountains, far from the countries. Far far away, behind the word mountains, far from the countries.Far far away, behind the word mountains, far from the countries. Far far away, behind the word mountains, far from the countries.", "behind the word mountains, far from the countries.Far far away, behind the word mountains"]
    
    var recipe : Recipe?
    
    var array1 : [String] = []
    var array2 : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print(recipe)
        if recipe?.strMeasure1 != nil {
            array2.append((recipe?.strMeasure1)!)
        }else {
            array2.append("")
        }
        if recipe?.strMeasure2 != nil {
            array2.append((recipe?.strMeasure2)!)
        }else{
            array2.append("")
        }
        if recipe?.strMeasure3 != nil {
            array2.append((recipe?.strMeasure3)!)
        }else{
            array2.append("")
        }
        if recipe?.strMeasure4 != nil {
            array2.append((recipe?.strMeasure4)!)
        }else{
            array2.append("")
        }
        if recipe?.strMeasure5 != nil {
            array2.append((recipe?.strMeasure5)!)
        }else{
            array2.append("")
        }
        if recipe?.strMeasure6 != nil {
            array2.append((recipe?.strMeasure6)!)
        }else{
            array2.append("")
        }
        if recipe?.strMeasure7 != nil {
            array2.append((recipe?.strMeasure7)!)
        }else{
            array2.append("")
        }
        if recipe?.strMeasure8 != nil {
            array2.append((recipe?.strMeasure8)!)
        }else{
            array2.append("")
        }
        if recipe?.strMeasure9 != nil {
            array2.append((recipe?.strMeasure9)!)
        }else{
            array2.append("")
        }
        if recipe?.strMeasure10 != nil {
            array2.append((recipe?.strMeasure10)!)
        }else{
            array2.append("")
        }
        if recipe?.strMeasure11 != nil {
            array2.append((recipe?.strMeasure11)!)
        }else{
            array2.append("")
        }
        if recipe?.strMeasure12 != nil {
            array2.append((recipe?.strMeasure12)!)
        }else{
            array2.append("")
        }
        if recipe?.strMeasure13 != nil {
            array2.append((recipe?.strMeasure13)!)
        }else{
            array2.append("")
        }
        if recipe?.strMeasure14 != nil {
            array2.append((recipe?.strMeasure14)!)
        }else{
            array2.append("")
        }
        if recipe?.strMeasure15 != nil {
            array2.append((recipe?.strMeasure15)!)
        }else{
            array2.append("")
        }
        
        if recipe?.strIngredient1 != nil {
            array1.append((recipe?.strIngredient1)!)
        }
    if recipe?.strIngredient2 != nil {
        array1.append((recipe?.strIngredient2)!)
    }
         if recipe?.strIngredient3 != nil {
             array1.append((recipe?.strIngredient3)!)
         }
         if recipe?.strIngredient4 != nil {
             array1.append((recipe?.strIngredient4)!)
         }
         if recipe?.strIngredient5 != nil {
             array1.append((recipe?.strIngredient5)!)
         }
         if recipe?.strIngredient6 != nil {
             array1.append((recipe?.strIngredient6)!)
         }
         if recipe?.strIngredient7 != nil {
             array1.append((recipe?.strIngredient7)!)
         }
         if recipe?.strIngredient8 != nil {
             array1.append((recipe?.strIngredient8)!)
         }
         if recipe?.strIngredient9 != nil {
             array1.append((recipe?.strIngredient9)!)
         }
         if recipe?.strIngredient10 != nil {
             array1.append((recipe?.strIngredient10)!)
         }
         if recipe?.strIngredient11 != nil {
             array1.append((recipe?.strIngredient11)!)
         }
         if recipe?.strIngredient12 != nil {
             array1.append((recipe?.strIngredient12)!)
         }
         if recipe?.strIngredient13 != nil {
             array1.append((recipe?.strIngredient13)!)
         }
         if recipe?.strIngredient14 != nil {
             array1.append((recipe?.strIngredient14)!)
         }
         if recipe?.strIngredient15 != nil {
             array1.append((recipe?.strIngredient15)!)
         }
         
         
        
         // recipe?.strMeasure1
         print(recipe)
//        navigationController?.isNavigationBarHidden = false
//        navigationController?.isToolbarHidden = false
        
        ingridentButton.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
        procedureButton.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)

        view.backgroundColor = .white
        setBackButton()
        setupScrollView()
        setUp()
        setUpPosterImage()
        setupRatingReivew()
        setupProfilView()
        setupOptionView()
        setUpTableView()
        lastViewConfig()
        
        // Do any additional setup after loading the view.
    }
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
                                        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
                                        scrollView.topAnchor.constraint(equalTo: backButton.bottomAnchor),
                                        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                                        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                                        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)])
    }
    func setBackButton(){
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 14, paddingLeft: 20)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    func setUp(){
        contentView.addSubview(optionsButton)
        optionsButton.anchor(top: contentView.topAnchor, right: contentView.rightAnchor, paddingTop: 14, paddingRight: 20)
        contentView.addSubview(titleLabel)
        titleLabel.font = AppFonts.headerBold
        titleLabel.numberOfLines = 0
                titleLabel.text = "How to make french toast"
        titleLabel.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 16, paddingLeft: 20,paddingRight: 20)

    }
    func setUpPosterImage(){
        contentView.addSubview(posterImageView)
        posterImageView.anchor(top: titleLabel.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20, height: 200)
    }
    
    func setupRatingReivew(){
        contentView.addSubview(ratingReviewView)
        ratingReviewView.anchor(top: posterImageView.bottomAnchor, left: contentView.leftAnchor, paddingTop: 14, paddingLeft: 20, height: 20)
        ratingReviewView.addSubview(starImage)
        starImage.translatesAutoresizingMaskIntoConstraints = false
        starImage.centerYAnchor.constraint(equalTo: ratingReviewView.centerYAnchor).isActive = true
        starImage.anchor(left: ratingReviewView.leftAnchor)
        ratingReviewView.addSubview(ratingCount)
        ratingCount.anchor(top: ratingReviewView.topAnchor, left: starImage.rightAnchor, bottom: ratingReviewView.bottomAnchor, paddingLeft: 3)
        reviewLabel.text = "(300 Reviews)"
        ratingReviewView.addSubview(reviewLabel)
        reviewLabel.anchor(top: ratingReviewView.topAnchor, left: ratingCount.rightAnchor, bottom: ratingReviewView.bottomAnchor, right: ratingReviewView.rightAnchor,paddingLeft: 3, paddingRight: 5)
        
    }
    func setupProfilView(){
        contentView.addSubview(profilView)
        
        profilView.anchor(top: ratingReviewView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 16, paddingLeft: 20, paddingRight: 20, height: 41)
        
        profilView.addSubview(profileImageView)
        profileImageView.anchor(left: profilView.leftAnchor)
        profilView.addSubview( followButton)
        followButton.anchor(top: profilView.topAnchor, bottom: profilView.bottomAnchor, right: profilView.rightAnchor, paddingTop: 3, paddingBottom: 3, paddingRight: 0, width: 77)
        profilView.addSubview(profileName)
        profileName.anchor(top: profilView.topAnchor, left: profileImageView.rightAnchor,right: followButton.leftAnchor, paddingLeft: 10, paddingRight: 20, height: 22)
        profilView.addSubview(locationImage)
//        locationImage.centerYAnchor.constraint(equalTo)
        locationImage.anchor(top: profileName.bottomAnchor, left: profileImageView.rightAnchor, bottom: profilView.bottomAnchor, paddingTop: 2, paddingLeft: 10)
        profilView.addSubview(locationLabel)
        locationLabel.text = "Rahuri, Umbare"
        locationLabel.anchor(left: locationImage.rightAnchor, bottom: profilView.bottomAnchor, right: followButton.leftAnchor,paddingLeft: 4, paddingBottom: 0, paddingRight: 20, height: 20)
        
    }
    func setupOptionView(){
        contentView.addSubview(optionView)
        optionView.anchor(top: profilView.bottomAnchor,left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 14, height: 58)
        ingridentButton.setFill(titleColor: .white, backgroundColor: AppColors.appPrimary50)
        optionView.addSubview(ingridentButton)
        ingridentButton.widthAnchor.constraint(equalTo: optionView.widthAnchor, multiplier: 0.5, constant: -37.5).isActive = true
        ingridentButton.anchor(top: optionView.topAnchor, left: optionView.leftAnchor,bottom: optionView.bottomAnchor, paddingTop: 12, paddingLeft: 30, paddingBottom: 12)
        procedureButton.setFill(titleColor: AppColors.appPrimary50, backgroundColor: .white)

        optionView.addSubview(procedureButton)
        procedureButton.anchor(top: optionView.topAnchor, left: ingridentButton.rightAnchor, bottom: optionView.bottomAnchor, right: optionView.rightAnchor, paddingTop: 12, paddingLeft: 15, paddingBottom: 12, paddingRight: 30)
        

        
    }
    func setUpTableView(){
        contentView.addSubview(tbl_t)
        tbl_t.translatesAutoresizingMaskIntoConstraints = false
        tbl_t.delegate = self
        tbl_t.dataSource = self
           tbl_t.rowHeight = UITableView.automaticDimension
//        tbl_t.estimatedRowHeight = 76
        tbl_t.separatorStyle = .none
        tbl_t.backgroundColor = .clear
        tbl_t.anchor(top: optionView.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, height: 400)
    }
    let lastView: UIView  = {
        let v             = UIView()
        v.backgroundColor = .gray
        return v
    }()
    func lastViewConfig(){
        contentView.addSubview(lastView)
        lastView.backgroundColor = .gray
        lastView.anchor(top: tbl_t.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 20)
        
    }
    @objc func backAction(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func optionButtonTapped(_ sender: MCOutlineButton) {
            // Handle button tap event here
            if sender == ingridentButton {
                optionType = .Ingredent
                ingridentButton.setFill(titleColor: .white, backgroundColor: AppColors.appPrimary50)
                procedureButton.setFill(titleColor: AppColors.appPrimary50, backgroundColor: .white)
            } else if sender == procedureButton {
                optionType = .Procedure
                ingridentButton.setFill(titleColor: AppColors.appPrimary50 , backgroundColor: .white)
                procedureButton.setFill(titleColor: .white, backgroundColor: AppColors.appPrimary50 )
            }
        reloadData()
        }
    func reloadData(){
        tbl_t.reloadData()
    }
    
}

extension RecipeDetaisVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if optionType == .Ingredent {
            return array1.count
        }else {
            return array.count
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if optionType == .Ingredent {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "IngridentTableViewCell") as? IngridentTableViewCell else {fatalError("tb cell not created")}
            cell.ingridentLabel.text = array1[indexPath.row]
//            let value =
//                cell.ingridentValue.text = array2[indexPath.row]
            
            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProcedureTableViewCell") as? ProcedureTableViewCell else {fatalError("tb cell not created")}
            
            cell.ingridentDesc.text = array[indexPath.row]
            cell.ingridentLabel.text = "Step \(indexPath.row + 1)"
            return cell
            }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if optionType == .Ingredent {
            return UITableView.automaticDimension
        }else {
            return UITableView.automaticDimension
        }

    }
}
