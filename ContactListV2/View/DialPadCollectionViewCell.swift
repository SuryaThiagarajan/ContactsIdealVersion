//
//  DialPadCollectionViewCell.swift
//  ContactListV2
//
//  Created by whatever on 09/07/19.
//  Copyright © 2019 whatever. All rights reserved.
//

import UIKit

class DialPadCollectionViewCell: UICollectionViewCell   {
    
    override init(frame: CGRect)    {
        super.init(frame: frame)
        setUpViews()
    }
    
    var numberLabel: UILabel    =   {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial-Black", size: 1)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    func setUpViews()   {
        self.layer.cornerRadius = self.frame.height/2
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        addSubview(numberLabel)
        
        [
            numberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ].forEach   {   $0.isActive = true  }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
