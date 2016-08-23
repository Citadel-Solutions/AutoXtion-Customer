//
//  CustomerLoginViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 19/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit

var loginFlag = "0"

class CustomerLoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailLoginView: UIView!
    @IBOutlet weak var forgotPasswordLoginView: UIView!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    var email = ""
    var password = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cookieStorage: NSHTTPCookieStorage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        let cookies = cookieStorage.cookiesForURL(NSURL(string: "http://202.38.172.167:8010/rest-auth/login/")!)
        
        for coo in cookies! {
            cookieStorage.deleteCookie(coo as NSHTTPCookie)
        }

        //tap to dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CustomerLoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let buttonColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
        let buttonColor1 = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 0.50)
        
        //top border to forgot password
        let topBorderForgotPasswordLoginView = CALayer()
        topBorderForgotPasswordLoginView.backgroundColor = buttonColor.CGColor
        topBorderForgotPasswordLoginView.frame = CGRectMake(-20.0, 0, 800, 1)
        self.forgotPasswordLoginView.layer .addSublayer(topBorderForgotPasswordLoginView)
        
        //bottom border to login email
        let bottomBorderLoginEmail = CALayer()
        bottomBorderLoginEmail.borderColor = UIColor.grayColor().CGColor
        bottomBorderLoginEmail.frame = CGRectMake(0.0, self.emailTextField.frame.size.height-1, 800, 1.0)
        bottomBorderLoginEmail.backgroundColor = buttonColor1.CGColor
        self.emailTextField.layer .addSublayer(bottomBorderLoginEmail)
        
        //bottom border to login Password
        let bottomBorderPassword = CALayer()
        bottomBorderPassword.borderColor = UIColor.grayColor().CGColor
        bottomBorderPassword.frame = CGRectMake(0.0, self.passwordTextField.frame.size.height-1, 800, 1.0)
        bottomBorderPassword.backgroundColor = buttonColor1.CGColor
        self.passwordTextField.layer .addSublayer(bottomBorderPassword)
        
        //border to login button
        let loginbuttonColor = UIColor(red: 243.0/255.0, green: 134.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        self.loginButton.layer.borderWidth = 1
        self.loginButton.layer.borderColor = loginbuttonColor.CGColor
        
//        email = self.emailTextField.text!
//        password = self.passwordTextField.text!
//        
//        print("Email", email)
//        print("Pwd", password)
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
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        print("login clicked")
        email = self.emailTextField.text!
        password = self.passwordTextField.text!
        print("login email", email)
        print("pass", password)
        
        do {
            print("do")
            let json = NSMutableDictionary()
            json.setValue(email, forKey: "username"); //set all your values..
            json.setValue("", forKey: "email");
            json.setValue(password, forKey: "password");
            
            let data = try NSJSONSerialization.dataWithJSONObject(json, options: NSJSONWritingOptions(rawValue: 0))
            HTTPPostJSON("http://202.38.172.167:8010/rest-auth/login/", data:data) { (response, error) -> Void in
                print(response);
                print()
            }
        }
        catch {
            print("Username/Password is incorrect.")
            // showAlert()
        }
    }
    
    func HTTPsendRequest(request: NSMutableURLRequest,
                         callback: (String, String?) -> Void) {
        let task = NSURLSession.sharedSession()
            .dataTaskWithRequest(request) {
                (data, response, error) -> Void in
                
                let httpResponse = response as! NSHTTPURLResponse
                print("In", httpResponse.statusCode)
                if (error != nil) {
                    callback("", error!.localizedDescription)
                } else {
                    callback(NSString(data: data!,
                        encoding: NSUTF8StringEncoding)! as String, nil)
                    
                }
        }
        
        task.resume()
    }
    
    func HTTPPostJSON(url: String,  data: NSData,
                      callback: (String, String?) -> Void) {
        
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        
        request.HTTPMethod = "POST"
        request.addValue("application/json",forHTTPHeaderField: "Content-Type")
        request.addValue("application/json",forHTTPHeaderField: "Accept")
        request.HTTPBody = data
        HTTPsendRequest(request, callback: callback)
    }
    
    func showAlert() {
        let myAlert = UIAlertController(title: "", message: "Username/Password is incorrect.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){(ACTION) in
            print("ok tapped")
        }
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
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
