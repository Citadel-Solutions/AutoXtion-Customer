//
//  VehicleYearViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 20/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit

var vehicleYearSelected = ""
var vehicleYearFlag = "0"

class VehicleYearViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var vehicleYearTableView: UITableView!
    
    var vehicleYearList:[String] = ["1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vehicleYearTableView.contentInset = UIEdgeInsetsZero
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //animateTable()
        vehicleYearTableView.reloadData()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        vehicleYearTableView.reloadData()
        
        let cells = vehicleYearTableView.visibleCells
        let tableHeight: CGFloat = vehicleYearTableView.bounds.size.height
        
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
    
    //*********************************************************************************************************************
    //function for the number of rows in each section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicleYearList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let vehicleYearCellData = tableView.dequeueReusableCellWithIdentifier("vehicleYearCell", forIndexPath: indexPath) as! VehicleYearTableViewCell
        
        vehicleYearCellData.vehicleYear.text = vehicleYearList[indexPath.row]
        
        vehicleYearCellData.vehicleYear.tag = indexPath.row
        
        return vehicleYearCellData
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        vehicleYearSelected = vehicleYearList[indexPath.row]
    }
    
    func doneButtonTapped() {
        vehicleYearFlag = "1"
        print(vehicleYearFlag)
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
