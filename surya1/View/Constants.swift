//
//  Constants.swift
//  surya1
//
//  Created by Sahil Dhawan on 15/05/18.
//  Copyright © 2018 Sahil Dhawan. All rights reserved.
//

import Foundation
import UIKit
import Realm
import RealmSwift

struct Constants {
    //frame attributes
    static let frameWidth = UIScreen.main.bounds.width
    static let frameHeight = UIScreen.main.bounds.height
    
    // instance of realm object
    static let realmObject = try! Realm()
}
