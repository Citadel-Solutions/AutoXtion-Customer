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
//    lazy var appointmentAPICLient = AppointmentAPIClient(APIKey: key)
//    let coordinate = AppointmentURL(urlString: "customer_all_appointment")
    var statusCode = 0
    var resultCount = 0
    
    
    @IBOutlet weak var appointmentTableView: UITableView!
   // @IBOutlet weak var appointmentTypeButton: UIButton!
    
    var appointmentServiceTypeList:[String] = ["Auto Electrical Services", "Engine Management Diagnostics", "Wheel Alignment", "Full Car Service", "LPG Installation", "Tyres", "Air Conditioner Service", "Clutch & Transmission", "Brakes", "Radiators & Cooling", "Batteries", "Exhausts"]
    
    var appointmentStatusList:[String] = ["Scheduled", "Scheduled", "Scheduled", "Job Completed", "Job Completed", "Job Completed", "Job Completed", "Job Completed", "Job Completed", "Job Completed", "Job Completed", "Job Completed"]
    
    var appointmentDateList:[String] = ["2016-08-23", "2016-08-25", "2016-08-25", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17"]
    
    var serviceList:[Int] = []
    var statusList:[Int] = []
    var dateList:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print(key)
        
//        do {
//            
//            let data = NSData(contentsOfURL: NSURL(string: "http://202.38.172.167:8010/api/v1/rest/customer_all_appointment/")!)
//            
//            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
//            
//            resultCount = jsonResult.count
//            print(resultCount)
//                        for anItem in jsonResult as! [Dictionary<String, AnyObject>] {
//                let id = anItem["id"] as! Int
//                let date = anItem["date"] as! String
//                let from_time = anItem["from_time"] as! String
//                let to_time = anItem["to_time"] as! String
//                let date_appointment = anItem["date_appointment"] as! String
//                let date_update = anItem["date_update"] as? String
//                let coment = anItem["coment"] as? String
//                let customer = anItem["customer"] as! Int
//                let member = anItem["member"] as! Int
//                let request = anItem["request"] as! Int
//                let status = anItem["status"] as! Int
//                
//                print("id", id)
//                print("date", date)
//                print("from_time", from_time)
//                print("to_time", to_time)
//                print("date_appointment", date_appointment)
//                print("date_update", date_update)
//                print("coment", coment)
//                print("customer", customer)
//                print("member", member)
//                print("request", request)
//                print("status", status)
//                
//                // do something with personName and personID
//                            
//                serviceList.append(request)
//                statusList.append(status)
//                dateList.append(date)
//            }
//            
//        } catch let error as NSError {
//            
//            print(error)
//            
//        }
        

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
        //print(resultCount)
        return appointmentServiceTypeList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let appointmentCellData = tableView.dequeueReusableCellWithIdentifier("appointmentCell", forIndexPath: indexPath) as! AppointmentTableViewCell
        
        
//            appointmentCellData.appointmentServiceStatus.text = String(serviceList[indexPath.row])
//            appointmentCellData.appointmentServiceType.text = String(statusList[indexPath.row])
//            appointmentCellData.appointmentDate.text = dateList[indexPath.row]
        
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
    
    
//    func display(weather: Appointment){
//        print("display")
//        let aptID = "\(weather.id)"
//       // let aptDate = weather.date
//        print("ID", aptID)
//       // print("Date", aptDate)
//    }
    
    func showAlert(title: String,message: String?, style: UIAlertControllerStyle = .Alert){
        let alertController = UIAlertController(title: title,message: message,preferredStyle: style)
        let dismissAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(dismissAction)
        presentViewController(alertController, animated: true, completion: nil)
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
