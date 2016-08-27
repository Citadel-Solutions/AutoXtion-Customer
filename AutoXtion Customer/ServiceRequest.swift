//
//  ServiceRequest.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 26/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import Foundation
import Alamofire

final class ServiceRequest: ResponseObjectSerializable, ResponseCollectionSerializable {
    //let username: String
    let id: Int
    let description: String
    let service: String
    let customer: String
    var promotion: String?
    
    init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.id = representation.valueForKeyPath("id") as! Int
        self.description = representation.valueForKeyPath("description") as! String
        self.service = representation.valueForKeyPath("Service") as! String
        self.customer = representation.valueForKeyPath("customer") as! String
        self.promotion = representation.valueForKeyPath("promotion") as? String
        if self.promotion == nil {
            self.promotion = "No coupon applied"
        }
    }
    
    /*class func collection(response: NSHTTPURLResponse, representation: AnyObject) -> [User] {
     let postArray = representation as! [AnyObject]
     // using the map function we are able to instantiate Post while reusing our init? method above
     return postArray.map({ User(response:response, representation: $0)! })
     }*/
}