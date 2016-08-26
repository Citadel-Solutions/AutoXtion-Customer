//
//  AppointmentViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 19/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var appointmentListFlag = "0"

class AppointmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var statusCode = 0
    var resultCount = 0

    @IBOutlet weak var appointmentTableView: UITableView!
    
    var serviceList:[Int] = []
    var statusList:[Int] = []
    var dateList:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getAppointmentList()

    }
    
    func getAppointmentList() {
        _ = Alamofire.request(PostRouter.Get("customer_all_appointment"))
            .responseCollection { (response: Response<[ServiceAppointment], BackendError>) in
                AppointmentVariables.arrRes=response.result.value!
                for promotionValues in AppointmentVariables.arrRes{
                    AppointmentVariables.appointmentServiceTypeList.append(promotionValues.request)
                    AppointmentVariables.appointmentStatusList.append(promotionValues.status)
                    AppointmentVariables.appointmentDateList.append(promotionValues.date)
                }
                print(AppointmentVariables.appointmentServiceTypeList)
                self.appointmentTableView.reloadData()
        }
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
        return AppointmentVariables.appointmentServiceTypeList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let appointmentCellData = tableView.dequeueReusableCellWithIdentifier("appointmentCell", forIndexPath: indexPath) as! AppointmentTableViewCell

            appointmentCellData.appointmentServiceType.text = AppointmentVariables.appointmentServiceTypeList[indexPath.row]
            appointmentCellData.appointmentServiceStatus.text = AppointmentVariables.appointmentStatusList[indexPath.row]
            appointmentCellData.appointmentDate.text = AppointmentVariables.appointmentDateList[indexPath.row]
        
        return appointmentCellData
    }

    
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
