//
//  ViewController.swift
//  L5Starter
//
//  Created by Amy Chin Siu Huang on 10/25/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    // TODO 1: set up view
    var foundTableView = UITableView()
    let reuseIdentifier_1 = "foundCellReuse"
    
    var foundItems: [Item]=[]


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Found Items"
        view.backgroundColor = UIColor(red: 0.325, green: 0.38, blue: 0.424, alpha: 1)
        
        foundTableView.translatesAutoresizingMaskIntoConstraints = false
        foundTableView.dataSource = self
        foundTableView.delegate = self
        foundTableView.register(FoundTableViewCell.self, forCellReuseIdentifier: reuseIdentifier_1)
        view.addSubview(foundTableView)
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        
        
    }

    func setupConstraints() {
//        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            foundTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            foundTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            foundTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            foundTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return found.count
        
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
