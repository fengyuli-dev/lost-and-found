//
//  PostFoundViewController.swift
//  Lost and Found
//
//  Created by Vivian on 11/30/21.
//

import Foundation

import SwiftUI

class PostFoundViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
//    init(delegate: UpdateTitleDelegate?, placeholderText: String) {
//        self.delegate = delegate
//        self.placeholderText = placeholderText
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    var name = UILabel()
    var nameInput = UITextField()
    
    var descrip = UILabel()
    var descripInput = UITextField()
    
    var location = UILabel()
    var locInput = UITextField()
    
    var time = UILabel()
    var timeInput = UITextField()
    
    var contact = UILabel()
    var contact_name = UILabel()
    var contact_phone = UILabel()
    var contact_time = UILabel()
    var contact_name_input = UITextField()
    var contact_phone_input = UITextField()
    var contact_time_input = UITextField()
    
    var lost_image = UIButton()
    var imageUserProfile = UIImageView()
    
    var isPost:Bool = false
    
    var PostFound_Button = UIButton()
    
//    var rec1 = UILabel()
//    var rec2 = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Post Found"
        let color: UIColor=UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1)
        let textAttributes = [NSAttributedString.Key.foregroundColor: color]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        view.backgroundColor = UIColor(red: 0.325, green: 0.38, blue: 0.424, alpha: 1)

        setupViews()
        setupConstraints()
    }
    
    //alert
    private func promptUserForName() -> String {
        let alert = UIAlertController(title: "Enter your name:", message: nil, preferredStyle: .alert)

        // Presents a keyboard for user to enter name
        var userInputField: UITextField?
        alert.addTextField { (textField: UITextField!) in
            userInputField = textField
        }

        var name: String = ""
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
            if let userInfo = userInputField!.text {
                name = userInfo
            }
        })

        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
        return name
    }
    
    private func promptUserForPhone() -> String {
        let alert = UIAlertController(title: "Enter phone number:", message: nil, preferredStyle: .alert)

        // Presents a keyboard for user to enter name
        var userInputField: UITextField?
        alert.addTextField { (textField: UITextField!) in
            userInputField = textField
        }

        var phone: String = ""
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
            if let userInfo = userInputField!.text {
                phone = userInfo
            }
        })

        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
        return phone
    }
    
    //delegate methods for selecting images from gallery
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

           // The info dictionary may contain multiple representations of the image. You want to use the original.
           guard let selectedImage = info[.originalImage] as? UIImage else {
               fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
           }

           // Set photoImageView to display the selected image.
           imageUserProfile.image = selectedImage

           // Dismiss the picker.
           dismiss(animated: true, completion: nil)
           
           viewDidLoad()
       }
    
    @objc func showActionSheet(){
            isPost = true
        
            //Create the AlertController and add Its action like button in Actionsheet
            let actionSheetController: UIAlertController = UIAlertController(title: NSLocalizedString("Upload Image", comment: ""), message: nil, preferredStyle: .actionSheet)
            actionSheetController.view.tintColor = UIColor.black
            let cancelActionButton: UIAlertAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel) { action -> Void in
                print("Cancel")
            }
            actionSheetController.addAction(cancelActionButton)

            let deleteActionButton: UIAlertAction = UIAlertAction(title: NSLocalizedString("Choose From Gallery", comment: ""), style: .default)
            { action -> Void in
                self.gallery()
            }
        
            actionSheetController.addAction(deleteActionButton)
            self.present(actionSheetController, animated: true, completion: nil)
        }
    

    
    func gallery(){
        let myPickerControllerGallery = UIImagePickerController()
        myPickerControllerGallery.delegate = self
        myPickerControllerGallery.sourceType = UIImagePickerController.SourceType.photoLibrary
        myPickerControllerGallery.allowsEditing = true
        self.present(myPickerControllerGallery, animated: true, completion: nil)
    }
    
    func setupViews(){
        let color: UIColor=UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1)
        let border_width : CGFloat = 0.5
        
        //lost_image
        lost_image.frame = CGRect(x: 0, y: 0, width: 200, height: 35)
        lost_image.setTitle("Choose image", for: .normal)
        lost_image.layer.backgroundColor = color.cgColor
        lost_image.setTitleColor(.black, for: .normal)
        lost_image.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
        lost_image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lost_image)
        
        
        // imageViewPic
        if (isPost){
            imageUserProfile.clipsToBounds = true
            imageUserProfile.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(imageUserProfile);
        }

        //PostFound_Button
        PostFound_Button.frame = CGRect(x: 0, y: 0, width: 130, height: 46)
        PostFound_Button.setTitle("Post", for: .normal)
        PostFound_Button.layer.backgroundColor = color.cgColor
        PostFound_Button.setTitleColor(.black, for: .normal)
        PostFound_Button.layer.cornerRadius = 23
        PostFound_Button.addTarget(self, action: #selector(PostFTapped), for: .touchUpInside)
        PostFound_Button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(PostFound_Button)
        
        //name
        name.text="Item's name:"
        name.font = UIFont(name: "RoundedMplus1c-Medium", size: 18)
        name.textColor = color
        name.textAlignment = .left
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
        
        //nameInput
        nameInput.font = UIFont.systemFont(ofSize: 18)
//        nameInput.borderStyle =
        nameInput.textColor = color
        nameInput.layer.borderColor = color.cgColor
        nameInput.layer.borderWidth = border_width
        nameInput.textAlignment = .left
        nameInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameInput)
        
        //descrip
        descrip.text = "Description:"
        descrip.font = UIFont(name: "RoundedMplus1c-Medium", size: 18)
        descrip.textColor = color
        descrip.textAlignment = .left
        descrip.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descrip)
        
        //descripInput
        descripInput.font = UIFont.systemFont(ofSize: 18)
