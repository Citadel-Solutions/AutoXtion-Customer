//
//  AddVehicleViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 20/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit

class AddVehicleViewController: UIViewController {
    @IBOutlet weak var registrationExpiryDateField: UITextField!
    @IBOutlet weak var vehicleNumberView: UIView!
    @IBOutlet weak var vehicleVINView: UIView!
    @IBOutlet weak var vehicleBrandView: UIStackView!
    @IBOutlet weak var vehicleModelView: UIStackView!
    @IBOutlet weak var vehicleMakeYearView: UIStackView!
    @IBOutlet weak var vehicleRegExpiryDateView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tap to dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CustomerLoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let buttonColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
        let buttonColor1 = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 0.50)
        
        let bottomBorderVehicleNumberView = CALayer()
        bottomBorderVehicleNumberView.borderColor = UIColor.grayColor().CGColor
        bottomBorderVehicleNumberView.frame = CGRectMake(0.0, self.vehicleNumberView.frame.size.height-1, 800, 1.0)
        bottomBorderVehicleNumberView.backgroundColor = buttonColor.CGColor
        self.vehicleNumberView.layer .addSublayer(bottomBorderVehicleNumberView)
        
        let bottomBorderVehicleVINView = CALayer()
        bottomBorderVehicleVINView.borderColor = UIColor.grayColor().CGColor
        bottomBorderVehicleVINView.frame = CGRectMake(0.0, self.vehicleVINView.frame.size.height-1, 800, 1.0)
        bottomBorderVehicleVINView.backgroundColor = buttonColor1.CGColor
        self.vehicleVINView.layer .addSublayer(bottomBorderVehicleVINView)
        
        let bottomBorderVehicleBrandView = CALayer()
        bottomBorderVehicleBrandView.borderColor = UIColor.grayColor().CGColor
        bottomBorderVehicleBrandView.frame = CGRectMake(0.0, self.vehicleBrandView.frame.size.height-1, 800, 1.0)
        bottomBorderVehicleBrandView.backgroundColor = buttonColor.CGColor
        self.vehicleBrandView.layer .addSublayer(bottomBorderVehicleBrandView)
        
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
        
        let bottomBorderVehicleRegExpiryDateView = CALayer()
        bottomBorderVehicleRegExpiryDateView.borderColor = UIColor.grayColor().CGColor
        bottomBorderVehicleRegExpiryDateView.frame = CGRectMake(0.0, self.vehicleRegExpiryDateView.frame.size.height-1, 800, 1.0)
        bottomBorderVehicleRegExpiryDateView.backgroundColor = buttonColor1.CGColor
        self.vehicleRegExpiryDateView.layer .addSublayer(bottomBorderVehicleRegExpiryDateView)

       //*********************************************************************************************************************
        //on date select, show toolbar
        let toolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        
        let toolbarColor = UIColor(red: 68/255.0, green: 68/255.0, blue: 68/255.0, alpha: 1.0)
        
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        
        toolBar.barStyle = UIBarStyle.BlackTranslucent
        
        toolBar.tintColor = UIColor.whiteColor()
        
        toolBar.backgroundColor = buttonColor
        
        
        let todayBtn = UIBarButtonItem(title: "Today", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(AddVehicleViewController.tappedToolBarBtn))
        
        let okBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: #selector(AddVehicleViewController.donePressed))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))
        
        label.font = UIFont(name: "Helvetica", size: 12)
        
        label.backgroundColor = UIColor.clearColor()
        
        label.textColor = toolbarColor
        
        label.text = "Select Registration Expiry Date"
        
        label.textAlignment = NSTextAlignment.Center
        
        let textBtn = UIBarButtonItem(customView: label)
        
        toolBar.setItems([todayBtn,flexSpace,textBtn,flexSpace,okBarBtn], animated: true)
        
        registrationExpiryDateField.inputAccessoryView = toolBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //*********************************************************************************************************************
    func donePressed(sender: UIBarButtonItem) {
        registrationExpiryDateField.resignFirstResponder()
    }
    
    func tappedToolBarBtn(sender: UIBarButtonItem) {
        let dateformatter = NSDateFormatter()
        dateformatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateformatter.timeStyle = NSDateFormatterStyle.NoStyle
        registrationExpiryDateField.text = dateformatter.stringFromDate(NSDate())
        registrationExpiryDateField.resignFirstResponder()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //*********************************************************************************************************************
    @IBAction func registrationExpiryDateEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(AddVehicleViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        registrationExpiryDateField.text = dateFormatter.stringFromDate(sender.date)
    }
    
    
    @IBAction func fromTimeScheduleAppointmentEditing(sender: UITextField) {
        let datePickerView1:UIDatePicker = UIDatePicker()
        
        datePickerView1.datePickerMode = UIDatePickerMode.DateAndTime
        
        sender.inputView = datePickerView1
              datePickerView1.addTarget(self, action: #selector(AddVehicleViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
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
