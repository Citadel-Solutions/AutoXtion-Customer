//
//  authenticationCredentials.swift
//  AutoXtion Customer
//
//  Created by Vaibhav Kapur on 27/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import Foundation

struct Authorize {
    
    static func auth() -> [String: String]?{
        // provide admin user credentials for production.
        let user = "vijaya.teke13@gmail.com"
        let password = "Admin@123"
        let credentialData = "\(user):\(password)".dataUsingEncoding(NSUTF8StringEncoding)!
        let base64Credentials = credentialData.base64EncodedStringWithOptions([])
        let headers = [
            "Cookie": "",
            "Authorization": "Basic \(base64Credentials)"
        ]
        return headers
    }
    
}