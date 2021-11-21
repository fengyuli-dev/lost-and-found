//
//  FoundTableViewCell.swift
//  LostandFound
//
//  Created by Vivian on 11/20/21.
//
import SwiftUI

class FoundTableViewCell: UICollectionViewCell {
    
    var name = UILabel()
    var location = UILabel()
    var time = UILabel()
    var des_image = UIImageView()
    var rec = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for item: Item) {
        name.text = item.objectName
        location.text = item.location
        time.text = item.time
        des_image.image = item.pics
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 25;
        
        
        rec.layer.backgroundColor = UIColor(red: 0.941, green: 0.961, blue: 0.976, alpha: 1).cgColor
        rec.layer.cornerRadius = 25
        contentView.addSubview(rec)
        
        
        name.font = UIFont(name: "RoundedMplus1c-ExtraBold", size: 50)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .black;
        name.adjustsFontSizeToFitWidth = true;
        name.adjustsFontForContentSizeCategory = true;
        contentView.addSubview(name)
        
        location.font = UIFont(name: "RoundedMplus1c-Regular", size: 15)
        location.textColor=UIColor(red: 0.557, green: 0.557, blue: 0.557, alpha: 1)
        location.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(location)
        
        time.font = UIFont(name: "RoundedMplus1c-Light", size: 5)
        time.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.557, alpha: 1)
        time.adjustsFontSizeToFitWidth = true;
        time.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(time)
        
//        des_image.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(des_image)
        //haven't figured out how to handle images
        
        setupConstraints()
    }
    
    
    func setupConstraints() {
        
//        NSLayoutConstraint.activate([
//            rec.widthAnchor.constraint(equalToConstant: 309),
//            rec.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: CGFloat(0.75)),
//            rec.heightAnchor.constraint(equalToConstant: 92),
//            rec.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            rec.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
//        ])
        
        NSLayoutConstraint.activate([
            location.widthAnchor.constraint(equalToConstant: 180),
            location.heightAnchor.constraint(equalToConstant: 20),
            location.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            location.topAnchor.constraint(equalTo: name.topAnchor, constant: 28),
        ])
        
        NSLayoutConstraint.activate([
            name.widthAnchor.constraint(equalToConstant: 130),
            name.heightAnchor.constraint(equalToConstant: 50),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
        ])
        

        NSLayoutConstraint.activate([
//            time.widthAnchor.constraint(equalToConstant: 35),
            time.heightAnchor.constraint(equalToConstant: 15),
            time.leadingAnchor.constraint(equalTo: name.trailingAnchor, constant: 20),
            time.centerYAnchor.constraint(equalTo: name.centerYAnchor),
            time.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
        ])
        
//        NSLayoutConstraint.activate([
//            des_image.widthAnchor.constraint(equalToConstant: 58),
//            des_image.heightAnchor.constraint(equalToConstant: 70),
//            des_image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 229),
//            des_image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
//        ])
        
        
    }

}
