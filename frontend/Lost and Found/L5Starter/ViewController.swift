// 我自己写的
//  ViewController.swift
//  L5Starter
//
//  Created by Amy Chin Siu Huang on 10/25/21.
//

//import UIKit
//
//class ViewController: UIViewController {
//
//    // TODO 1: set up view
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = UIColor(red: 0.325, green: 0.38, blue: 0.424, alpha: 1)
//
//        setupViews()
//        setupConstraints()
//    }
//
//    func setupViews(){
//    }
//
//    func setupConstraints() {
//
//    }
//}
import UIKit

 class ViewController: UIViewController {

     private var netIdText = UITextField();
     private var passwordText = UITextField();
     private var loginButton = UIButton();


     override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
         view.backgroundColor = .gray;
         let theWidth = CGFloat(257);
         let theHeight = CGFloat(49);


         netIdText.frame = CGRect(x: 0, y: 0, width: 257, height: 49)
         netIdText.backgroundColor = .white
         netIdText.layer.backgroundColor = UIColor(red: 0.941, green: 0.961, blue: 0.976, alpha: 1).cgColor
         var parent = self.view!
         parent.addSubview(netIdText)
         netIdText.translatesAutoresizingMaskIntoConstraints = false
         netIdText.widthAnchor.constraint(equalToConstant: theWidth).isActive = true
         netIdText.heightAnchor.constraint(equalToConstant: theHeight).isActive = true
         netIdText.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
         netIdText.centerXAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerXAnchor).isActive = true;
         netIdText.placeholder = "NetId"


         passwordText.frame = CGRect(x: 0, y: 0, width: 257, height: 49)
         passwordText.backgroundColor = .white
         passwordText.layer.backgroundColor = UIColor(red: 0.941, green: 0.961, blue: 0.976, alpha: 1).cgColor
         passwordText.placeholder = "Password";
         parent.addSubview(passwordText)
         passwordText.translatesAutoresizingMaskIntoConstraints = false
         passwordText.widthAnchor.constraint(equalToConstant: theWidth).isActive = true
         passwordText.heightAnchor.constraint(equalToConstant: theHeight).isActive = true
         passwordText.topAnchor.constraint(equalTo: netIdText.bottomAnchor, constant: 20).isActive = true
         passwordText.centerXAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerXAnchor).isActive = true


         loginButton.backgroundColor = .blue;
         loginButton.setTitle("Login", for: .normal)
         loginButton.titleLabel?.textColor = .white;
         loginButton.layer.cornerRadius = 23;
 //        loginButton.layer.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1).cgColor
         parent.addSubview(loginButton)
         loginButton.translatesAutoresizingMaskIntoConstraints = false;
         loginButton.centerXAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerXAnchor).isActive = true;
         loginButton.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 30).isActive = true;
         loginButton.widthAnchor.constraint(equalToConstant: CGFloat(150)).isActive = true;
         loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)




     }
     @objc func loginTapped(){
         //you lack an if let method!
         let qvc = QuestionViewController();
                  self.navigationController?.pushViewController(qvc, animated: true)
     }
 }


//extension ViewController: UITableViewDelegate {
//
//}

// TODO 6: Conform to UICollectionViewDataSource

// TODO 7: Confrom to UICollectionViewDelegateFlowLayout
// TODO 9: Conform to UICollectionViewDelegate, implement interaction
