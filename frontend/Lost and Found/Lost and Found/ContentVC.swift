//
//  ContentVC.swift
//  PageViewControllerWithTabs
//
//  Created by Leela Prasad on 22/03/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit


class ContentVC: UIViewController {
    
    var nameLabel = UILabel()
    var pageIndex: Int = 0
    var strTitle: String?

    override func viewDidLoad() {
        print("contentvc view did load.")
        super.viewDidLoad()
        nameLabel.text = strTitle
        view.backgroundColor = .yellow;
        view.addSubview(nameLabel)
        print("here we are, and the index is \(self.pageIndex)")
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel.textColor = .black;
//        NSLayoutConstraint.activate([
//            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
//
//        ])
        
        
    }

}

