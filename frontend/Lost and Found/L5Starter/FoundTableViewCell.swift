//
//  FoundTableViewCell.swift
//  LostandFound
//
//  Created by Vivian on 11/20/21.
//

import SwiftUI

class FoundTableViewCell: UITableViewCell {
    
    var name = UILabel()
    var location = UILabel()
    var time = UILabel()
    var des_image = UIImageView()
    var rec = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        name.font = UIFont(name: "RoundedMplus1c-ExtraBold", size: 18)
        name.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(name)
        
        location.font = UIFont(name: "RoundedMplus1c-Regular", size: 15)
        location.textColor=UIColor(red: 0.557, green: 0.557, blue: 0.557, alpha: 1)
        location.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(location)
        
        time.font = UIFont(name: "RoundedMplus1c-Light", size: 10)
        time.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.557, alpha: 1)
        time.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(time)
        
        des_image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(des_image)
        
        rec.frame = CGRect(x: 0, y: 0, width: 309, height: 92)
        rec.layer.backgroundColor = UIColor(red: 0.941, green: 0.961, blue: 0.976, alpha: 1).cgColor
        rec.layer.cornerRadius = 25
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for item: Item) {
        name.text = item.objectName
        location.text = item.location
        time.text = item.time
        des_image.image = item.pics
    }
    
    func setupConstraints() {
        let padding: CGFloat = 50
        let labelHeight: CGFloat = 20
        
        NSLayoutConstraint.activate([
            rec.widthAnchor.constraint(equalToConstant: 159),
            rec.heightAnchor.constraint(equalToConstant: 30),
            rec.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            rec.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 307),
        ])
        
        
        
        NSLayoutConstraint.activate([
            name.widthAnchor.constraint(equalToConstant: 159),
            name.heightAnchor.constraint(equalToConstant: 30),
            name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            name.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 307),
        ])
        
        
    }

}
