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
    case Create([String: AnyObject])
    case Delete(Int)
    
    var URLRequest: NSMutableURLRequest {
        var method: Alamofire.Method {
            switch self {
            case .Get:
                return .GET
            case .Create:
                return .POST
            case .Delete:
                return .DELETE
            }
        }
        
        let url:NSURL = {
            // build up and return the URL for each endpoint
            let relativePath:String?
            switch self {
            case .Get(let webServiceURL):
                relativePath = "api/v1/rest/\(webServiceURL)"
                print("rel path", relativePath)
            case .Create:
                relativePath = "posts"
            case .Delete(let postNumber):
                relativePath = "posts/\(postNumber)"
            }
            
            var URL = NSURL(string: PostRouter.baseURLString)!
            if let relativePath = relativePath {
                URL = URL.URLByAppendingPathComponent(relativePath)
                print("url", URL)
            }
            return URL
        }()
        
        let params: ([String: AnyObject]?) = {
            switch self {
            case .Get, .Delete:
                return (nil)
            case .Create(let newPost):
                return (newPost)
            }
        }()
        
        let URLRequest = NSMutableURLRequest(URL: url)
        print("url req", URLRequest)
        
        let encoding = Alamofire.ParameterEncoding.JSON
        print("Encoding", encoding)
        let (encodedRequest, _) = encoding.encode(URLRequest, parameters: params)
        
        encodedRequest.HTTPMethod = method.rawValue
        
        return encodedRequest
    }
}