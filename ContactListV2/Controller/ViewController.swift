//
//  ViewController.swift
//  ContactListV2
//
//  Created by whatever on 08/07/19.
//  Copyright © 2019 whatever. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellIdentifier : [Int:String] = [0:"contactListPage", 1:"dialPadPage"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.isPagingEnabled = true
        collectionView.register(ContactListPage.self, forCellWithReuseIdentifier: cellIdentifier[0]!)
        collectionView.register(DialPadPage.self, forCellWithReuseIdentifier: cellIdentifier[1]!)
        collectionView.contentInset = UIEdgeInsets.init(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets.init(top: 50, left: 0, bottom: 0, right: 0)
        
        setUpNavigationBar()

    }

    lazy var navigationBar: NavigationBarView    =   {
        let navBar = NavigationBarView(frame: CGRect(x: 0,y: 0,width: self.view.frame.width, height: 50))
        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.viewController = self
        return navBar
    }()
    
    
    func setUpNavigationBar()   {
        self.view.addSubview(navigationBar)
        
        navigationBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        navigationBar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        navigationBar.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func scrollToMenuIndex(menuIndex: Int)  {
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        navigationBar.horizontalBarLeftAnchor?.constant = scrollView.contentOffset.x/2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier[indexPath.item]!, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height-50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let layout = collectionView.collectionViewLayout
        layout.invalidateLayout()
    }
    
}

