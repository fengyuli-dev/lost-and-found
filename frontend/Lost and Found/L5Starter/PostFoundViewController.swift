import SwiftUI

class PostFoundViewController: UIViewController {
    
//    init(delegate: UpdateTitleDelegate?, placeholderText: String) {
//        self.delegate = delegate
//        self.placeholderText = placeholderText
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    // TODO 1: set up view
    var name = UILabel()
    var nameInput = UITextField()
    
    var note = UILabel()
    var noteInput = UITextField()
    
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
    
    var PostF_Button = UIButton()
    
//    var rec1 = UILabel()
//    var rec2 = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Post Lost"
        let color: UIColor=UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1)
        let textAttributes = [NSAttributedString.Key.foregroundColor: color]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        view.backgroundColor = UIColor(red: 0.325, green: 0.38, blue: 0.424, alpha: 1)

        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        let color: UIColor=UIColor(red: 0.788, green: 0.839, blue: 0.875, alpha: 1)
        let border_width : CGFloat = 0.5
        
        //PostF_Button
        PostF_Button.frame = CGRect(x: 0, y: 0, width: 130, height: 46)
        PostF_Button.setTitle("Post", for: .normal)
        PostF_Button.layer.backgroundColor = color.cgColor
        PostF_Button.setTitleColor(.black, for: .normal)
        PostF_Button.layer.cornerRadius = 23
        PostF_Button.addTarget(self, action: #selector(PostFTapped), for: .touchUpInside)
        PostF_Button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(PostF_Button)
        
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
        
        //note
        note.text = "Description:"
        note.font = UIFont(name: "RoundedMplus1c-Medium", size: 18)
        note.textColor = color
        note.textAlignment = .left
        note.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(note)
        
        //noteInput
        noteInput.font = UIFont.systemFont(ofSize: 18)
//        nameInput.borderStyle =
        noteInput.textColor = color
        noteInput.layer.borderColor = color.cgColor
        noteInput.layer.borderWidth = border_width
        noteInput.textAlignment = .left
        noteInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(noteInput)
        
        //location
        location.text="Lost Location:"
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
        time.text="Lost time:"
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
//        let FVC = FoundDescViewController();
//            self.navigationController?.pushViewController(FVC, animated: true)
    }

    func setupConstraints() {
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
            nameInput.heightAnchor.constraint(equalToConstant: 30),
            nameInput.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: leading),
            nameInput.topAnchor.constraint(equalTo: name.bottomAnchor, constant: s_padding),
        ])
        
        //descrip & descripInput
        NSLayoutConstraint.activate([
            note.widthAnchor.constraint(equalToConstant: 107),
            note.heightAnchor.constraint(equalToConstant: 27),
            note.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            note.topAnchor.constraint(equalTo: nameInput.bottomAnchor, constant: l_padding),
        ])
        NSLayoutConstraint.activate([
            noteInput.widthAnchor.constraint(equalToConstant: width),
            noteInput.heightAnchor.constraint(equalToConstant: 30),
            noteInput.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            noteInput.topAnchor.constraint(equalTo: note.bottomAnchor, constant: s_padding),
        ])
        
        //location locInput
        NSLayoutConstraint.activate([
            location.widthAnchor.constraint(equalToConstant: 121),
            location.heightAnchor.constraint(equalToConstant: 27),
            location.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            location.topAnchor.constraint(equalTo: noteInput.bottomAnchor, constant: l_padding),
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
            time.heightAnchor.constraint(equalToConstant: 27),
            time.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            time.topAnchor.constraint(equalTo: locInput.bottomAnchor, constant: l_padding),
        ])
        NSLayoutConstraint.activate([
            timeInput.widthAnchor.constraint(equalToConstant: width),
            timeInput.heightAnchor.constraint(equalToConstant: 23),
            timeInput.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            timeInput.topAnchor.constraint(equalTo: time.bottomAnchor, constant: s_padding),
        ])
        
        //contact contact_name_input contact_phone_input contact_time_input
        NSLayoutConstraint.activate([
            contact.widthAnchor.constraint(equalToConstant: 148),
            contact.heightAnchor.constraint(equalToConstant: 27),
            contact.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            contact.topAnchor.constraint(equalTo: timeInput.bottomAnchor, constant: 35),
        ])
        NSLayoutConstraint.activate([
            contact_name.widthAnchor.constraint(equalToConstant: 140),
            contact_name.heightAnchor.constraint(equalToConstant: 22),
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
            contact_phone.heightAnchor.constraint(equalToConstant: 22),
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
            contact_time.heightAnchor.constraint(equalToConstant: 22),
            contact_time.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            contact_time.topAnchor.constraint(equalTo: contact_phone.bottomAnchor, constant: s_padding),
        ])
        NSLayoutConstraint.activate([
            contact_time_input.widthAnchor.constraint(equalToConstant: 319),
            contact_time_input.heightAnchor.constraint(equalToConstant: 30),
            contact_time_input.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: leading),
            contact_time_input.topAnchor.constraint(equalTo: contact_time.bottomAnchor, constant: s_padding),
        ])
        
        //PostF_Button
        NSLayoutConstraint.activate([
            PostF_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            PostF_Button.widthAnchor.constraint(equalToConstant: 130),
            PostF_Button.heightAnchor.constraint(equalToConstant: 46),
            PostF_Button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
        
        
        
        
        
        
        
        

    }
}

