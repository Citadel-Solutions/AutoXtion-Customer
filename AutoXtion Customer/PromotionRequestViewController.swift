//
//  PromotionRequestViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 20/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit

class PromotionRequestViewController: UIViewController {
    @IBOutlet weak var vehicleCompanyView: UIView!
    @IBOutlet weak var vehicleModelView: UIView!
    @IBOutlet weak var vehicleMakeYearView: UIView!
    @IBOutlet weak var promotionDiscountView: UIView!
    @IBOutlet weak var prmotionDateView: UIView!
    @IBOutlet weak var promotionDescriptionView: UIView!
    @IBOutlet weak var serviceTypeView: UIView!
    @IBOutlet weak var requestDescriptionView: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PromotionRequestViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let buttonColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
        let buttonColor1 = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 0.50)
        
        let bottomBorderVehicleCompanyView = CALayer()
        bottomBorderVehicleCompanyView.borderColor = UIColor.grayColor().CGColor
        bottomBorderVehicleCompanyView.frame = CGRectMake(0.0, self.vehicleCompanyView.frame.size.height-1, 800, 1.0)
        bottomBorderVehicleCompanyView.backgroundColor = buttonColor.CGColor
        self.vehicleCompanyView.layer .addSublayer(bottomBorderVehicleCompanyView)
        
        let bottomBorderVehicleModelView = CALayer()
        bottomBorderVehicleModelView.borderColor = UIColor.grayColor().CGColor
        bottomBorderVehicleModelView.frame = CGRectMake(0.0, self.vehicleModelView.frame.size.height-1, 800, 1.0)
        bottomBorderVehicleModelView.backgroundColor = buttonColor1.CGColor
        self.vehicleModelView.layer .addSublayer(bottomBorderVehicleModelView)
        
        let bottomBorderVehicleMakeYearView = CALayer()
        bottomBorderVehicleMakeYearView.borderColor = UIColor.grayColor().CGColor
        bottomBorderVehicleMakeYearView.frame = CGRectMake(0.0, self.vehicleMakeYearView.frame.size.height-1, 800, 1.0)
        bottomBorderVehicleMakeYearView.backgroundColor = buttonColor1.CGColor
        self.vehicleMakeYearView.layer .addSublayer(bottomBorderVehicleMakeYearView)
        
        let bottomBorderPromotionDiscountView = CALayer()
        bottomBorderPromotionDiscountView.borderColor = UIColor.grayColor().CGColor
        bottomBorderPromotionDiscountView.frame = CGRectMake(0.0, self.promotionDiscountView.frame.size.height-1, 800, 1.0)
        bottomBorderPromotionDiscountView.backgroundColor = buttonColor1.CGColor
        self.promotionDiscountView.layer .addSublayer(bottomBorderPromotionDiscountView)
        
        let bottomBorderPrmotionDateView = CALayer()
        bottomBorderPrmotionDateView.borderColor = UIColor.grayColor().CGColor
        bottomBorderPrmotionDateView.frame = CGRectMake(0.0, self.prmotionDateView.frame.size.height-1, 800, 1.0)
        bottomBorderPrmotionDateView.backgroundColor = buttonColor1.CGColor
        self.prmotionDateView.layer .addSublayer(bottomBorderPrmotionDateView)
        
        let bottomBorderPromotionDescriptionView = CALayer()
        bottomBorderPromotionDescriptionView.borderColor = UIColor.grayColor().CGColor
        bottomBorderPromotionDescriptionView.frame = CGRectMake(0.0, self.promotionDescriptionView.frame.size.height-1, 800, 1.0)
        bottomBorderPromotionDescriptionView.backgroundColor = buttonColor.CGColor
        self.promotionDescriptionView.layer .addSublayer(bottomBorderPromotionDescriptionView)
        
        let bottomBorderServiceTypeView = CALayer()
        bottomBorderServiceTypeView.borderColor = UIColor.grayColor().CGColor
        bottomBorderServiceTypeView.frame = CGRectMake(0.0, self.serviceTypeView.frame.size.height-1, 800, 1.0)
        bottomBorderServiceTypeView.backgroundColor = buttonColor1.CGColor
        self.serviceTypeView.layer .addSublayer(bottomBorderServiceTypeView)
        
        let bottomBorderRequestDescriptionView = CALayer()
        bottomBorderRequestDescriptionView.borderColor = UIColor.grayColor().CGColor
        bottomBorderRequestDescriptionView.frame = CGRectMake(0.0, self.requestDescriptionView.frame.size.height-1, 800, 1.0)
        bottomBorderRequestDescriptionView.backgroundColor = buttonColor.CGColor
        self.requestDescriptionView.layer .addSublayer(bottomBorderRequestDescriptionView)
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
