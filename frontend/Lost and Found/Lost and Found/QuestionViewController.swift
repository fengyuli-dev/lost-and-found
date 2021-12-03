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
    var shadows = UIView()
    var shapes = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor(red: 0.325, green: 0.38, blue: 0.424, alpha: 1)
        assignbackground();
        navigationItem.hidesBackButton=true
        //navigationItem.color=.clear
        setupViews()
        setupConstraints()
    }
    
    
    func assignbackground(){
            let background = UIImage(named: "Image-1")
            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        }
    
    func setupViews(){
        var shadows = UIView()
        shadows.frame = view.frame
        shadows.clipsToBounds = false
        view.addSubview(shadows)

        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 0)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 4
        layer0.shadowOffset = CGSize(width: 0, height: 4)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)

        let textcolor: UIColor = UIColor(red: 0.063, green: 0.193, blue: 0.283, alpha: 1)
        
        
        //Lost
        Lost.layer.backgroundColor = UIColor(red: 0.722, green: 0.803, blue: 0.858, alpha: 1).cgColor
        Lost.layer.cornerRadius = 15//weird. when this number gets bigger, the button apperance
                                    //would become acute on the very left and right corner. verify.
        Lost.setTitle("Lost Something?", for: .normal)
        Lost.setTitleColor(textcolor, for: .normal)
        Lost.addTarget(self, action: #selector(lostTableTapped), for: .touchUpInside)
        Lost.translatesAutoresizingMaskIntoConstraints = false
        //well the font of the text is set in setUpConstraints(). Check to see why. interesting.
        Lost.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        Lost.layer.shadowOpacity = 0.5
        Lost.layer.shadowRadius = 0
        Lost.layer.shadowOffset = CGSize(width: 0, height: 3)
        Lost.layer.masksToBounds = false
        view.addSubview(Lost)
        
    
        //Found
        Found.layer.backgroundColor = UIColor(red: 0.722, green: 0.803, blue: 0.858, alpha: 1).cgColor
        Found.layer.cornerRadius = 15
        Found.setTitle("Found Something?", for: .normal)
        Found.setTitleColor(textcolor, for: .normal)
        Found.addTarget(self, action: #selector(foundTableTapped), for: .touchUpInside)
        

        Found.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        Found.layer.shadowOpacity = 0.5
        Found.layer.shadowRadius = 0
        Found.layer.shadowOffset = CGSize(width: 0, height: 3)
        Found.layer.masksToBounds = false
        Found.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Found)
        
        
        Logout.layer.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1).cgColor
        Logout.layer.cornerRadius = 15
        Logout.setTitle("Log Out", for: .normal)
        Logout.setTitleColor(textcolor, for: .normal)
        Logout.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        Logout.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Logout)
        

        self.navigationController?.navigationBar.tintColor = view.backgroundColor
        self.navigationController?.navigationBar.backgroundColor = view.backgroundColor
        /*** If needed Assign Title Here ***/
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)

        
        
 
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
    
    


    
}
