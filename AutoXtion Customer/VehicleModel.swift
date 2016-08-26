//
//  VehicleModel.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 26/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import Foundation
import Alamofire

final class VehicleModel: ResponseObjectSerializable, ResponseCollectionSerializable {
    //let username: String
    let company: String
    let id: Int
    let model_name: String
    
    init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.company = representation.valueForKeyPath("company") as! String
        self.model_name = representation.valueForKeyPath("model_name") as! String
        self.id = representation.valueForKeyPath("id") as! Int
        print("model", model_name)
    }
    
    /*class func collection(response: NSHTTPURLResponse, representation: AnyObject) -> [User] {
     let postArray = representation as! [AnyObject]
     // using the map function we are able to instantiate Post while reusing our init? method above
     return postArray.map({ User(response:response, representation: $0)! })
     }*/
}