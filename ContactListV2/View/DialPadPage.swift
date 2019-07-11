//
//  DialPadView.swift
//  ContactListV2
//
//  Created by whatever on 09/07/19.
//  Copyright © 2019 whatever. All rights reserved.
//

import UIKit

class DialPadPage: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout   {
    
    override init(frame: CGRect)    {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpViews()
    }
    
    
    lazy var enteredPhoneNumber: UITextField =   {
        let textViewFrame = CGRect(x:0, y:0, width: self.frame.width, height: 100)
        let view = UITextField(frame: textViewFrame)
        view.inputView = UIView()
        view.font = UIFont(name: "Arial-Black", size: 5)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var dialPadCollectionView: UICollectionView =   {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.frame = CGRect(x:0 ,y:0 ,width: self.frame.width * 0.8, height: 60*3)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        return cv
    }()
    
    let callButton: UIButton    =   {
        let bt = UIButton()
        bt.setTitle("Call", for: .normal)
        bt.layer.cornerRadius = 20
        bt.layer.borderWidth = 1
        bt.layer.borderColor = UIColor.black.cgColor
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    func setUpViews()   {
        
        dialPadCollectionView.register(DialPadCollectionViewCell.self, forCellWithReuseIdentifier: "dialPadCell")
        
        enteredPhoneNumber.selectedTextRange = enteredPhoneNumber.textRange(from: enteredPhoneNumber.beginningOfDocument, to: enteredPhoneNumber.beginningOfDocument)
        
        
        self.addSubview(dialPadCollectionView)
        self.addSubview(enteredPhoneNumber)
        self.addSubview(callButton)
        
        [
            callButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            callButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            callButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            callButton.heightAnchor.constraint(equalToConstant: 40)
        ].forEach   {  $0.isActive=true    }
        
        [
            dialPadCollectionView.bottomAnchor.constraint(equalTo: callButton.topAnchor, constant: -10),
            dialPadCollectionView.widthAnchor.constraint(equalTo: callButton.widthAnchor),
            dialPadCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dialPadCollectionView.heightAnchor.constraint(equalToConstant: 60*4)
        ].forEach   {   $0.isActive = true  }
        
        [
            enteredPhoneNumber.bottomAnchor.constraint(equalTo: dialPadCollectionView.topAnchor, constant: -10),
            enteredPhoneNumber.widthAnchor.constraint(equalTo: dialPadCollectionView.widthAnchor),
            enteredPhoneNumber.centerXAnchor.constraint(equalTo: dialPadCollectionView.centerXAnchor),
            enteredPhoneNumber.heightAnchor.constraint(equalToConstant: 40)
        ].forEach   {   $0.isActive = true  }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let space = (self.frame.width - (50 * 3))/3
        
        return space
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let textSoFar = enteredPhoneNumber.text
        
        var displayLabel:String
        switch(indexPath.item)  {
        case 0..<9:
            displayLabel = String(indexPath.item+1)
            break
        case 9:
            displayLabel = "#"
            break
        case 10:
            displayLabel = String(0)
            break
        case 11:
            displayLabel = "*"
            break
        default:
            displayLabel = " "
            break
        }
        let finalString =  textSoFar! + displayLabel
        self.enteredPhoneNumber.text = finalString
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dialPadCollectionView.dequeueReusableCell(withReuseIdentifier: "dialPadCell", for: indexPath) as! DialPadCollectionViewCell
        
        var displayLabel:String
        switch(indexPath.item)  {
        case 0..<9:
            displayLabel = String(indexPath.item+1)
            break
        case 9:
            displayLabel = "#"
            break
        case 10:
            displayLabel = String(0)
            break
        case 11:
            displayLabel = "*"
            break
        default:
            displayLabel = " "
            break
        }
        
        cell.numberLabel.text = displayLabel
        cell.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
