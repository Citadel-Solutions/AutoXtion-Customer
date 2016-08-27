//
//  ServiceAppointment.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 26/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import Foundation
import Alamofire

final class ServiceAppointment: ResponseObjectSerializable, ResponseCollectionSerializable {
    //let username: String
    let id: Int
    let date: String
    let from_time: String
    let to_time: String
    var coment: String?
    let customer: String
    let member: String
    let request: String
    var status: String
    
    init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.id = representation.valueForKeyPath("id") as! Int
        self.date = representation.valueForKeyPath("date") as! String
        self.from_time = representation.valueForKeyPath("from_time") as! String
        self.to_time = representation.valueForKeyPath("to_time") as! String
        self.coment = representation.valueForKeyPath("coment") as? String
        self.customer = representation.valueForKeyPath("customer") as! String
        self.member = representation.valueForKeyPath("member") as! String
        self.request = representation.valueForKeyPath("request") as! String
        self.status = representation.valueForKeyPath("status") as! String
        
        if coment == nil {
            coment = "No comments yet"
        }
    }
    
    /*class func collection(response: NSHTTPURLResponse, representation: AnyObject) -> [User] {
     let postArray = representation as! [AnyObject]
     // using the map function we are able to instantiate Post while reusing our init? method above
     return postArray.map({ User(response:response, representation: $0)! })
     }*/
}