//        nameInput.borderStyle =
        descripInput.textColor = color
        descripInput.layer.borderColor = color.cgColor
        descripInput.layer.borderWidth = border_width
        descripInput.textAlignment = .left
        descripInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descripInput)
        
        //location
        location.text="Found Location:"
        location.font = UIFont(name: "RoundedMplus1c-Medium", size: 18)
        location.textColor = color
        location.textAlignment = .left
        location.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(location)
        
        //locInput
        locInput.font = UIFont.systemFont(ofSize: 18)
//        nameInput.borderStyle =
        locInput.textColor = color
        locInput.layer.borderColor = color.cgColor
        locInput.layer.borderWidth = border_width
        locInput.textAlignment = .left
        locInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(locInput)
        
        //time
        time.text="Found time:"
        time.font = UIFont(name: "RoundedMplus1c-Medium", size: 18)
        time.textColor = color
        time.textAlignment = .left
        time.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(time)
        
        //timeInput
        timeInput.font = UIFont.systemFont(ofSize: 18)
//        nameInput.borderStyle =
        timeInput.textColor = color
        timeInput.layer.borderColor = color.cgColor
        timeInput.layer.borderWidth = border_width
        timeInput.textAlignment = .left
        timeInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timeInput)
        
        //owner contact
        contact.text="Owner's contact:"
        contact.font = UIFont(name: "RoundedMplus1c-Medium", size: 18)
        contact.textColor = color
        contact.textAlignment = .left
        contact.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contact)
        
        
        //contact_name
        contact_name.text="Contact's name"
        contact_name.font = UIFont(name: "RoundedMplus1c-Medium", size: 12)
        contact_name.textColor = color
        contact_name.textAlignment = .left
        contact_name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contact_name)
        
        //contact_name_input
        contact_name_input.font = UIFont.systemFont(ofSize: 12)
//        nameInput.borderStyle =
        contact_name_input.textColor = color
        contact_name_input.layer.borderColor = color.cgColor
        contact_name_input.layer.borderWidth = border_width
        contact_name_input.textAlignment = .left
        contact_name_input.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contact_name_input)
        
        //contact_phone
        contact_phone.text="Email/Phone:"
        contact_phone.font = UIFont(name: "RoundedMplus1c-Medium", size: 12)
        contact_phone.textColor = color
        contact_phone.textAlignment = .left
        contact_phone.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contact_phone)
        
        //contact_phone_input
        contact_phone_input.font = UIFont.systemFont(ofSize: 12)
