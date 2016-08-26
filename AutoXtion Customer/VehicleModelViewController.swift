//
//  VehicleModelViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 20/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var vehicleModelSelected = ""

class VehicleModelViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var vehicleModelTableView: UITableView!
    
    var arraySize = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vehicleModelTableView.contentInset = UIEdgeInsetsZero
        print(vehicleBrandSelected)
        getVehicleModelList()
    }
    
    func getVehicleModelList() {
        VehicleModelVariables.vehicleModelList.removeAll()
        VehicleModelVariables.vehicleModelIdList.removeAll()
        _ = Alamofire.request(PostRouter.Get("get_all_CarModel/\(vehicleBrandSelected)"))
            .responseCollection { (response: Response<[VehicleModel], BackendError>) in
                VehicleModelVariables.arrRes=response.result.value!
                for promotionValues in VehicleModelVariables.arrRes{
                    VehicleModelVariables.vehicleModelList.append(promotionValues.model_name)
                    VehicleModelVariables.vehicleModelIdList.append(promotionValues.id)
                }
                print(VehicleModelVariables.vehicleModelList)
                self.vehicleModelTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //animateTable()
        vehicleModelTableView.reloadData()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        vehicleModelTableView.reloadData()
        
        let cells = vehicleModelTableView.visibleCells
        let tableHeight: CGFloat = vehicleModelTableView.bounds.size.height
        
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
        return VehicleModelVariables.vehicleModelList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let vehicleModelCellData = tableView.dequeueReusableCellWithIdentifier("vehicleModelCell", forIndexPath: indexPath) as! VehicleModelsTableViewCell
        
        vehicleModelCellData.vehicleModel.text = VehicleModelVariables.vehicleModelList[indexPath.row]
        vehicleModelCellData.vehicleModel.tag = VehicleModelVariables.vehicleModelIdList[indexPath.row]
        
        return vehicleModelCellData
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        vehicleModelSelected = String(VehicleModelVariables.vehicleModelIdList[indexPath.row])
        print("model selected", vehicleModelSelected)
        
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
