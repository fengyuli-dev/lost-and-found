//
//  LostViewController.swift
//  Lost and Found
//
//  Created by Haoxuan Zou on 11/29/21.
//

import Foundation
import UIKit
import Alamofire

protocol UpdateLostDelegate: class {
    func updateLost(newLost: Item)
    func getLost()->Item
}

class LostViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate{
    // @IBOutlet weak var collectionView: UICollectionView!
    var lostTableView : UICollectionView;
    let reuseIdentifier_1 = "lostCellReuse"
    var lostItems: [Item]=[]
    var filtered:[Item] = []
    
    var PostFound_Button = UIButton()
    var cellPadding : CGFloat = 10
//    var recButton = UILabel()
    var theHeight:Float = 15;
    
    // searchbar实现
    let searchController = UISearchController(searchResultsController: nil);
    var searchActive: Bool = false

    //refresh control
    let refreshControl = UIRefreshControl()
    
    
    weak var delegate: UpdateLostDelegate?
    //init(delegate:UpdateLostDelegate){
    
    init(delegate:UpdateLostDelegate?){
        self.delegate = delegate
        let foundlayout = UICollectionViewFlowLayout();
        lostTableView = UICollectionView(frame: .zero, collectionViewLayout: foundlayout)//this is of no use.
        
        super.init(nibName: nil, bundle: nil);
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor(red: 0.325, green: 0.38, blue: 0.424, alpha: 1)
        
        lostTableView.delegate=self
        
        let navBar = self.navigationController!.navigationBar
        
        //title = "Lost Items"
        
        //search bar
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search Items"
        // 这两行似乎没有起作用
        searchController.searchBar.tintColor = .black
        searchController.searchBar.barTintColor = .white
        self.navigationItem.searchController = searchController
        
        
        if #available(iOS 10.0, *) {
            lostTableView.refreshControl = refreshControl
        } else {
            lostTableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        let layer0 = CAGradientLayer()
        layer0.colors = [
            UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1).cgColor,
            UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
        ]
        layer0.locations = [0, 0.73]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.55, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer0.position = view.center
        view.layer.addSublayer(layer0)

        let titleview = UILabel();
        titleview.text = "Lost Items";
        titleview.textColor = UIColor(red: 0.063, green: 0.193, blue: 0.283, alpha: 1)
        let titleheight = view.frame.height * 0.026;
        titleview.font = UIFont(name: "RoundedMplus1c-ExtraBold", size: titleheight)
        self.navigationItem.titleView = titleview;
        titleview.textAlignment = .center;
        
        self.navigationController?.navigationBar.backgroundColor = self.view.backgroundColor
        let appearance = UINavigationBarAppearance();
        appearance.configureWithTransparentBackground();
        navBar.standardAppearance = appearance;
        navBar.scrollEdgeAppearance = appearance;
        navBar.compactAppearance = appearance;

    
        let sectionpadding : CGFloat = view.frame.height * 0.113 * 0.236
        let lostlayout = UICollectionViewFlowLayout();
        lostTableView = UICollectionView(frame: .zero, collectionViewLayout: lostlayout)
        lostTableView.translatesAutoresizingMaskIntoConstraints = false
        lostTableView.dataSource = self
        lostTableView.delegate = self
        lostTableView.backgroundColor = view.backgroundColor;
        lostTableView.register(LostTableViewCell.self, forCellWithReuseIdentifier: reuseIdentifier_1)
        lostlayout.minimumLineSpacing = sectionpadding;
        lostlayout.scrollDirection = .vertical;
        view.addSubview(lostTableView)
        
        
        PostFound_Button.frame = CGRect(x: 0, y: 0, width: 130, height: 46)
        PostFound_Button.setTitle("Post Found", for: .normal)
        PostFound_Button.layer.backgroundColor = UIColor(red: 0.063, green: 0.193, blue: 0.283, alpha: 1).cgColor
        PostFound_Button.layer.cornerRadius = 23
        PostFound_Button.addTarget(self, action: #selector(PostFoundTapped), for: .touchUpInside)
        PostFound_Button.translatesAutoresizingMaskIntoConstraints = false
        PostFound_Button.setTitleColor(UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1), for: .normal);
        PostFound_Button.titleLabel?.font = UIFont(name:"RoundedMplus1c-Medium", size: 18);
        view.addSubview(PostFound_Button)
       
        setupConstraints()
        getData();
        
    }
    
    

    func setupConstraints() {
        
        //the parameter used in this section. Modify the scaler, the whole thing is adjusted.
        let viewpadding : CGFloat = 10;
        
        
        NSLayoutConstraint.activate([
            lostTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            lostTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            lostTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: viewpadding+10),
            lostTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            PostFound_Button.widthAnchor.constraint(equalToConstant: 130),
            PostFound_Button.heightAnchor.constraint(equalToConstant: 46),
            PostFound_Button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            PostFound_Button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    func sortData(){
        self.lostItems.sort{(leftItem,rightItem)->Bool in
            return leftItem.id > rightItem.id;
        }
    }
    func getData(){
        lostItems = []
        NetworkManager.getAllLost { lostItems in
            print("decode succeed")
            self.lostItems = lostItems;
            self.lostTableView.reloadData()
            DispatchQueue.main.async {
                self.lostTableView.reloadData();
            }//what is this for??
        }
        
    }
    
    @objc func PostFoundTapped() {
        if let decodeSuccess = try? decoder.decode(User1.self, from:userData.object(forKey: "UserProf") as! Data){
            print(decodeSuccess)
            userData.set(decodeSuccess.session_token, forKey: "Authorization")
            print(decodeSuccess.session_token)
            print("decode user succeed! go to main page!")
            let PFVC = PostFoundViewController();
            self.navigationController?.pushViewController(PFVC, animated: true)
        }else{
            print("decode user failure! go to login!")
            let MVC = MainViewController();
            self.navigationController?.pushViewController(MVC, animated: true)
            }
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        filtered = lostItems.filter({ (item) -> Bool in
            let countryText: NSString = item.name as NSString

                    return (countryText.range(of: searchString!, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
                })
        lostTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchActive = false
            self.dismiss(animated: true, completion: nil)
        }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchActive = true
        lostTableView.reloadData()
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchActive = false
            lostTableView.reloadData()
        }

        func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
            if !searchActive {
                searchActive = true
                lostTableView.reloadData()
            }

            searchController.searchBar.resignFirstResponder()
        }
    
    @objc func refreshData(){
        self.getData();
    }
    
    
}


extension LostViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchActive{return filtered.count}
        else{
            return lostItems.count;}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier_1, for: indexPath) as! LostTableViewCell;
        if searchActive {
            let item = filtered[indexPath.item]
            cell.configure(for: item);
        }
        else{
            let item = lostItems[indexPath.item];
            cell.configure(for: item);
        }
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 0)
    }
    
    
}


extension LostViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let theWidth = collectionView.frame.width * 0.825 ;
        let theHeight = collectionView.frame.height * 0.125//note here.
        return CGSize(width: theWidth, height: theHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = lostItems[indexPath.item];

        let display = LostDescViewController();
        display.setParaForFont(Float(view.frame.height) * 0.022) //set the font size!
        display.configure(for: item);
        if let pC = display.presentationController as? UISheetPresentationController {
            pC.detents = [.medium()] /// set here!
        }
        
        present(display, animated: true, completion: nil)
    }
    
}
