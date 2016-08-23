//
//  FeedbackViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 19/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {
    @IBOutlet weak var feedback1View: UIView!
    @IBOutlet weak var feedback2View: UIView!
    @IBOutlet weak var feedback3View: UIView!
    @IBOutlet weak var feedback4View: UIView!
    @IBOutlet weak var feedback5View: UIView!
    @IBOutlet weak var feedback6View: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tap to dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CustomerLoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
        
        let buttonColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
        let buttonColor1 = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 0.50)
        
        let bottomBorderFeedback1View = CALayer()
        bottomBorderFeedback1View.borderColor = UIColor.grayColor().CGColor
        bottomBorderFeedback1View.frame = CGRectMake(0.0, self.feedback1View.frame.size.height-1, 800, 1.0)
        bottomBorderFeedback1View.backgroundColor = buttonColor1.CGColor
        self.feedback1View.layer .addSublayer(bottomBorderFeedback1View)
        
        let bottomBorderFeedback2View = CALayer()
        bottomBorderFeedback2View.borderColor = UIColor.grayColor().CGColor
        bottomBorderFeedback2View.frame = CGRectMake(0.0, self.feedback2View.frame.size.height-1, 800, 1.0)
        bottomBorderFeedback2View.backgroundColor = buttonColor1.CGColor
        self.feedback2View.layer .addSublayer(bottomBorderFeedback2View)
        
        let bottomBorderFeedback3View = CALayer()
        bottomBorderFeedback3View.borderColor = UIColor.grayColor().CGColor
        bottomBorderFeedback3View.frame = CGRectMake(0.0, self.feedback3View.frame.size.height-1, 800, 1.0)
        bottomBorderFeedback3View.backgroundColor = buttonColor1.CGColor
        self.feedback3View.layer .addSublayer(bottomBorderFeedback3View)
        
        let bottomBorderFeedback4View = CALayer()
        bottomBorderFeedback4View.borderColor = UIColor.grayColor().CGColor
        bottomBorderFeedback4View.frame = CGRectMake(0.0, self.feedback4View.frame.size.height-1, 800, 1.0)
        bottomBorderFeedback4View.backgroundColor = buttonColor1.CGColor
        self.feedback4View.layer .addSublayer(bottomBorderFeedback4View)
        
        let bottomBorderFeedback5View = CALayer()
        bottomBorderFeedback5View.borderColor = UIColor.grayColor().CGColor
        bottomBorderFeedback5View.frame = CGRectMake(0.0, self.feedback5View.frame.size.height-1, 800, 1.0)
        bottomBorderFeedback5View.backgroundColor = buttonColor1.CGColor
        self.feedback5View.layer .addSublayer(bottomBorderFeedback5View)
        
        let bottomBorderFeedback6View = CALayer()
        bottomBorderFeedback6View.borderColor = UIColor.grayColor().CGColor
        bottomBorderFeedback6View.frame = CGRectMake(0.0, self.feedback6View.frame.size.height-1, 800, 1.0)
        bottomBorderFeedback6View.backgroundColor = buttonColor.CGColor
        self.feedback6View.layer .addSublayer(bottomBorderFeedback6View)
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
