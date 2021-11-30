//
//  ViewController.swift
//  L5Starter
//
//  Created by Vivian Fan on 11/20/2021.
//
import UIKit

class FoundViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate{
    
    var foundTableView : UICollectionView;
    let reuseIdentifier_1 = "foundCellReuse"
    
    let searchController = UISearchController(searchResultsController: nil);
    var searchActive: Bool = false
    
    var filtered: [Item] = []
    var foundItems: [Item]=[]
    var PostLost_Button = UIButton()
    var cellPadding : CGFloat = 10
//    var recButton = UILabel()
    var theHeight:Float = 15;
    
    init(){
        let foundlayout = UICollectionViewFlowLayout();
        foundTableView = UICollectionView(frame: .zero, collectionViewLayout: foundlayout)//this is of no use.
        super.init(nibName: nil, bundle: nil);
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // title = "Found Items"
        
        
        let navBar = self.navigationController!.navigationBar;
//        navBar.isTranslucent = true;
//        navBar.titleTextAttributes = [.backgroundColor: UIColor(.clear)]//this is of no use!
        let titleview = UILabel();
        titleview.text = "Found Items";
        titleview.textColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1)
        let titleheight = view.frame.height * 0.026;
        titleview.font = UIFont(name: "RoundedMplus1c-ExtraBold", size: titleheight);
        self.navigationItem.titleView = titleview; //in this way the title is properly set.
        //however.. why is it more to the left everytime I scroll back from the "post lost"?
        titleview.textAlignment = .center;
        view.backgroundColor = UIColor(red: 0.325, green: 0.38, blue: 0.424, alpha: 1)
        let appearance = UINavigationBarAppearance();
        appearance.configureWithTransparentBackground();
        navBar.standardAppearance = appearance;
        navBar.scrollEdgeAppearance = appearance;
        navBar.compactAppearance = appearance;
        //https://developer.apple.com/documentation/uikit/uinavigationcontroller/customizing_your_app_s_navigation_bar

        //search bar
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search Items"
        // 这两行似乎没有起作用
        searchController.searchBar.tintColor = .black
        searchController.searchBar.barTintColor = .white
        self.navigationItem.searchController = searchController
        

        let sectionpadding : CGFloat = 5;
        let foundlayout = UICollectionViewFlowLayout();
        foundTableView = UICollectionView(frame: .zero, collectionViewLayout: foundlayout)
        foundTableView.translatesAutoresizingMaskIntoConstraints = false
        foundTableView.dataSource = self
        foundTableView.delegate = self
        foundTableView.backgroundColor = view.backgroundColor;
        foundTableView.register(FoundTableViewCell.self, forCellWithReuseIdentifier: reuseIdentifier_1)
        foundlayout.minimumLineSpacing = cellPadding;
        foundlayout.scrollDirection = .vertical;
        view.addSubview(foundTableView)
        
        
        PostLost_Button.frame = CGRect(x: 0, y: 0, width: 130, height: 46)
        PostLost_Button.setTitle("Post Lost", for: .normal)
        PostLost_Button.layer.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1).cgColor
        PostLost_Button.layer.cornerRadius = 23
        PostLost_Button.addTarget(self, action: #selector(PostLostTapped), for: .touchUpInside)
        PostLost_Button.translatesAutoresizingMaskIntoConstraints = false
        PostLost_Button.setTitleColor(.black, for: .normal);
        PostLost_Button.titleLabel?.font = UIFont(name:"RoundedMplus1c-Medium", size: 18);
        view.addSubview(PostLost_Button)
        
        
        setupConstraints()
        getData();
    }
    
    

    func setupConstraints() {
        
        //the parameter used in this section. Modify the scaler, the whole thing is adjusted.
        let viewpadding : CGFloat = 10;
        
        
        NSLayoutConstraint.activate([
            foundTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            foundTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            foundTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: viewpadding),
            foundTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            PostLost_Button.widthAnchor.constraint(equalToConstant: 130),
            PostLost_Button.heightAnchor.constraint(equalToConstant: 46),
            PostLost_Button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            PostLost_Button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    
    @objc func PostLostTapped() {
        let PLVC = PostLostViewController();
        self.navigationController?.pushViewController(PLVC, animated: true)
    }
    
    
    func getData(){
        foundItems = []
        NetworkManager.getAllFound { foundItems in
            print("Found decode succeed")
            self.foundItems = foundItems;
            self.foundTableView.reloadData()
            DispatchQueue.main.async {
                self.foundTableView.reloadData();
            }//what is this for??
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        filtered = foundItems.filter({ (item) -> Bool in
            let countryText: NSString = item.name as NSString

                    return (countryText.range(of: searchString!, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
                })
        foundTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchActive = false
            self.dismiss(animated: true, completion: nil)
        }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchActive = true
        foundTableView.reloadData()
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchActive = false
            foundTableView.reloadData()
        }

        func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
            if !searchActive {
                searchActive = true
                foundTableView.reloadData()
            }

            searchController.searchBar.resignFirstResponder()
        }
    
}


extension FoundViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchActive{return filtered.count}
        else{
            return foundItems.count;}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier_1, for: indexPath) as! FoundTableViewCell;

        if searchActive {
            let item = filtered[indexPath.item]
            cell.configure(for: item);
        }
        else{
            let item = foundItems[indexPath.item];
            cell.configure(for: item);
        }
        return cell;
    }
    
    
}


extension FoundViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let theWidth = collectionView.frame.width * 0.825 ;
        let theHeight = collectionView.frame.height * 0.125//note here.
        return CGSize(width: theWidth, height: theHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = foundItems[indexPath.item];

        let display = FoundDescViewController();
        display.setParaForFont(Float(view.frame.height) * 0.022) //set the font size!
        display.configure(for: item);
        if let pC = display.presentationController as? UISheetPresentationController {
            pC.detents = [.medium()] /// set here!
        }//look here. This is the way to show half-screen.
        //https://stackoverflow.com/questions/42106980/how-to-present-a-viewcontroller-on-half-screen
        
        present(display, animated: true, completion: nil)
    }
    
}
