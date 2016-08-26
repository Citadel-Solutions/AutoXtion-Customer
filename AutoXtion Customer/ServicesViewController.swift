//
//  ServicesViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 20/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var requestServiceSelected = ""

class ServicesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var requestServiceTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        requestServiceTable.contentInset = UIEdgeInsetsZero
        getServicesList()
    }
    
    func getServicesList() {
        _ = Alamofire.request(PostRouter.Get("get_all_ServiceType"))
            .responseCollection { (response: Response<[Services], BackendError>) in
                ServicesVariables.arrRes=response.result.value!
                for promotionValues in ServicesVariables.arrRes{
                    ServicesVariables.requestServiceList.append(promotionValues.service_type)
                    ServicesVariables.serviceIdList.append(promotionValues.id)
                }
                print(ServicesVariables.serviceIdList)
                self.requestServiceTable.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //animateTable()
        requestServiceTable.reloadData()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        requestServiceTable.reloadData()
        
        let cells = requestServiceTable.visibleCells
        let tableHeight: CGFloat = requestServiceTable.bounds.size.height
        
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
        return ServicesVariables.requestServiceList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let requestServiceCellData = tableView.dequeueReusableCellWithIdentifier("serviceTypeCell", forIndexPath: indexPath) as! ServicesTableViewCell
        
        requestServiceCellData.requestServiceType.text = ServicesVariables.requestServiceList[indexPath.row]
        
        requestServiceCellData.requestServiceType.tag = ServicesVariables.serviceIdList[indexPath.row]
        
        return requestServiceCellData
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        requestServiceSelected = String(ServicesVariables.serviceIdList[indexPath.row])
        print("Service selected", requestServiceSelected)
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
