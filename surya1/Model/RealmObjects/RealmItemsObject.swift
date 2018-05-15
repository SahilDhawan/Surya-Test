//
//  RealmItemsObject.swift
//  surya1
//
//  Created by Sahil Dhawan on 15/05/18.
//  Copyright © 2018 Sahil Dhawan. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class realmItemsObject : Object {
    @objc var firstName : String = ""
    @objc var lastName : String = ""
    @objc var emailId : String = ""
    @objc var imageUrl : String = ""
    
    init(itemObject : item) {
        super.init()
        firstName = itemObject.firstName
        lastName = itemObject.lastName
        emailId = itemObject.emailId
        imageUrl = itemObject.imageUrl
    }
    
    required init(){
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
}
