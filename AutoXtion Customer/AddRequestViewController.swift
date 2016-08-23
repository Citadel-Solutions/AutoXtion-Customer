//
//  AddRequestViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 20/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit

class AddRequestViewController: UIViewController {
    @IBOutlet weak var serviceTypeView: UIView!
    @IBOutlet weak var requestDescriptionView: UIView!

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
        bottomBorderPersonalInfoView.frame = CGRectMake(0.0, self.serviceTypeView.frame.size.height-1, 800, 1.0)
        bottomBorderPersonalInfoView.backgroundColor = buttonColor1.CGColor
        self.serviceTypeView.layer .addSublayer(bottomBorderPersonalInfoView)
        
        let bottomBorderShopInfoView = CALayer()
        bottomBorderShopInfoView.borderColor = UIColor.grayColor().CGColor
        bottomBorderShopInfoView.frame = CGRectMake(0.0, self.requestDescriptionView.frame.size.height-1, 800, 1.0)
        bottomBorderShopInfoView.backgroundColor = buttonColor.CGColor
        self.requestDescriptionView.layer .addSublayer(bottomBorderShopInfoView)
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
