//
//  PopularCreatorTableViewCell.swift
//  MoCocktail
//
//  Created by Admin on 14/09/22.
//

import UIKit

class PopularCreatorTableViewCell: UITableViewCell {
    static let identifier = "PopularCreatorTableViewCell"
    let cellTitle = MCBodyLabel(font: AppFonts.largeBold!, textAlignment: .left, text: "Popular creators")
    
    let seeAllTitle = MCBodyLabel(font: AppFonts.SmallBold!, textAlignment: .center, text: "See All")
    let rightArrow : UIButton = {
        let btn = UIButton()
        btn.setImage(AppIcons.bold_arrow_right, for: .normal)
        return btn
    }()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 75, height: 119)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CreatorCell.self, forCellWithReuseIdentifier: "CreatorCell")
        return collectionView
    }()
    var sc : Sec = .Trend
    var viewModel = RecentsViewModel()
    var recipeViewModel = RecipeDetailViewModel()
    var cellDelegate: SelectCellIdProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        collectionView.delegate = self
        collectionView.dataSource = self
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func laodCreator(){
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
        collectionView.anchor(top: cellTitle.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 12, paddingRight: 0)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
}
extension PopularCreatorTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 75, height: 140)
    
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreatorCell", for: indexPath) as? CreatorCell
        cell!.setData(viewModel: viewModel.arrayOfList.prefix(10)[indexPath.row])
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.arrayOfList.prefix(10).count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        recipeViewModel.getRecepiDetail(id: viewModel.arrayOfList[indexPath.row].idDrink)
        recipeViewModel.reloadDetail  = { [weak self] ()  in
            DispatchQueue.main.async {
                self?.cellDelegate?.selectedCellId(recepiId: (self?.recipeViewModel.recipeDetail!)!)
            }
        }
    }
}
class CreatorCell: UICollectionViewCell {

    static let identifier = "CreatorCell"
    let imgview : UIImageView = {
        let img = UIImageView()
        
//        img.image = AppImages.backgroundImage
        img.setHeight(height: 75)
        img.layer.cornerRadius = 75/2
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        return img
    }()
    let imageTitle = MCBodyLabel(font: AppFonts.SmallBold!, textAlignment: .center, text: "Rahul Adsure")
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
//        subTitle.text = viewModel.idDrink
        imageTitle.text = viewModel.strDrink
        let url : URL = URL.init(string: viewModel.strDrinkThumb)!
        imgview.sd_setImage(with: url, completed: nil)
        
    }
    
    func configure() {
//        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10 // Set the corner radius of the content view (optional)
        contentView.layer.masksToBounds = false
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2) // Set the shadow's offset (x, y)
        contentView.layer.shadowOpacity = 0.3 // Set the shadow's opacity
        contentView.layer.shadowRadius = 4
        contentView.addSubview(imgview)
        imgview.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, height: 75)
        
        contentView.addSubview(imageTitle)
        imageTitle.numberOfLines = 0
        imageTitle.textAlignment = .center
        
        imageTitle.anchor(top: imgview.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 08, paddingLeft: 8, paddingRight: 8)
        
    }
    
}
