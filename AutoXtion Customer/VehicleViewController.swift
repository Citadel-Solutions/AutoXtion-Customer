//
//  VehicleViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 19/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit

class VehicleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var vehicleTableView: UITableView!
    
    var vehicleNumberList:[String] = ["MH 14 EW 2618", "MH 14 EW 2619"]
    
    var vehicleBrandList:[String] = ["BMW", "Dodge"]
    
    var vehicleModelList:[String] = ["EB 110", "JBL 1198"]
    
    var vehicleYearList:[String] = ["1990", "1990"]
    
    var vehicleVINList:[String] = ["98127634581276345", "98127634581276395"]
    
    var vehicleRegExpiryDateList:[String] = ["Aug 29, 2019", "Sept 16, 2020"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.vehicleTableView.tableFooterView = UIView(frame: CGRectZero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        vehicleTableView.reloadData()
        //animateTable()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        vehicleTableView.reloadData()
        
        let cells = vehicleTableView.visibleCells
        let tableHeight: CGFloat = vehicleTableView.bounds.size.height
        
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
        return vehicleNumberList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let requestCellData = tableView.dequeueReusableCellWithIdentifier("vehicleCell", forIndexPath: indexPath) as! VehicleTableViewCell
        
        requestCellData.vehicleNumber.text = vehicleNumberList[indexPath.row]
        requestCellData.vehicleBrand.text = vehicleBrandList[indexPath.row]
        requestCellData.vehicleModel.text = vehicleModelList[indexPath.row]
        requestCellData.vehicleMakeYear.text = vehicleYearList[indexPath.row]
        requestCellData.vehicleVIN.text = vehicleVINList[indexPath.row]
        requestCellData.vehicleRegistrationExpiryDate.text = vehicleRegExpiryDateList[indexPath.row]
        
        return requestCellData
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.vehicleNumberList.removeAtIndex(indexPath.row)
            self.vehicleTableView.reloadData()
        }
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
