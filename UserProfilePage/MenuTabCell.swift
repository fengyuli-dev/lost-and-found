//
//  BasicCell.swift
//  MyPagerCollView
//
//  Created by Leela Prasad on 08/03/18.
//  Revised and Modified by Haoxuan Zou on 12.1.2021.
//

import UIKit

class MenuTabCell: UICollectionViewCell {
    
    let titleLabel = UILabel()
    
    var indicatorView: UIView!

    override var isSelected: Bool {
        
        didSet{
            UIView.animate(withDuration: 0.30) {
                self.indicatorView.backgroundColor = self.isSelected ? UIColor.blue : UIColor.clear
                self.layoutIfNeeded()
            }
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        addConstraintsWithFormatString(formate: "H:|[v0]|", views: titleLabel)
        addConstraintsWithFormatString(formate: "V:|[v0]|", views: titleLabel)
        
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        setupIndicatorView()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
    }
   
    
    func configure(isSelect: Bool){
        self.isSelected = isSelect
    }
    
    
    func setupIndicatorView() {
        indicatorView = UIView()
        addSubview(indicatorView)
        
        addConstraintsWithFormatString(formate: "H:|[v0]|", views: indicatorView)
        addConstraintsWithFormatString(formate: "V:[v0(20)]|", views: indicatorView)
    }
    
}