//        nameInput.borderStyle =
        contact_phone_input.textColor = color
        contact_phone_input.layer.borderColor = color.cgColor
        contact_phone_input.layer.borderWidth = border_width
        contact_phone_input.textAlignment = .left
        contact_phone_input.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contact_phone_input)
        
        //contact_time
        contact_time.text="Preferred Contact Time"
        contact_time.font = UIFont(name: "RoundedMplus1c-Medium", size: 12)
        contact_time.textColor = color
        contact_time.textAlignment = .left
        contact_time.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contact_time)
        
        //contact_time_input
        contact_time_input.font = UIFont.systemFont(ofSize: 12)
//        nameInput.borderStyle =
        contact_time_input.textColor = color
        contact_time_input.layer.borderColor = color.cgColor
        contact_time_input.layer.borderWidth = border_width
        contact_time_input.textAlignment = .left
        contact_time_input.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contact_time_input)
        
    
    }
    
    @objc func PostFTapped() {
        //还需要实现如何再增加一行table view
//        while(nameInput.text == ""){
//            nameInput.text = promptUserForName()
//        }
//        while (contact_phone_input.text==""){
//            contact_phone_input.text=promptUserForPhone()
//        }
        let name = nameInput.text ?? ""
        let description = descripInput.text ?? ""
        let time = timeInput.text ?? ""
        let location = locInput.text ?? ""
        NetworkManager.postFound(name: name, time: time, description: description, location: location) { item in
            print("postFoundComplete!")
            print(item)
            let FVC = FoundViewController();
            self.navigationController?.pushViewController(FVC, animated: true)
            FVC.viewDidLoad();
        }
    }

    func setupConstraints() {
        
        //the parameter used in this section. Modify the scaler, the whole thing is adjusted.
        let width: CGFloat = 285
        let leading: CGFloat = 18
        let s_padding: CGFloat = 1
        let l_padding: CGFloat = 8
        
//        //name
        NSLayoutConstraint.activate([
            name.widthAnchor.constraint(equalToConstant: 132),
            name.heightAnchor.constraint(equalToConstant: 24),
            name.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
        ])

        NSLayoutConstraint.activate([
            nameInput.widthAnchor.constraint(equalToConstant: width),
            nameInput.heightAnchor.constraint(equalToConstant: 23),
            nameInput.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            nameInput.topAnchor.constraint(equalTo: name.bottomAnchor, constant: s_padding),
        ])
        
        //descrip & descripInput
        NSLayoutConstraint.activate([
            descrip.widthAnchor.constraint(equalToConstant: 107),
            descrip.heightAnchor.constraint(equalToConstant: 24),
            descrip.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            descrip.topAnchor.constraint(equalTo: nameInput.bottomAnchor, constant: l_padding),
        ])
        NSLayoutConstraint.activate([
            descripInput.widthAnchor.constraint(equalToConstant: width),
            descripInput.heightAnchor.constraint(equalToConstant: 50),
            descripInput.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            descripInput.topAnchor.constraint(equalTo: descrip.bottomAnchor, constant: s_padding),
        ])
        
        //location locInput
        NSLayoutConstraint.activate([
            location.widthAnchor.constraint(equalToConstant: 140),
            location.heightAnchor.constraint(equalToConstant: 24),
            location.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            location.topAnchor.constraint(equalTo: descripInput.bottomAnchor, constant: l_padding),
        ])
        NSLayoutConstraint.activate([
            locInput.widthAnchor.constraint(equalToConstant: width),
            locInput.heightAnchor.constraint(equalToConstant: 23),
            locInput.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            locInput.topAnchor.constraint(equalTo: location.bottomAnchor, constant: s_padding),
        ])
        
        //time timeInput
        NSLayoutConstraint.activate([
            time.widthAnchor.constraint(equalToConstant: 89),
            time.heightAnchor.constraint(equalToConstant: 24),
            time.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            time.topAnchor.constraint(equalTo: locInput.bottomAnchor, constant: l_padding),
        ])
        NSLayoutConstraint.activate([
            timeInput.widthAnchor.constraint(equalToConstant: width),
            timeInput.heightAnchor.constraint(equalToConstant: 23),
            timeInput.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            timeInput.topAnchor.constraint(equalTo: time.bottomAnchor, constant: s_padding),
        ])
        
        //lost_image
        NSLayoutConstraint.activate([
            lost_image.widthAnchor.constraint(equalToConstant: 200),
            lost_image.heightAnchor.constraint(equalToConstant: 24),
            lost_image.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            lost_image.topAnchor.constraint(equalTo: timeInput.bottomAnchor, constant: l_padding),
        ])
        
        //imageUserProfile
        if (isPost){
        NSLayoutConstraint.activate([
            imageUserProfile.widthAnchor.constraint(equalToConstant: 100),
            imageUserProfile.heightAnchor.constraint(equalToConstant: 100),
            imageUserProfile.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            imageUserProfile.topAnchor.constraint(equalTo: lost_image.bottomAnchor, constant: s_padding),
        ])
        }
        
        //contact contact_name_input contact_phone_input contact_time_input
        NSLayoutConstraint.activate([
            contact.widthAnchor.constraint(equalToConstant: 148),
            contact.heightAnchor.constraint(equalToConstant: 24),
            contact.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            contact.topAnchor.constraint(equalTo: lost_image.bottomAnchor, constant: 115),
        ])
        NSLayoutConstraint.activate([
            contact_name.widthAnchor.constraint(equalToConstant: 140),
            contact_name.heightAnchor.constraint(equalToConstant: 20),
            contact_name.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            contact_name.topAnchor.constraint(equalTo: contact.bottomAnchor, constant: s_padding),
        ])
        NSLayoutConstraint.activate([
            contact_name_input.widthAnchor.constraint(equalToConstant: 144),
            contact_name_input.heightAnchor.constraint(equalToConstant: 20),
            contact_name_input.leadingAnchor.constraint(equalTo: contact_name.trailingAnchor,constant: 3),
            contact_name_input.topAnchor.constraint(equalTo: contact.bottomAnchor, constant: s_padding),
        ])
        NSLayoutConstraint.activate([
            contact_phone.widthAnchor.constraint(equalToConstant: 140),
            contact_phone.heightAnchor.constraint(equalToConstant: 20),
            contact_phone.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            contact_phone.topAnchor.constraint(equalTo: contact_name.bottomAnchor, constant: s_padding),
        ])
        NSLayoutConstraint.activate([
            contact_phone_input.widthAnchor.constraint(equalToConstant: 144),
            contact_phone_input.heightAnchor.constraint(equalToConstant: 20),
            contact_phone_input.leadingAnchor.constraint(equalTo: contact_phone.trailingAnchor,constant: 3),
            contact_phone_input.topAnchor.constraint(equalTo: contact_name.bottomAnchor, constant: s_padding),
        ])
        NSLayoutConstraint.activate([
            contact_time.widthAnchor.constraint(equalToConstant: 200),
            contact_time.heightAnchor.constraint(equalToConstant: 20),
            contact_time.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            contact_time.topAnchor.constraint(equalTo: contact_phone.bottomAnchor, constant: s_padding),
        ])
        NSLayoutConstraint.activate([
            contact_time_input.widthAnchor.constraint(equalToConstant: 319),
            contact_time_input.heightAnchor.constraint(equalToConstant: 25),
            contact_time_input.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            contact_time_input.topAnchor.constraint(equalTo: contact_time.bottomAnchor, constant: s_padding),
        ])
        
        //PostLost_Button
        NSLayoutConstraint.activate([
            PostFound_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            PostFound_Button.widthAnchor.constraint(equalToConstant: 130),
            PostFound_Button.heightAnchor.constraint(equalToConstant: 40),
            PostFound_Button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
        
        
        
        
        
        
        
        

    }
}
