//
//  APIClient.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 24/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import Foundation
import Alamofire

enum PostRouter: URLRequestConvertible {
    static let baseURLString = "http://202.38.172.167:8010/"
    
    case Get(String)
    case Create(String,[String: AnyObject])
    case Update(String,[String: AnyObject])
    case Delete(String)
    
    var URLRequest: NSMutableURLRequest {
        var method: Alamofire.Method {
            switch self {
            case .Get:
                return .GET
            case .Create:
                return .POST
            case .Delete:
                return .DELETE
            case .Update:
                return .PUT
            }
        }
        
        let url:NSURL = {
            // build up and return the URL for each endpoint
            let relativePath:String?
            switch self {
            case .Get(let webServiceURL):
                relativePath = "api/v1/rest/\(webServiceURL)"
            case .Create(let webServiceURL, _):
                relativePath = "api/v1/rest/\(webServiceURL)/"
            case .Delete(let webServiceURL):
                relativePath = "api/v1/rest/\(webServiceURL)"
            case .Update(let webServiceURL, _):
                relativePath = "api/v1/rest/\(webServiceURL)"
            }
            
            var URL = NSURL(string: PostRouter.baseURLString)!
            if let relativePath = relativePath {
                URL = URL.URLByAppendingPathComponent(relativePath)
            }
            print(URL)
            return URL
        }()
        
        let params: ([String: AnyObject]?) = {
            switch self {
            case .Get, .Delete:
                return (nil)
            case .Create(_,let paramerters):
                return (paramerters)
            case .Update(_,let paramerters):
                return (paramerters)
            }
        }()
        
        let URLRequest = NSMutableURLRequest(URL: url)
        URLRequest.allHTTPHeaderFields = Authorize.auth()
        print(URLRequest.allHTTPHeaderFields)
        let encoding = Alamofire.ParameterEncoding.JSON
        let (encodedRequest, _) = encoding.encode(URLRequest, parameters: params)
        encodedRequest.HTTPMethod = method.rawValue
        print(encodedRequest)
        return encodedRequest
    }
}