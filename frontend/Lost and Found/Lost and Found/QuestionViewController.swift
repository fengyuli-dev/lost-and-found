//
//  QuestionViewController.swift
//  LostandFound
//
//  Created by Vivian on 11/20/21.
//  
//
import SwiftUI

class QuestionViewController: UIViewController{
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // TODO 1: set up view
    var Lost = UIButton()
    var Found = UIButton()
    var Logout = UIButton()
    var UserProf = UIButton();
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor(red: 0.325, green: 0.38, blue: 0.424, alpha: 1)
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){

//        self.navigationItem.hidesBackButton = true;//You may never come back!
        
        //Lost
        Lost.layer.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1).cgColor
        Lost.layer.cornerRadius = 20//weird. when this number gets bigger, the button apperance
                                    //would become acute on the very left and right corner. verify.
        Lost.setTitle("Lost Something?", for: .normal)
        Lost.setTitleColor(.black, for: .normal)
        Lost.addTarget(self, action: #selector(lostTableTapped), for: .touchUpInside)
        Lost.translatesAutoresizingMaskIntoConstraints = false
        //well the font of the text is set in setUpConstraints(). Check to see why. interesting.
        view.addSubview(Lost)
        
    
        //Found
        Found.layer.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1).cgColor
        Found.layer.cornerRadius = 20
        Found.setTitle("Found Something?", for: .normal)
        Found.setTitleColor(.black, for: .normal)
        Found.addTarget(self, action: #selector(foundTableTapped), for: .touchUpInside)
        Found.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Found)
        
        
        Logout.layer.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1).cgColor
        Logout.layer.cornerRadius = 20
        Logout.setTitle("Log Out", for: .normal)
        Logout.setTitleColor(.black, for: .normal)
        Logout.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        Logout.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Logout)
        
        
        UserProf.layer.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1).cgColor
        UserProf.layer.cornerRadius = 20
        UserProf.setTitle("Log Out", for: .normal)
        UserProf.setTitleColor(.black, for: .normal)
        UserProf.addTarget(self, action: #selector(userprofTapped), for: .touchUpInside)
        UserProf.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(UserProf)
        
 
    }

    func setupConstraints() {
        
        //the parameter used in this section. Modify the scaler, the whole thing is adjusted.
        let theWidth = view.frame.width * 0.744;
        let theHeight = view.frame.height * 0.054;
        let titlefont = theHeight * 0.455;
        //lost
        NSLayoutConstraint.activate([
            Lost.widthAnchor.constraint(equalToConstant: theWidth),
            Lost.heightAnchor.constraint(equalToConstant: theHeight),
            Lost.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Lost.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
        ])
        
        //found
        NSLayoutConstraint.activate([
            Found.widthAnchor.constraint(equalToConstant: theWidth),
            Found.heightAnchor.constraint(equalToConstant: theHeight),
            Found.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Found.topAnchor.constraint(equalTo: Lost.bottomAnchor, constant: 30),
        ])
        
        
        NSLayoutConstraint.activate([
            Logout.widthAnchor.constraint(equalToConstant: theWidth),
            Logout.heightAnchor.constraint(equalToConstant: theHeight),
            Logout.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Logout.topAnchor.constraint(equalTo: Found.bottomAnchor, constant: 30),
        ])
        
        
        NSLayoutConstraint.activate([
            UserProf.widthAnchor.constraint(equalToConstant: theWidth),
            UserProf.heightAnchor.constraint(equalToConstant: theHeight),
            UserProf.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            UserProf.topAnchor.constraint(equalTo: Logout.bottomAnchor, constant: 30),
        ])
        
        //here I set up the fonts. It uses the height as a benchmark.
        
        Lost.titleLabel?.font = UIFont(name:"RoundedMplus1c-Medium", size: titlefont);
        Found.titleLabel?.font = UIFont(name:"RoundedMplus1c-Medium", size: titlefont);
    }
    
    @objc func lostTableTapped(){
        let FVC = FoundViewController();
        self.navigationController?.pushViewController(FVC, animated: true)
    }
    
    
    @objc func foundTableTapped(){
        let LVC = LostViewController(delegate: nil);
        self.navigationController?.pushViewController(LVC, animated: true)
    }
    
    
    @objc func logoutTapped(){
        userData.set(Data(), forKey: "UserProf");
        let TMVC = TheMainViewController()
        self.navigationController?.pushViewController(TMVC, animated: true);
    }
    
    
    @objc func userprofTapped(){
        let UVC = UserViewController();
        self.navigationController?.pushViewController(UVC, animated: true);
    }
    
}
