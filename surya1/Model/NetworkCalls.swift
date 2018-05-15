//
//  NetworkCalls.swift
//  surya1
//
//  Created by Sahil Dhawan on 15/05/18.
//  Copyright © 2018 Sahil Dhawan. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import Realm
import RealmSwift

class NetworkCalls{
    
    func fetchDataFromApi(email : String, completionHandler : @escaping(_ data : [realmItemsObject]?,_ error : String?) -> Void) {
        //fetch data from api
        let url = createURL()
        let parameters : [String : Any] = ["emailId" : email]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseObject { (response : DataResponse<itemsObject>) in
            if let error = response.error {
                // if error occurs
                completionHandler(nil, error.localizedDescription)
            } else {
                if let itemResponse = response.result.value {
                    let items = itemResponse.items
                    var realmItemsArray : [realmItemsObject] = []
                    do {
                        try Constants.realmObject.write {
                            // delete realm objects before addition
                            Constants.realmObject.deleteAll()
                            for item in items {
                                let realmItem = realmItemsObject(itemObject: item)
                                realmItemsArray.append(realmItem)
                            }
                            Constants.realmObject.add(realmItemsArray)
                            completionHandler(realmItemsArray,nil)
                        }
                    } catch {
                        completionHandler(nil,"Realm data couldn'e be deleted")
                    }
                } else {
                    completionHandler(nil, "Not a valid response")
                }
            }
        }
    }
    
    func createURL() -> URL {
        var urlComponents = URLComponents()
        urlComponents.host = "surya-interview.appspot.com"
        urlComponents.scheme = "http"
        urlComponents.path = "/list"
        return urlComponents.url!
    }
    
    func fetchFromRealm(completionHandler : @escaping (_ data : [realmItemsObject]?) -> Void) {
        //fetch item objects from realm
        let realmItems = Constants.realmObject.objects(realmItemsObject.self)
        var realmResultArray : [realmItemsObject] = []
        for realmItem in realmItems {
            realmResultArray.append(realmItem)
        }
        completionHandler(realmResultArray)
    }
}
