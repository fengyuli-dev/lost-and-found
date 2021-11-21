//
//  QuestionViewController.swift
//  LostandFound
//
//  Created by Vivian on 11/20/21.
//
import SwiftUI

class QuestionViewController: UIViewController {
    
//    init(delegate: UpdateTitleDelegate?, placeholderText: String) {
//        self.delegate = delegate
//        self.placeholderText = placeholderText
//        super.init(nibName: nil, bundle: nil)
//    }
    init(){
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // TODO 1: set up view
    var Lost = UIButton()
    var Found = UIButton()
//    var rec1 = UILabel()
//    var rec2 = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "Shapes"
        view.backgroundColor = UIColor(red: 0.325, green: 0.38, blue: 0.424, alpha: 1)
        
        

        // TODO 3: Setup flow layout
        // TODO 4: Instantiate collectionView
        // TODO 5: Create collection view cell and register it here.
        // TODO 6: Set collection view data source
        // TODO 7: Set collection view delegate
        // TODO 8: Register header view
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){

        Lost.frame = CGRect(x: 0, y: 0, width: 279, height: 44)
        Lost.layer.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1).cgColor
        Lost.layer.cornerRadius = 30
        Lost.setTitle("Lost Something?", for: .normal)
        Lost.setTitleColor(.black, for: .normal)
        Lost.addTarget(self, action: #selector(lostTableTapped), for: .touchUpInside)
        Lost.translatesAutoresizingMaskIntoConstraints = false
        
//        Lost.font = UIFont(name: "Inter-Regular", size: 24)
        view.addSubview(Lost)
        
    
        //Found
        Found.frame = CGRect(x: 0, y: 0, width: 279, height: 44)
        Found.layer.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1).cgColor
        Found.layer.cornerRadius = 30
        Found.setTitle("Found Something?", for: .normal)
        Found.setTitleColor(.black, for: .normal)
        Found.addTarget(self, action: #selector(lostTableTapped), for: .touchUpInside)
        Found.translatesAutoresizingMaskIntoConstraints = false
        
//        Found.font = UIFont(name: "Inter-Regular", size: 24)
        view.addSubview(Found)
        
        
    }

    func setupConstraints() {
//        let collectionViewPadding: CGFloat = 12
        
//        //rec1
//        NSLayoutConstraint.activate([
//            rec1.widthAnchor.constraint(equalToConstant: 279),
//            rec1.heightAnchor.constraint(equalToConstant: 44),
//            rec1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            rec1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
//        ])
//
//        //rec2
//        NSLayoutConstraint.activate([
//            rec2.widthAnchor.constraint(equalToConstant: 279),
//            rec2.heightAnchor.constraint(equalToConstant: 44),
//            rec2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            rec2.topAnchor.constraint(equalTo: rec1.bottomAnchor, constant: 10),
//        ])
        
        //lost
        NSLayoutConstraint.activate([
            Lost.widthAnchor.constraint(equalToConstant: 279),
            Lost.heightAnchor.constraint(equalToConstant: 44),
            Lost.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Lost.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
        ])
        
        //found
        NSLayoutConstraint.activate([
            Found.widthAnchor.constraint(equalToConstant: 279),
            Found.heightAnchor.constraint(equalToConstant: 44),
            Found.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Found.topAnchor.constraint(equalTo: Lost.bottomAnchor, constant: 30),
        ])
    
    }
    
    @objc func lostTableTapped(){
        //you lack an if let method!
        let FVC = FoundViewController();
                 self.navigationController?.pushViewController(FVC, animated: true)
    }
    
    
}
