
//
//  ViewController.swift
//  Lost and Found
//
//  Created by Haoxuan Zou on 11/19/21.
//

import UIKit

class MainViewController: UIViewController{
    
    private var netIdText = UITextField();
    private var passwordText = UITextField();
    private var loginButton = UIButton();
    private var registerButton = UIButton();
    private var token = ""
    private var id = 0
    private var email = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 0.325, green: 0.38, blue: 0.424, alpha: 1)
        let theWidth = view.frame.width * 0.685;
        let theHeight = view.frame.height * 0.06;
        
        
        netIdText.backgroundColor = .white
        netIdText.layer.backgroundColor = UIColor(red: 0.941, green: 0.961, blue: 0.976, alpha: 1).cgColor
        let parent = self.view!
        parent.addSubview(netIdText)
        netIdText.translatesAutoresizingMaskIntoConstraints = false
        netIdText.widthAnchor.constraint(equalToConstant: theWidth).isActive = true
        netIdText.heightAnchor.constraint(equalToConstant: theHeight).isActive = true
        netIdText.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        netIdText.centerXAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerXAnchor).isActive = true;
        netIdText.placeholder = "  NetId"
        //the font is set in the rear part.
        
        
        
        passwordText.backgroundColor = .white
        passwordText.layer.backgroundColor = UIColor(red: 0.941, green: 0.961, blue: 0.976, alpha: 1).cgColor
        passwordText.placeholder = "  Password";
        parent.addSubview(passwordText)
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordText.widthAnchor.constraint(equalToConstant: theWidth).isActive = true
        passwordText.heightAnchor.constraint(equalToConstant: theHeight).isActive = true
        passwordText.topAnchor.constraint(equalTo: netIdText.bottomAnchor, constant: 20).isActive = true
        passwordText.layer.cornerRadius = 10;
        passwordText.centerXAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
        loginButton.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.layer.cornerRadius = 23;
        parent.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false;
        loginButton.centerXAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerXAnchor).isActive = true;
        loginButton.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 30).isActive = true;
        loginButton.widthAnchor.constraint(equalToConstant: CGFloat(150)).isActive = true;
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        registerButton.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1)
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.layer.cornerRadius = 23;
        parent.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false;
        registerButton.centerXAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerXAnchor).isActive = true;
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30).isActive = true;
        registerButton.widthAnchor.constraint(equalToConstant: CGFloat(150)).isActive = true;
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
        
        let theFont = theHeight * 0.367;
        netIdText.font = UIFont(name: "RoundedMplus1c-Medium", size: theFont)
        loginButton.titleLabel?.font = UIFont(name:"RoundedMplus1c-Medium", size: theFont);
        passwordText.font = UIFont(name: "RoundedMplus1c-Medium", size: theFont)
        registerButton.titleLabel?.font = UIFont(name: "RoundedMplus1c-Medium", size: theFont)
 
        
    }
    @objc func loginTapped(){
        //you lack an if let method!
        if let netId = netIdText.text, let password = passwordText.text{
            print("login iflet good.")
            print(netId);print(password)

            NetworkManager.login(email: netId, password: password, completion: { user in
                print("success!!??!!")
                self.updateToken(token: user.session_token);
//                self.updateId(id: user.detail.id);
//                self.updateEmail(email: user.detail.email)
                print(user.session_token)
                print(user.detail.id)
                let qvc = QuestionViewController();
                self.navigationController?.pushViewController(qvc, animated: true)
            },errorHandler: { boolresult in
                if boolresult=="false"{
                    let createAlert = UIAlertController(title: "Login Failed!", message: nil, preferredStyle: .alert)
                    createAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    self.present(createAlert,animated: true)
                }
                
            }
            )
            
        }else{
            let createAlert = UIAlertController(title: "Register Failed!", message: nil, preferredStyle: .alert)
            createAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(createAlert,animated: true)
        }

    }
    
    @objc func registerTapped(){
        let rvc = RegisterController(delegate: self);
        self.navigationController?.pushViewController(rvc, animated: true)
    }


}

extension MainViewController:UserDelegate{
//    func getId() -> Int {
//        return self.id
//    }
//
//    func getEmail() -> String {
//        return self.email
//    }
//

    
//    func updateId(id: Int) {
//        self.id=id
//    }
//
//    func updateEmail(email: String) {
//        self.email=email
//    }
    func updateToken(token: String) {
        self.token=token
    }
    func getToken() -> String{
        return self.token;
    }
}

