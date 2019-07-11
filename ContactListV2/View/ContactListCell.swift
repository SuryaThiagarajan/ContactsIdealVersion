//
//  ContactListCell.swift
//  ContactListV2
//
//  Created by whatever on 08/07/19.
//  Copyright © 2019 whatever. All rights reserved.
//

import UIKit

class ContactListCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    var contactImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "contactuser")
        imageView.layer.cornerRadius = 42
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var contactName: UILabel = {
        let label = UILabel()
        //label.text = "Contact Number"
        label.font = UIFont(name: "Arial", size: 20)
        //label.backgroundColor = .green
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var contactNumber: UILabel = {
        let label = UILabel()
        //label.text = "9876543210"
        //label.backgroundColor = .green
        label.font = UIFont(name: "Arial", size: 18)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let callIcon: UIImageView   =   {
        let iv = UIImageView()
        iv.image = UIImage(named: "contact us")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let divider: UIView =   {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        return view
    }()
    
    func setUpViews()   {
        
        self.addSubview(contactImage)
        self.addSubview(contactName)
        self.addSubview(contactNumber)
        self.addSubview(callIcon)
        self.addSubview(divider)
        
        contactImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        contactImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        contactImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        contactImage.widthAnchor.constraint(equalToConstant: 84).isActive = true
        
        [
            contactName.leadingAnchor.constraint(equalTo: contactImage.trailingAnchor, constant: 16),
            contactName.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            contactName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            contactName.heightAnchor.constraint(equalToConstant: 30)
            ].forEach { $0.isActive = true }
        
        [
            contactNumber.leadingAnchor.constraint(equalTo: contactName.leadingAnchor),
            contactNumber.topAnchor.constraint(equalTo: contactName.bottomAnchor, constant: 8),
            contactNumber.trailingAnchor.constraint(equalTo: contactName.trailingAnchor),
            contactNumber.heightAnchor.constraint(equalToConstant: 30)
            ].forEach { $0.isActive = true }
        
        [
            callIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            callIcon.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
            callIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            callIcon.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4)
        ].forEach   {   $0.isActive=true    }
        
        [
            divider.trailingAnchor.constraint(equalTo: callIcon.leadingAnchor,constant: -15),
            divider.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            divider.centerYAnchor.constraint(equalTo: callIcon.centerYAnchor),
            divider.widthAnchor.constraint(equalToConstant: 1)
        ].forEach   {   $0.isActive = true  }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
