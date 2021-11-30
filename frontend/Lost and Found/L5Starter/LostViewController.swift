//
//  LostViewController.swift
//  Lost and Found
//
//  Created by Haoxuan Zou on 11/29/21.
//

import Foundation
import UIKit

class LostViewController: UIViewController{
    
    var lostTableView : UICollectionView;
    let reuseIdentifier_1 = "lostCellReuse"
    
    var lostItems: [Item]=[]
    var PostLost_Button = UIButton()
    var cellPadding : CGFloat = 10
//    var recButton = UILabel()
    var theHeight:Float = 15;
    
    init(){
        let foundlayout = UICollectionViewFlowLayout();
        lostTableView = UICollectionView(frame: .zero, collectionViewLayout: foundlayout)//this is of no use.
        super.init(nibName: nil, bundle: nil);
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar = self.navigationController!.navigationBar;
//        navBar.isTranslucent = true;
//        navBar.titleTextAttributes = [.backgroundColor: UIColor(.clear)]//this is of no use!
        let titleview = UILabel();
        titleview.text = "Lost Items";
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

        
        
        let sectionpadding : CGFloat = 5;
        let lostlayout = UICollectionViewFlowLayout();
        lostTableView = UICollectionView(frame: .zero, collectionViewLayout: lostlayout)
        lostTableView.translatesAutoresizingMaskIntoConstraints = false
        lostTableView.dataSource = self
        lostTableView.delegate = self
        lostTableView.backgroundColor = view.backgroundColor;
        lostTableView.register(LostTableViewCell.self, forCellWithReuseIdentifier: reuseIdentifier_1)
        lostlayout.minimumLineSpacing = cellPadding;
        lostlayout.scrollDirection = .vertical;
        view.addSubview(lostTableView)
        
        
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
        addDUMMYData();
    }
    
    

    func setupConstraints() {
        
        //the parameter used in this section. Modify the scaler, the whole thing is adjusted.
        let viewpadding : CGFloat = 10;
        
        
        NSLayoutConstraint.activate([
            lostTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            lostTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            lostTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: viewpadding),
            lostTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            PostLost_Button.widthAnchor.constraint(equalToConstant: 130),
            PostLost_Button.heightAnchor.constraint(equalToConstant: 46),
            PostLost_Button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            PostLost_Button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    
    func addDUMMYData(){
        lostItems.append(Item(objectName: "Porridge", location: "Townhouse", time: "25:61", note: "Handsome BOOOYYYY", contact: "Oopsy, you should find it", pics: UIImage()));
        lostItems.append(Item(objectName: "Porridge", location: "Townhouse", time: "25:61", note: "Handsome BOOOYYYY", contact: "Oopsy, you should find it", pics: UIImage()));
        lostItems.append(Item(objectName: "Porridge", location: "Townhouse", time: "25:61", note: "Handsome BOOOYYYY", contact: "Oopsy, you should find it", pics: UIImage()));
        lostItems.append(Item(objectName: "Porridge", location: "Townhouse", time: "25:61", note: "Handsome BOOOYYYY", contact: "Oopsy, you should find it", pics: UIImage()));
        lostItems.append(Item(objectName: "Porridge", location: "Townhouse", time: "25:61", note: "Handsome BOOOYYYY", contact: "Oopsy, you should find it", pics: UIImage()));
        lostItems.append(Item(objectName: "Porridge", location: "Townhouse", time: "25:61", note: "Handsome BOOOYYYY", contact: "Oopsy, you should find it", pics: UIImage()));
        lostItems.append(Item(objectName: "Porridge", location: "Townhouse", time: "25:61", note: "Handsome BOOOYYYY", contact: "Oopsy, you should find it", pics: UIImage()));
        lostItems.append(Item(objectName: "Porridge", location: "Townhouse", time: "25:61", note: "Handsome BOOOYYYY", contact: "Oopsy, you should find it", pics: UIImage()));
        lostItems.append(Item(objectName: "Porridge", location: "Townhouse", time: "25:61", note: "Handsome BOOOYYYY", contact: "Oopsy, you should find it", pics: UIImage()));
        lostItems.append(Item(objectName: "Porridge", location: "Townhouse", time: "25:61", note: "Handsome BOOOYYYY", contact: "Oopsy, you should find it", pics: UIImage()));
        lostItems.append(Item(objectName: "Porridge", location: "Townhouse", time: "25:61", note: "Handsome BOOOYYYY", contact: "Oopsy, you should find it", pics: UIImage()));
        
    }
    
    @objc func PostLostTapped() {
        let PLVC = PostLostViewController();
        self.navigationController?.pushViewController(PLVC, animated: true)
    }
    
}


extension LostViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lostItems.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = lostItems[indexPath.item];
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier_1, for: indexPath) as! LostTableViewCell;
        cell.configure(for: item);
        return cell;
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

        let display = FoundDescViewController();
        display.setParaForFont(Float(view.frame.height) * 0.022) //set the font size!
        display.configure(for: item);
        if let pC = display.presentationController as? UISheetPresentationController {
            pC.detents = [.medium()] /// set here!
        }
        
        present(display, animated: true, completion: nil)
    }
    
}
