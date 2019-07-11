//
//  NavigationBarCell.swift
//  ContactListV2
//
//  Created by whatever on 09/07/19.
//  Copyright © 2019 whatever. All rights reserved.
//

import UIKit

class NavigationViewCell: UICollectionViewCell  {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "contactList")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var selectedCell: Bool? {
        didSet  {
            print(123)
        }
    }
    
    func setUpViews()   {
        addSubview(imageView)
        
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
