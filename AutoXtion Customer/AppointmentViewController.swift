//
//  AppointmentViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 19/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit

var appointmentListFlag = "0"

class AppointmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var appointmentTableView: UITableView!
   // @IBOutlet weak var appointmentTypeButton: UIButton!
    
    var appointmentServiceTypeList:[String] = ["Auto Electrical Services", "Engine Management Diagnostics", "Wheel Alignment", "Full Car Service", "LPG Installation", "Tyres", "Air Conditioner Service", "Clutch & Transmission", "Brakes", "Radiators & Cooling", "Batteries", "Exhausts"]
    
    var appointmentStatusList:[String] = ["Scheduled", "Scheduled", "Scheduled", "Job Completed", "Job Completed", "Job Completed", "Job Completed", "Job Completed", "Job Completed", "Job Completed", "Job Completed", "Job Completed"]
    
    var appointmentDateList:[String] = ["2016-08-23", "2016-08-25", "2016-08-25", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        appointmentTableView.reloadData()
        //animateTable()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        appointmentTableView.reloadData()
        
        let cells = appointmentTableView.visibleCells
        let tableHeight: CGFloat = appointmentTableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionNone, animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index += 1
        }
    }
    
    //function for the number of rows in each section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if (appointmentListFlag == "0") {
//            return appointmentServiceTypeList.count
//        }
//        else if(appointmentListFlag == "1") {
//            return completedAppointmentServiceTypeList.count
//        }
//        else if(appointmentListFlag == "2") {
//            return pendingAppointmentServiceTypeList.count
//        }
//        return 0
        return appointmentServiceTypeList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let appointmentCellData = tableView.dequeueReusableCellWithIdentifier("appointmentCell", forIndexPath: indexPath) as! AppointmentTableViewCell
//        
//        if (appointmentListFlag == "0") {
//            self.appointmentTypeButton.setTitle("All Appointments", forState: .Normal)
//            _ = appointmentTypeButton.frame.size.width
//            appointmentTypeButton.sizeThatFits(CGSize(width: 95, height: CGFloat.max))
//            
//            
            appointmentCellData.appointmentServiceStatus.text = appointmentStatusList[indexPath.row]
            appointmentCellData.appointmentServiceType.text = appointmentServiceTypeList[indexPath.row]
            appointmentCellData.appointmentDate.text = appointmentDateList[indexPath.row]
//        }
//        else if(appointmentListFlag == "1") {
//            self.appointmentTypeButton.setTitle("Completed Appointments", forState: .Normal)
//            _ = appointmentTypeButton.frame.size.width
//            appointmentTypeButton.sizeThatFits(CGSize(width: 95, height: CGFloat.max))
//            
//            appointmentCellData.appointmentServiceStatus.text = completedAppointmentStatusList[indexPath.row]
//            appointmentCellData.appointmentServiceType.text = completedAppointmentServiceTypeList[indexPath.row]
//            appointmentCellData.appointmentDate.text = completedAppointmentDateList[indexPath.row]
//        }
//        else if(appointmentListFlag == "2") {
//            self.appointmentTypeButton.setTitle("Scheduled Appointments", forState: .Normal)
//            _ = appointmentTypeButton.frame.size.width
//            appointmentTypeButton.sizeThatFits(CGSize(width: 95, height: CGFloat.max))
//            
//            appointmentCellData.appointmentServiceStatus.text = pendingAppointmentStatusList[indexPath.row]
//            appointmentCellData.appointmentServiceType.text = pendingAppointmentServiceTypeList[indexPath.row]
//            appointmentCellData.appointmentDate.text = pendingAppointmentDateList[indexPath.row]
//        }
        
        //        appointmentCellData.jobCompletedButton.layer.borderWidth = 1
        //        appointmentCellData.jobCompletedButton.layer.borderColor = buttonColor
        
        return appointmentCellData
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
