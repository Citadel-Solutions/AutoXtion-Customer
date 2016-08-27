//
//  CustomerId.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 26/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import Foundation
import Alamofire

final class CustomerId: ResponseObjectSerializable, ResponseCollectionSerializable {
    //let username: String
    let name: String
    let id: Int
    
    init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.name = representation.valueForKeyPath("company") as! String
        self.id = representation.valueForKeyPath("id") as! Int
        print("model", id)
    }
    

}