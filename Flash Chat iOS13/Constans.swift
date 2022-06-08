//
//  Constans.swift
//  Flash Chat iOS13
//
//  Created by Daniel Mayo on 06/06/22.
//  Copyright © 2022 Daniel Mayo. All rights reserved.
//

struct Contants  {
    static let appName = "✉SecretChat"
    static let cellNibName = "MassageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    static let cellIdentifier = "ReusableCell"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
