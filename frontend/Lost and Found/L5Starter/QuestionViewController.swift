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
    var Lost = UILabel()
    var Found = UILabel()
    var rec1 = UILabel()
    var rec2 = UILabel()

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
        //rec1
        rec1.frame = CGRect(x: 0, y: 0, width: 279, height: 44)
        rec1.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1)
        rec1.layer.cornerRadius = 100
        rec1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rec1)
        
        //rec2
        rec2.frame = CGRect(x: 0, y: 0, width: 279, height: 44)
        rec2.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1)
        rec2.layer.cornerRadius = 100
        rec2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rec2)
        //lost
        Lost.text="Lost Something?"
        Lost.font = UIFont(name: "Inter-Regular", size: 24)
        Lost.textAlignment = .center
        Lost.textColor = .black
        Lost.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Lost)
        
        //Found
        Found.text="Found Something?"
        Found.font = UIFont(name: "Inter-Regular", size: 24)
        Found.textAlignment = .center
        Found.textColor = .black
        Found.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Found)
        
        
    }

    func setupConstraints() {
//        let collectionViewPadding: CGFloat = 12
        
        //rec1
        NSLayoutConstraint.activate([
            rec1.widthAnchor.constraint(equalToConstant: 279),
            rec1.heightAnchor.constraint(equalToConstant: 44),
            rec1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rec1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
        ])
        
        //rec2
        NSLayoutConstraint.activate([
            rec2.widthAnchor.constraint(equalToConstant: 279),
            rec2.heightAnchor.constraint(equalToConstant: 44),
            rec2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rec2.topAnchor.constraint(equalTo: rec1.bottomAnchor, constant: 10),
        ])
        
        //lost
        NSLayoutConstraint.activate([
            Lost.widthAnchor.constraint(equalToConstant: 159),
            Lost.heightAnchor.constraint(equalToConstant: 30),
            Lost.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Lost.topAnchor.constraint(equalTo: rec1.topAnchor, constant: 5),
        ])
        
        //found
        NSLayoutConstraint.activate([
            Found.widthAnchor.constraint(equalToConstant: 174),
            Found.heightAnchor.constraint(equalToConstant: 30),
            Found.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Found.topAnchor.constraint(equalTo: rec2.topAnchor, constant: 5),
        ])
        
        
    }
}
