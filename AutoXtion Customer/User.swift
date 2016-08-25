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
    
    init?(response: NSHTTPURLResponse, representation: AnyObject) {
        //self.username = response.URL!.lastPathComponent!
        self.coupon_code = representation.valueForKeyPath("coupon_code") as! String
        print("code", coupon_code)
    }
   
}
