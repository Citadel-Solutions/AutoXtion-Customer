//
//  RequestViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 19/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit

var statusRequest = ""
var serviceTypeRequest = ""
var couponCodeRequest = ""

class RequestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var requestTableView: UITableView!
    
    var requestServiceTypeList:[String] = ["Auto Electrical Services", "Engine Management Diagnostics", "Wheel Alignment"]
    
    var requestStatusList:[String] = ["Scheduled", "Job Complete", "Job Complete"]
    
    var requestCouponCodeList:[String] = ["No coupon Appilied", "AXNYIZF40", "AXNIMKT12"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        requestTableView.reloadData()
        //animateTable()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        requestTableView.reloadData()
        
        let cells = requestTableView.visibleCells
        let tableHeight: CGFloat = requestTableView.bounds.size.height
        
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
        return requestServiceTypeList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let requestCellData = tableView.dequeueReusableCellWithIdentifier("requestCell", forIndexPath: indexPath) as! RequestTableViewCell
        
        requestCellData.requestServiceTable.text = requestServiceTypeList[indexPath.row]
        requestCellData.requestStatusTable.text = requestServiceTypeList[indexPath.row]
        requestCellData.requestDateTable.text = requestCouponCodeList[indexPath.row]
        
        return requestCellData
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.requestServiceTypeList.removeAtIndex(indexPath.row)
            self.requestTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        statusRequest = requestStatusList[indexPath.row]
        serviceTypeRequest = requestServiceTypeList[indexPath.row]
        couponCodeRequest = requestCouponCodeList[indexPath.row] 
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