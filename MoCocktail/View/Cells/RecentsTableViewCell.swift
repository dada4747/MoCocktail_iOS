//
//  RecentsTableViewCell.swift
//  MoCocktail
//
//  Created by Admin on 13/09/22.
//

import UIKit

class RecentsTableViewCellCell: UITableViewCell {
    static let identifier = "RecentsTableViewCellCell"
    let cellTitle = MCBodyLabel(font: AppFonts.largeBold!, textAlignment: .left, text: "Recents")
    
    let seeAllTitle = MCBodyLabel(font: AppFonts.SmallBold!, textAlignment: .center, text: "See All")
    let rightArrow : UIButton = {
        let btn = UIButton()
        btn.setImage(AppIcons.bold_arrow_right, for: .normal)
        return btn
    }()
    var viewModel = RecentsViewModel()
    var recipeViewModel = RecipeDetailViewModel()
    var cellDelegate: SelectCellIdProtocol?

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 124, height: 195)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(RecentRecipe.self, forCellWithReuseIdentifier: "RecentRecipe")
        return collectionView
    }()
//    var sc : Sec = .Trend
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        collectionView.delegate = self
        collectionView.dataSource = self
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadRecents(){
        viewModel.getListData()
        viewModel.reloadList = { [weak self] ()  in
                   DispatchQueue.main.async {
                       self?.collectionView.reloadData()
                   }
               }
        viewModel.errorMessage = { [weak self] (message)  in
            DispatchQueue.main.async {
                print(message)
//                self?.activityIndicator.stopAnimating()
            }
        }
        
    }
    func configure() {
        contentView.addSubview(cellTitle)
        cellTitle.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, paddingTop: 12, paddingLeft: 20, width: 164, height: 28)
        contentView.addSubview(rightArrow)
        rightArrow.anchor(top: contentView.topAnchor, right: contentView.rightAnchor, paddingTop: 16, paddingRight: 20, width: 20, height: 20)
        contentView.addSubview(seeAllTitle)
        seeAllTitle.anchor(top: contentView.topAnchor, left: cellTitle.rightAnchor, right: rightArrow.leftAnchor, paddingTop: 16,paddingLeft: 100, paddingRight: 4, height: 20)
        contentView.addSubview(collectionView)
        collectionView.anchor(top: cellTitle.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 10, paddingRight: 0)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
//        collectionView.frame = contentView.bounds
    }
    
}
extension RecentsTableViewCellCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: 124, height: 195)
//
//    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentRecipe", for: indexPath) as? RecentRecipe
//        let mo = CellViewModel.init(model: moles[indexPath.row])
        cell?.setData(viewModel: viewModel.arrayOfList.prefix(10)[indexPath.row])// distance(from: 0, to: 10)[indexPath.row])
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  viewModel.arrayOfList.prefix(10).count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        print(viewModel.arrayOfList[indexPath.row])
        
        recipeViewModel.getRecepiDetail(id: viewModel.arrayOfList[indexPath.row].idDrink)
        recipeViewModel.reloadDetail  = { [weak self] ()  in
            DispatchQueue.main.async {
                self?.cellDelegate?.selectedCellId(recepiId: (self?.recipeViewModel.recipeDetail!)!)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
    }
}

class RecentRecipe: UICollectionViewCell {
    static let identifier = "RecentRecipe"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = AppImages.backgroundImage
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let imageTitle = MCBodyLabel(font: AppFonts.normalBold!, textAlignment: .left, text: "Recent Collection Cell")
    let subTitle = MCBodyLabel(font: AppFonts.smallRegular!, textAlignment: .left, text: "subtitle")
    
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
    
    func setData(viewModel: Drink){
        subTitle.text = viewModel.idDrink
        imageTitle.text = viewModel.strDrink
//        let url : URL = URL.init(string: viewModel.strDrinkThumb)!
//        posterImageView.sd_setImage(with: url, completed: nil)
        service.shared.downloadImage(from: viewModel.strDrinkThumb) { image, data, error in
           DispatchQueue.main.async {
               self.posterImageView.image = image
//               self.alert.stopAnimating();

           }
       }
        
    }
    func configure() {
//        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10 // Set the corner radius of the content view (optional)
                contentView.layer.masksToBounds = false
                contentView.layer.shadowColor = UIColor.black.cgColor
                contentView.layer.shadowOffset = CGSize(width: 0, height: 2) // Set the shadow's offset (x, y)
                contentView.layer.shadowOpacity = 0.3 // Set the shadow's opacity
                contentView.layer.shadowRadius = 4
//        contentView.layer.borderWidth = 1
//        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.addSubview(posterImageView)
        posterImageView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, height: 124)
        contentView.addSubview(imageTitle)
        imageTitle.numberOfLines = 0
        imageTitle.anchor(top: posterImageView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 08, paddingLeft: 0, paddingRight: 5)
        contentView.addSubview(subTitle)
        subTitle.anchor(top: imageTitle.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingRight: 5, height: 17)
        
    }
    
}
