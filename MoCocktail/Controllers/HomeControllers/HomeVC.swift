//
//  HomeVC.swift
//  MoCocktail
//
//  Created by Admin on 31/08/22.
//

import UIKit

class HomeVC: UIViewController, SelectCellIdProtocol{
    func selectedCellId(recepiId: Recipe) {
        print(recepiId)
        let vc = RecipeDetaisVC()
               vc.recipe = recepiId
       //        vc.navigationController?.isToolbarHidden = false
       //        vc.navigationController?.isNavigationBarHidden = false
               navigationController?.pushViewController(vc, animated: true)
        
    }
    
    var headerView = MainTableHeader()
    let tbl_t : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.allowsSelection = false
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        table.register(TrendingNowTableViewCellCell.self, forCellReuseIdentifier: "TendingNowCell")
        table.register(RecentsTableViewCellCell.self, forCellReuseIdentifier: "RecentsTableViewCellCell")
        table.register(PopularTableViewCell.self, forCellReuseIdentifier: "PopularTableViewCell")
        table.register(PopularCreatorTableViewCell.self, forCellReuseIdentifier: "PopularCreatorTableViewCell")
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.
        setUp()
        showApiData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tbl_t.frame = view.bounds
        
    }
    func setUp(){
        setUpTableView()
        headerView.searchTextField.isUserInteractionEnabled = false
        headerView.btn.addTarget(self, action: #selector(showSearch), for: .touchUpInside)

    }
    
    func setUpTableView(){
        view.addSubview(tbl_t)
        tbl_t.delegate = self
        tbl_t.dataSource = self
        headerView = MainTableHeader(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 168))
        tbl_t.translatesAutoresizingMaskIntoConstraints = false
        tbl_t.separatorStyle = .none
        tbl_t.tableHeaderView = headerView
        tbl_t.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 70, paddingRight: 0)

    }
    @objc func showSearch(){
        if #available(iOS 15.0, *) {
            let vc = SearchRecipeVC()

            vc.hidesBottomBarWhenPushed = true
            vc.navigationController?.isToolbarHidden = true
            navigationController?.pushViewController(vc, animated: true)
        } else {
            // Fallback on earlier versions
        }
    }
    func showApiData(){
        
    }
}
extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            return 262
        }else if indexPath.row == 1 {
            return 353
        }else if indexPath.row == 3 {
            return 230
        } else {
            return 322
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 2 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecentsTableViewCellCell") as? RecentsTableViewCellCell else{fatalError("tb cell not created")}
            cell.loadRecents()
            cell.cellDelegate = self

            return cell
        } else if indexPath.row == 1 {
            guard  let cell = tableView.dequeueReusableCell(withIdentifier: "PopularTableViewCell") as? PopularTableViewCell else {
                fatalError("tb cell not created")
            }
            cell.cellDelegate = self
            cell.setCategories()
            cell.loadSubCollection(c: "Ordinary_Drink")
            return cell
        }else if indexPath.row == 3 {
            guard  let cell = tableView.dequeueReusableCell(withIdentifier: "PopularCreatorTableViewCell") as? PopularCreatorTableViewCell else {
                fatalError("tb cell not created")
            }
            cell.laodCreator()
            cell.cellDelegate = self

            return cell
        } else  {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TendingNowCell") as? TrendingNowTableViewCellCell else{fatalError("tb cell not created")}
            cell.loadTrendings()
            cell.cellDelegate = self
            return cell
        }
    }
}
