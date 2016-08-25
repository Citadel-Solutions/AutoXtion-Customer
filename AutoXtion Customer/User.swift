//
//  User.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 25/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import Foundation
import Alamofire

final class User: ResponseObjectSerializable, ResponseCollectionSerializable {
    //let username: String
    let coupon_code: String
    let description: String?
    let from_date: String
    let to_date: String
    let price: Int?
    let company: String
    let model: String
    let make_year: String
    let service: String
    
    init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.coupon_code = representation.valueForKeyPath("coupon_code") as! String
        self.description = representation.valueForKeyPath("description") as? String
        self.from_date = representation.valueForKeyPath("from_date") as! String
        self.to_date = representation.valueForKeyPath("to_date") as! String
        self.price = representation.valueForKeyPath("price") as? Int
        self.company = representation.valueForKeyPath("company") as! String
        self.model = representation.valueForKeyPath("model") as! String
        self.make_year = representation.valueForKeyPath("make_year") as! String
        self.service = representation.valueForKeyPath("Service") as! String
    }
    
    /*class func collection(response: NSHTTPURLResponse, representation: AnyObject) -> [User] {
        let postArray = representation as! [AnyObject]
        // using the map function we are able to instantiate Post while reusing our init? method above
        return postArray.map({ User(response:response, representation: $0)! })
    }*/
}
