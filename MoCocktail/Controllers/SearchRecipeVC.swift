//
//  ViewController2.swift
//  MoCocktail
//
//  Created by Admin on 28/09/22.
//

import UIKit

@available(iOS 15.0, *)
class SearchRecipeVC: UIViewController {
    let backButton: UIButton = {
        let btn = UIButton()
        btn.setImage(AppIcons.arrowLeft, for: .normal)
        btn.clipsToBounds = true
        btn.contentMode = .scaleToFill
        btn.setHeight(height: 24)
        btn.setWidth(width: 24)
        return btn
    }()
    let searchTextField = MCTextField()
    let searchButton = MCInputTextField()
    let filter = MCShadowButton(icon: AppIcons.outline_setting!)
    let titleLabel = MCTitleLabel()
    let countLabel = MCSmallLabel(font: AppFonts.SmallerRegular!, color: AppColors.appGray3)
    let subTitle = MCBodyLabel(font: AppFonts.normalBold!, textAlignment: .left, text: "Search Result")
    var searchMainArray : [Drink] = []
    
    var searchDisplayArray : [Drink] = []
    var viewmodel = SearchedRecipeViewModel()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: ((view.frame.size.width / 2) - 55), height: 254)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(RecipeCell.self, forCellWithReuseIdentifier: "RecipeCell")
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = AppColors.appWhite
        collectionView.dataSource = self
        collectionView.delegate = self
        setBackButton()
        setupFilter()
        setUpSearch()
        setUpSubtitle()
        setUpCountLabel()
        setUpCollectionView()
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        // Do any additional setup after loading the view.
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        viewmodel.getSearchListData(searchKey: textField.text!)
        viewmodel.reloadList = {
            [weak self] ()  in
                       DispatchQueue.main.async {
                           self?.collectionView.reloadData()
                           self?.countLabel.text = "\(self?.viewmodel.count ?? 0) results"

                       }
        }
        print(textField.text)
        print(viewmodel.arrayOfList)
    }
    func setBackButton(){
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 14, paddingLeft: 20)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(titleLabel)
        titleLabel.text = "Search recipes"
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: backButton.rightAnchor, paddingTop: 10, paddingLeft: 69, width: 136, height: 27)
    }
    @objc func backAction(){
//        self.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
  
    func setupFilter(){
        view.addSubview(filter)
        filter.anchor(top: titleLabel.bottomAnchor, right: view.rightAnchor, paddingTop: 17, paddingRight: 20, width: 40, height: 40)
        filter.backgroundColor = AppColors.appPrimary50
        filter.layer.borderWidth = 0
        filter.tintColor = .white
//        filter.layer.borderColor = .clear
        filter.addTarget(target: self, action: #selector(showFilter), forEvent: .touchUpInside)
    }
    func setUpSearch(){
        view.addSubview(searchButton)
        searchButton.set(image: AppIcons.outline_search_normal, placeholder: "Search", height: 40, textField: searchTextField)
        searchButton.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor,right: filter.leftAnchor, paddingTop: 17, paddingLeft: 20, paddingRight: 20, height: 40)
        
    }
    func setUpCountLabel(){
        view.addSubview(countLabel)
//        countLabel.text = "123 results"
        countLabel.textAlignment = .right
        countLabel.anchor(top: filter.bottomAnchor, right: view.rightAnchor, paddingTop: 24, paddingRight: 20, height: 17)
    }
    func setUpSubtitle(){
        view.addSubview(subTitle)
        
        subTitle.anchor(top: searchButton.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 20, width: 118, height: 24)
    }
    func setUpCollectionView(){
        view.addSubview(collectionView)
        collectionView.anchor(top: subTitle.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
    }
    @objc func showFilter(){
//
//        let detailViewController = FilterVC()
//            let nav = UINavigationController(rootViewController: detailViewController)
//            // 1
//        nav.modalPresentationStyle =  .pageSheet
//
//
//            // 2
//            if let sheet = nav.sheetPresentationController {
//
//                // 3
//                sheet.detents = [.medium()]
//
//            }
//            // 4
//            present(nav, animated: true, completion: nil)

       
    }
}
@available(iOS 15.0, *)
extension SearchRecipeVC: UICollectionViewDelegate,  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as? RecipeCell
        cell?.setData(viewModel: (viewmodel.arrayOfList[indexPath.row]) )
//        cell.backgroundColor = .gray
//        cell!.posterImageView.image = AppImages.backgroundImage
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.size.width / 2) - 10
        return CGSize(width: itemSize, height: itemSize)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = RecipeDetaisVC()
        vc.recipe = viewmodel.arrayOfList[indexPath.row]
//        vc.navigationController?.isToolbarHidden = false
//        vc.navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(vc, animated: true)
        
    }
}



class RecipeCell: UICollectionViewCell {
    static let identifier = "RecipeCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImages.backgroundImage
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let imageTitle = MCBodyLabel(font: AppFonts.normalBold!, textAlignment: .left, text: "Recepe CollectionView Cell for all ")
    let subTitle = MCBodyLabel(font: AppFonts.SmallerRegular!, textAlignment: .left, text: "By Chef John")
    let ratingView : UIView = {
        let img = UIImageView()
        img.image = AppIcons.bold_star
        img.setHeight(height: 8)
        img.setWidth(width: 8)
        let lbl = UILabel()
        lbl.text = "4.0"
        lbl.font = AppFonts.ToSmallerRegular
        lbl.setHeight(height: 8)
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
//        view.layer.cor
        view.setHeight(height: 16)
        view.setWidth(width: 37)
        view.addSubview(img)
        img.centerY(inView: view)
        img.anchor(left: view.leftAnchor, paddingLeft: 7)
        view.addSubview(lbl)
        lbl.centerY(inView: view)
        lbl.anchor(left: img.rightAnchor, paddingLeft: 7, width: 8)
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        posterImageView.frame = contentView.bounds
    }
    
    func setData(viewModel: Recipe){
        subTitle.text = viewModel.idDrink
        imageTitle.text = viewModel.strDrink
        let url : URL = URL.init(string: viewModel.strDrinkThumb!)!
        posterImageView.sd_setImage(with: url, completed: nil)
        
    }
    func configure() {
        contentView.addSubview(posterImageView)
        posterImageView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor,bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        posterImageView.addSubview(subTitle)
        subTitle.textColor = AppColors.appGray3
        subTitle.anchor(left: posterImageView.leftAnchor, bottom: posterImageView.bottomAnchor, right: posterImageView.rightAnchor, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, height: 12)
        posterImageView.addSubview(imageTitle)
        imageTitle.numberOfLines = 0
        imageTitle.textColor = .white
        imageTitle.anchor(left: posterImageView.leftAnchor, bottom: subTitle.topAnchor, right: posterImageView.rightAnchor, paddingLeft: 10, paddingBottom: 3, paddingRight: 10)

        posterImageView.addSubview(ratingView)
        ratingView.anchor(top: posterImageView.topAnchor, right: posterImageView.rightAnchor, paddingTop: 10, paddingRight: 10, height: 16)
    }
    
}

