//
//  DismissSegue.swift
//  Autoxtion
//
//  Created by citadel soluions on 01/07/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

//dismiss segue(dismiss modal)
@objc(DismissSegue)
class DismissSegue: UIStoryboardSegue {
    override func perform() {
        if let controller = sourceViewController.presentingViewController {
            controller.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
