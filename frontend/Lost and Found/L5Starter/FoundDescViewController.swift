//
//  FoundDescViewController.swift
//  LostandFound
//
//  Created by Vivian on 11/21/21.
//
import SwiftUI

class FoundDescViewController: UIViewController{
    
    var name_title = UILabel()
    var name = UILabel()
    var loc_title = UILabel()
    var location = UILabel()
    var time_title = UILabel()
    var time = UILabel()
    var note_title = UILabel()
    var note = UILabel()
    var contact_title = UILabel()
    var contact = UILabel()
    

//    override func containerViewDidLayoutSubviews() {
//        super.containerViewDidLayoutSubviews()
//        self.presentedView?.frame = frameOfPresentedViewInContainerView
//
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Found Description"
        view.backgroundColor = .white

        setupViews()
        setupConstraints()
    }
    
    func configure(for item: Item) {
        name.text = item.objectName
        location.text = item.location
        time.text = item.time
        contact.text = item.contact
        note.text = item.note
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
        
        loc_title.text="Found Location:"
        loc_title.textColor = .black
        loc_title.font = UIFont(name: "RoundedMplus1c-Medium", size: 15)
        loc_title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loc_title)
        
        location.textColor = .black
        location.font = UIFont(name: "RoundedMplus1c-Medium", size: 12)
        location.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(location)
        
        time_title.text="Found Time:"
        time_title.textColor = .black
        time_title.font = UIFont(name: "RoundedMplus1c-Medium", size: 15)
        time_title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(time_title)
        
        time.textColor = .black
        time.font = UIFont(name: "RoundedMplus1c-Medium", size: 12)
        time.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(time)
        
        note_title.text="Founder's Note:"
        note_title.textColor = .black
        note_title.font = UIFont(name: "RoundedMplus1c-Medium", size: 15)
        note_title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(note_title)
        
        note.textColor = .black
        note.font = UIFont(name: "RoundedMplus1c-Medium", size: 12)
        note.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(note)

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
            note_title.widthAnchor.constraint(equalToConstant: 329),
            note_title.heightAnchor.constraint(equalToConstant: 28),
            note_title.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            note_title.topAnchor.constraint(equalTo: time.bottomAnchor, constant: l_padding),
        ])
        NSLayoutConstraint.activate([
            note.widthAnchor.constraint(equalToConstant: 329),
            note.heightAnchor.constraint(equalToConstant: 20),
            note.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            note.topAnchor.constraint(equalTo: note_title.bottomAnchor, constant: s_padding),
        ])
        
        NSLayoutConstraint.activate([
            contact_title.widthAnchor.constraint(equalToConstant: 287),
            contact_title.heightAnchor.constraint(equalToConstant: 28),
            contact_title.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            contact_title.topAnchor.constraint(equalTo: note.bottomAnchor, constant: l_padding),
        ])
        NSLayoutConstraint.activate([
            contact.widthAnchor.constraint(equalToConstant: 287),
            contact.heightAnchor.constraint(equalToConstant: 102),
            contact.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            contact.topAnchor.constraint(equalTo: contact_title.bottomAnchor, constant: s_padding),
        ])
        
        
        
        
        

    }
}