//
//  ResponseObjectSerializable.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 25/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import Foundation
import Alamofire

public protocol ResponseObjectSerializable {
    init?(response: NSHTTPURLResponse, representation: AnyObject)
}

extension Request {
    public func responseObject<T: ResponseObjectSerializable>(completionHandler: Response<T, BackendError> -> Void) -> Self {
        let responseSerializer = ResponseSerializer<T, BackendError> { request, response, data, error in
            guard error == nil else { return .Failure(.Network(error: error!)) }
            
            let JSONResponseSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
            let result = JSONResponseSerializer.serializeResponse(request, response, data, error)
            
            switch result {
            case .Success(let value):
                if let
                    response = response,
                    responseObject = T(response: response, representation: value)
                {
                    return .Success(responseObject)
                } else {
                    return .Failure(.ObjectSerialization(reason: "JSON could not be serialized into response object: \(value)"))
                }
            case .Failure(let error):
                return .Failure(.JSONSerialization(error: error))
            }
        }
        
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}