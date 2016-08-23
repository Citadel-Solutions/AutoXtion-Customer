//
//  EditProfileViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 19/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    @IBOutlet weak var personalInfoView: UIView!
    @IBOutlet weak var firstNameView: UIView!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var drivingLicenseView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var changePasswordView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tap to dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CustomerLoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
        let buttonColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
        let buttonColor1 = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 0.50)
        
        let bottomBorderPersonalInfoView = CALayer()
        bottomBorderPersonalInfoView.borderColor = UIColor.grayColor().CGColor
        bottomBorderPersonalInfoView.frame = CGRectMake(0.0, self.personalInfoView.frame.size.height-1, 800, 1.0)
        bottomBorderPersonalInfoView.backgroundColor = buttonColor.CGColor
        self.personalInfoView.layer .addSublayer(bottomBorderPersonalInfoView)
        
        let bottomBorderFirstNameView = CALayer()
        bottomBorderFirstNameView.borderColor = UIColor.grayColor().CGColor
        bottomBorderFirstNameView.frame = CGRectMake(0.0, self.firstNameView.frame.size.height-1, 800, 1.0)
        bottomBorderFirstNameView.backgroundColor = buttonColor1.CGColor
        self.firstNameView.layer .addSublayer(bottomBorderFirstNameView)
        
        let bottomBorderAddressView = CALayer()
        bottomBorderAddressView.borderColor = UIColor.grayColor().CGColor
        bottomBorderAddressView.frame = CGRectMake(0.0, self.addressView.frame.size.height-1, 800, 1.0)
        bottomBorderAddressView.backgroundColor = buttonColor1.CGColor
        self.addressView.layer .addSublayer(bottomBorderAddressView)
        
        let bottomBorderDrivingLicenseView = CALayer()
        bottomBorderDrivingLicenseView.borderColor = UIColor.grayColor().CGColor
        bottomBorderDrivingLicenseView.frame = CGRectMake(0.0, self.drivingLicenseView.frame.size.height-1, 800, 1.0)
        bottomBorderDrivingLicenseView.backgroundColor = buttonColor1.CGColor
        self.drivingLicenseView.layer .addSublayer(bottomBorderDrivingLicenseView)
        
        let bottomBorderEmailView = CALayer()
        bottomBorderEmailView.borderColor = UIColor.grayColor().CGColor
        bottomBorderEmailView.frame = CGRectMake(0.0, self.emailView.frame.size.height-1, 800, 1.0)
        bottomBorderEmailView.backgroundColor = buttonColor1.CGColor
        self.emailView.layer .addSublayer(bottomBorderEmailView)
        
        let topBorderChangePasswordView = CALayer()
        topBorderChangePasswordView.backgroundColor = buttonColor.CGColor
        topBorderChangePasswordView.frame = CGRectMake(-20.0, 0, 800, 1)
        self.changePasswordView.layer .addSublayer(topBorderChangePasswordView)
        
        let bottomBorderChangePasswordView = CALayer()
        bottomBorderChangePasswordView.borderColor = UIColor.grayColor().CGColor
        bottomBorderChangePasswordView.frame = CGRectMake(0.0, self.changePasswordView.frame.size.height-1, 800, 1.0)
        bottomBorderChangePasswordView.backgroundColor = buttonColor.CGColor
        self.changePasswordView.layer .addSublayer(bottomBorderChangePasswordView)
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
