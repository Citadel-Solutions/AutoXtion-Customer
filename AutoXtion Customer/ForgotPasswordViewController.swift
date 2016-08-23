//
//  ForgotPasswordViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 19/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var emailForgotPasswordView: UIView!
    @IBOutlet weak var recoverPasswordButton: UIButton!
    @IBOutlet weak var loginView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ForgotPasswordViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let buttonColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
        
        let topBorderLoginView = CALayer()
        topBorderLoginView.backgroundColor = buttonColor.CGColor
        topBorderLoginView.frame = CGRectMake(-20.0, 0, 800, 1)
        self.loginView.layer.addSublayer(topBorderLoginView)
        
        //bottom border to login email
        let bottomBorderEmailForgotPasswordView = CALayer()
        bottomBorderEmailForgotPasswordView.borderColor = UIColor.grayColor().CGColor
        bottomBorderEmailForgotPasswordView.frame = CGRectMake(0.0, self.emailForgotPasswordView.frame.size.height-1, 800, 1.0)
        bottomBorderEmailForgotPasswordView.backgroundColor = buttonColor.CGColor
        self.emailForgotPasswordView.layer .addSublayer(bottomBorderEmailForgotPasswordView)
        
        //border to login button
        let forgotPasswordButtonColor = UIColor(red: 243.0/255.0, green: 134.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        self.recoverPasswordButton.layer.borderWidth = 1
        self.recoverPasswordButton.layer.borderColor = forgotPasswordButtonColor.CGColor

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
