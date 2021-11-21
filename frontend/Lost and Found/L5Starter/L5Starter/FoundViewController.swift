//
//  ViewController.swift
//  L5Starter
//
//  Created by Amy Chin Siu Huang on 10/25/21.
//

import UIKit

class FoundViewController: UIViewController, UITableViewDelegate {
    
    // TODO 1: set up view
    var foundTableView = UITableView()
    let reuseIdentifier_1 = "foundCellReuse"
    
    var foundItems: [Item]=[]
    var PostLost_Button = UIButton()
//    var recButton = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Found Items"
        let color: UIColor=UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1)
        let textAttributes = [NSAttributedString.Key.foregroundColor: color]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        view.backgroundColor = UIColor(red: 0.325, green: 0.38, blue: 0.424, alpha: 1)
        
        foundTableView.translatesAutoresizingMaskIntoConstraints = false
        foundTableView.dataSource = self
        foundTableView.delegate = self
        foundTableView.register(FoundTableViewCell.self, forCellReuseIdentifier: reuseIdentifier_1)
        view.addSubview(foundTableView)
        
        PostLost_Button.frame = CGRect(x: 0, y: 0, width: 130, height: 46)
        PostLost_Button.setTitle("Post Lost", for: .normal)
        PostLost_Button.layer.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1).cgColor
        PostLost_Button.layer.cornerRadius = 23
        PostLost_Button.addTarget(self, action: #selector(PostLostTapped), for: .touchUpInside)
        PostLost_Button.setTitleColor(.black, for: .normal)
        PostLost_Button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(PostLost_Button)
        
        
        
        setupConstraints()
    }
    
    

    func setupConstraints() {
//        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            foundTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            foundTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            foundTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            foundTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            PostLost_Button.widthAnchor.constraint(equalToConstant: 130),
            PostLost_Button.heightAnchor.constraint(equalToConstant: 46),
            PostLost_Button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            PostLost_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func PostLostTapped() {
        let PLVC = PostLostViewController();
            self.navigationController?.pushViewController(PLVC, animated: true)
    }
}

extension FoundViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foundItems.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return FoundTableViewCell()
    }
}




//extension ViewController: UITableViewDelegate {
//
//}

// TODO 6: Conform to UICollectionViewDataSource

// TODO 7: Confrom to UICollectionViewDelegateFlowLayout
// TODO 9: Conform to UICollectionViewDelegate, implement interaction
