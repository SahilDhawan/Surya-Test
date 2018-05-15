//
//  ItemsObject.swift
//  surya1
//
//  Created by Sahil Dhawan on 15/05/18.
//  Copyright © 2018 Sahil Dhawan. All rights reserved.
//

import Foundation
import ObjectMapper

class itemsObject : Mappable {
    var items : [item] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        items <- map["items"]
    }
}

class item : Mappable {
    
    var emailId : String = ""
    var lastName : String = ""
    var imageUrl : String = ""
    var firstName : String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        emailId <- map["emailId"]
        lastName <- map["lastName"]
        imageUrl <- map["imageUrl"]
        firstName <- map["firstName"]
    }
}
