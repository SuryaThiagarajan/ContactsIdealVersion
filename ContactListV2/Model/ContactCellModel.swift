//
//  ContactCellModel.swift
//  ContactListV2
//
//  Created by whatever on 09/07/19.
//  Copyright © 2019 whatever. All rights reserved.
//


import Foundation

struct ContactCellModel {
    let contactName: String
    let contactNumber: String
    
}

let ContactCell1 = ContactCellModel(contactName: "Bob", contactNumber: "3993993993")
let ContactCell2 = ContactCellModel(contactName: "Alice", contactNumber: "2121212121")

let ContactCellArray: [ContactCellModel] = [ContactCell1, ContactCell2]
