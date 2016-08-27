//
//  VehicleBrandsViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 20/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var vehicleBrandSelected = ""

class VehicleBrandsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var vehicleBrandsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vehicleBrandsTableView.contentInset = UIEdgeInsetsZero
        getVehicleBrandsList()
    }
    
    func getVehicleBrandsList() {
        _ = Alamofire.request(PostRouter.Get("get_all_CarCompany"))
            .responseCollection { (response: Response<[Vehicle], BackendError>) in
                VehicleVariables.arrRes=response.result.value!
                for promotionValues in VehicleVariables.arrRes{
                    VehicleVariables.vehicleBrandList.append(promotionValues.company_name)
                    VehicleVariables.vehicleIdList.append(promotionValues.id)
                }
                print(VehicleVariables.vehicleBrandList)
                self.vehicleBrandsTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        vehicleBrandsTableView.reloadData()
        //animateTable()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        vehicleBrandsTableView.reloadData()
        
        let cells = vehicleBrandsTableView.visibleCells
        let tableHeight: CGFloat = vehicleBrandsTableView.bounds.size.height
        
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
        return VehicleVariables.vehicleBrandList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let vehicleBrandCellData = tableView.dequeueReusableCellWithIdentifier("vehicleBrandCell", forIndexPath: indexPath) as! VehicleBrandsTableViewCell
        
        vehicleBrandCellData.vehicleBrand.text = VehicleVariables.vehicleBrandList[indexPath.row]
        
        vehicleBrandCellData.vehicleBrand.tag = VehicleVariables.vehicleIdList[indexPath.row]
        
        return vehicleBrandCellData
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        vehicleBrandSelected = String(VehicleVariables.vehicleIdList[indexPath.row])
        print(vehicleBrandSelected)
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
