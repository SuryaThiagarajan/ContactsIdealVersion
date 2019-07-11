//
//  ContactListPage.swift
//  ContactListV2
//
//  Created by whatever on 08/07/19.
//  Copyright © 2019 whatever. All rights reserved.
//

import UIKit

class ContactListPage: UICollectionViewCell,
                        UICollectionViewDelegate,
                        UICollectionViewDataSource,
                        UICollectionViewDelegateFlowLayout {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    let cellID = "cellID"
    let cellHieght: CGFloat = 100
    
    lazy var contactListCollectionView : UICollectionView   =   {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .red
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    func setUpViews()   {
        contactListCollectionView.register(ContactListCell.self, forCellWithReuseIdentifier: cellID)
        contactListCollectionView.backgroundColor = UIColor.white
        
        self.addSubview(contactListCollectionView)
        
        [
        contactListCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
        contactListCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        contactListCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        contactListCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ].forEach { $0.isActive = true }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ContactListCell
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        cell.backgroundColor = .white
        cell.contactName.text = ContactCellArray[indexPath.item % 2].contactName
        cell.contactNumber.text = ContactCellArray[indexPath.item % 2].contactNumber
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.frame.width, height: cellHieght)
    }

    func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let layout = contactListCollectionView.collectionViewLayout
        layout.invalidateLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



