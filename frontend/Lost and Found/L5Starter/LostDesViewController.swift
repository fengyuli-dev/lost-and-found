//
//  FoundDescViewController.swift
//  LostandFound
//
//  Created by Vivian on 11/21/21.
//

import SwiftUI

class LostDescViewController: UIViewController{
    
    var name_title = UILabel()
    var name = UILabel()
    var loc_title = UILabel()
    var location = UILabel()
    var time_title = UILabel()
    var time = UILabel()
    var des_title = UILabel()
    var descrip = UILabel()
    var contact_title = UILabel()
    var contact = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Found Description"
        view.backgroundColor = .white

        setupViews()
        setupConstraints()
    }
    
    func configure(for item: Lost_Item) {
        name.text = item.objectName
        location.text = item.location
        time.text = item.time
        contact.text = item.contact
        descrip.text = item.descrip
    }
    
    func setupViews(){

        //name_title
        name_title.text="Item's Name:"
        name_title.textColor = .black
        name_title.font = UIFont(name: "RoundedMplus1c-Medium", size: 15)
        name_title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name_title)
        
        name.font = UIFont(name: "RoundedMplus1c-Medium", size: 12)
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
        
        loc_title.text="Lost Location:"
        loc_title.textColor = .black
        loc_title.font = UIFont(name: "RoundedMplus1c-Medium", size: 15)
        loc_title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loc_title)
        
        location.textColor = .black
        location.font = UIFont(name: "RoundedMplus1c-Medium", size: 12)
        location.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(location)
        
        time_title.text="Lost Time:"
        time_title.textColor = .black
        time_title.font = UIFont(name: "RoundedMplus1c-Medium", size: 15)
        time_title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(time_title)
        
        time.textColor = .black
        time.font = UIFont(name: "RoundedMplus1c-Medium", size: 12)
        time.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(time)
        
        des_title.text="Founder's Note:"
        des_title.textColor = .black
        des_title.font = UIFont(name: "RoundedMplus1c-Medium", size: 15)
        des_title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(des_title)
        
        descrip.textColor = .black
        descrip.font = UIFont(name: "RoundedMplus1c-Medium", size: 12)
        descrip.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descrip)

        contact_title.text="Contact:"
        contact_title.textColor = .black
        contact_title.font = UIFont(name: "RoundedMplus1c-Medium", size: 15)
        contact_title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contact_title)
        
        contact.textColor = .black
        contact.font = UIFont(name: "RoundedMplus1c-Medium", size: 12)
        contact.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contact)
        
    }
    
    func setupConstraints(){
        let s_padding: CGFloat = 1
        let l_padding: CGFloat = 6
        let leading: CGFloat = 18
        
        NSLayoutConstraint.activate([
            name_title.widthAnchor.constraint(equalToConstant: 114),
            name_title.heightAnchor.constraint(equalToConstant: 28),
            name_title.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            name_title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        ])
        NSLayoutConstraint.activate([
            name.widthAnchor.constraint(equalToConstant: 114),
            name.heightAnchor.constraint(equalToConstant: 20),
            name.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            name.topAnchor.constraint(equalTo: name_title.bottomAnchor, constant: s_padding),
        ])
        
        NSLayoutConstraint.activate([
            loc_title.widthAnchor.constraint(equalToConstant: 305),
            loc_title.heightAnchor.constraint(equalToConstant: 28),
            loc_title.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            loc_title.topAnchor.constraint(equalTo: name.bottomAnchor, constant: l_padding),
        ])
        NSLayoutConstraint.activate([
            location.widthAnchor.constraint(equalToConstant: 305),
            location.heightAnchor.constraint(equalToConstant: 20),
            location.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            location.topAnchor.constraint(equalTo: loc_title.bottomAnchor, constant: s_padding),
        ])
        
        NSLayoutConstraint.activate([
            time_title.widthAnchor.constraint(equalToConstant: 167),
            time_title.heightAnchor.constraint(equalToConstant: 28),
            time_title.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            time_title.topAnchor.constraint(equalTo: location.bottomAnchor, constant: l_padding),
        ])
        NSLayoutConstraint.activate([
            time.widthAnchor.constraint(equalToConstant: 167),
            time.heightAnchor.constraint(equalToConstant: 20),
            time.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            time.topAnchor.constraint(equalTo: time_title.bottomAnchor, constant: s_padding),
        ])
        
        NSLayoutConstraint.activate([
            des_title.widthAnchor.constraint(equalToConstant: 329),
            des_title.heightAnchor.constraint(equalToConstant: 28),
            des_title.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            des_title.topAnchor.constraint(equalTo: time.bottomAnchor, constant: l_padding),
        ])
        NSLayoutConstraint.activate([
            descrip.widthAnchor.constraint(equalToConstant: 329),
            descrip.heightAnchor.constraint(equalToConstant: 20),
            descrip.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            descrip.topAnchor.constraint(equalTo: des_title.bottomAnchor, constant: s_padding),
        ])
        
        NSLayoutConstraint.activate([
            contact_title.widthAnchor.constraint(equalToConstant: 287),
            contact_title.heightAnchor.constraint(equalToConstant: 28),
            contact_title.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            contact_title.topAnchor.constraint(equalTo: descrip.bottomAnchor, constant: l_padding),
        ])
        NSLayoutConstraint.activate([
            contact.widthAnchor.constraint(equalToConstant: 287),
            contact.heightAnchor.constraint(equalToConstant: 102),
            contact.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            contact.topAnchor.constraint(equalTo: contact_title.bottomAnchor, constant: s_padding),
        ])
        
        
        
        
        

    }
}
