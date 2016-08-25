//
//  BackendError.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 25/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import Foundation

public enum BackendError: ErrorType {
    case Network(error: NSError)
    case DataSerialization(reason: String)
    case JSONSerialization(error: NSError)
    case ObjectSerialization(reason: String)
    case XMLSerialization(error: NSError)
}
