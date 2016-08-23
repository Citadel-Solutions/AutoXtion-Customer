//
//  ChangePasswordProfileViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 19/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit

class ChangePasswordProfileViewController: UIViewController {
    @IBOutlet weak var currentPasswordView: UIView!
    @IBOutlet weak var newPasswordView: UIView!
    @IBOutlet weak var reConfirmPasswordView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //tap to dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CustomerLoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let buttonColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
        let buttonColor1 = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 0.50)
        
        let bottomBorderCurrentPasswordView = CALayer()
        bottomBorderCurrentPasswordView.borderColor = UIColor.grayColor().CGColor
        bottomBorderCurrentPasswordView.frame = CGRectMake(0.0, self.currentPasswordView.frame.size.height-1, 800, 1.0)
        bottomBorderCurrentPasswordView.backgroundColor = buttonColor.CGColor
        self.currentPasswordView.layer .addSublayer(bottomBorderCurrentPasswordView)
        
        let bottomBorderNewPasswordView = CALayer()
        bottomBorderNewPasswordView.borderColor = UIColor.grayColor().CGColor
        bottomBorderNewPasswordView.frame = CGRectMake(0.0, self.newPasswordView.frame.size.height-1, 800, 1.0)
        bottomBorderNewPasswordView.backgroundColor = buttonColor.CGColor
        self.newPasswordView.layer .addSublayer(bottomBorderNewPasswordView)
        
        let bottomBorderReConfirmPasswordView = CALayer()
        bottomBorderReConfirmPasswordView.borderColor = UIColor.grayColor().CGColor
        bottomBorderReConfirmPasswordView.frame = CGRectMake(0.0, self.reConfirmPasswordView.frame.size.height-1, 800, 1.0)
        bottomBorderReConfirmPasswordView.backgroundColor = buttonColor1.CGColor
        self.reConfirmPasswordView.layer .addSublayer(bottomBorderReConfirmPasswordView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
