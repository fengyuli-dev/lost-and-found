//
//  RegisterController.swift
//  Lost and Found
//
//  Created by Haoxuan Zou on 11/30/21.
//

import Foundation
import UIKit

protocol UserDelegate:class{
    func updateToken(token:String);
//    func updateId(id:Int);
//    func updateEmail(email:String);
    func getToken()->String;
//    func getId()->Int;
//    func getEmail()->String;
}

class RegisterController: UIViewController{
    
    
    private var netIdText = UITextField();
    private var passwordText = UITextField();
    private var registerButton = UIButton();
    private var token = ""
    private var id = 0
    private var email = ""
    private var delegate:UserDelegate
    
    init(delegate:UserDelegate){
        self.delegate=delegate
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        
        registerButton.backgroundColor = UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1)
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.layer.cornerRadius = 23;
        parent.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false;
        registerButton.centerXAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerXAnchor).isActive = true;
        registerButton.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 30).isActive = true;
        registerButton.widthAnchor.constraint(equalToConstant: CGFloat(150)).isActive = true;
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
    }
    
    @objc func registerTapped(){
        if let netId = netIdText.text, let password = passwordText.text{
            print("register iflet good.")
            print(netId);print(password)
            NetworkManager.register(email: netId, password: password, completion: { user in
                print("success,network,register")
                self.delegate.updateToken(token: user.session_token);
//                self.delegate.updateId(id: user.detail.id);
//                self.delegate.updateEmail(email: user.detail.email)
                print(user.session_token)
                self.updateToken(token: user.session_token)
                print(self.token)
                print(user.detail.id)
            }, errorHandler: { boolresult in
                
                if boolresult=="false"{
                    print("now the bool is false")
                    let createAlert = UIAlertController(title: "Register Failed!", message: .none, preferredStyle: .alert)
                    createAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    self.present(createAlert,animated: true)
                    //create an alert.
                }
            })
        }
    }
    

        
}


extension RegisterController:UserDelegate{
    func getId() -> Int {
        return self.id
    }
    
    func getEmail() -> String {
        return self.email
    }
    
    func updateToken(token: String) {
        self.token=token
    }
    
    func updateId(id: Int) {
        self.id=id
    }
    
    func updateEmail(email: String) {
        self.email=email
    }
    func getToken() -> String{
        return self.token;
    }
    
}
