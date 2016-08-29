//
//  RequestViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 19/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class RequestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var requestTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRequestList()
    }
    
    func getRequestList() {
        _ = Alamofire.request(PostRouter.Get("customer_all_request"))
            .responseCollection { (response: Response<[ServiceRequest], BackendError>) in
                RequestVariables.arrRes=response.result.value!
                for promotionValues in RequestVariables.arrRes{
                    RequestVariables.requestServiceTypeList.append(promotionValues.service)
                    RequestVariables.requestCouponCodeList.append(promotionValues.promotion!)
                }
                print(RequestVariables.requestServiceTypeList)
                self.requestTableView.reloadData()
        }
    }
    
    func deleteRequest(){
        _ = Alamofire.request(PostRouter.Delete("customer_update_delete_request/\(135)")).responseJSON { response in
            if let error = response.result.error {
                print("error calling DELETE on /todos/1")
                print(error)
            } else {
            print(response.description)
                print("delete ok")
            }
        }
        
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
        //return resultCount
       return RequestVariables.requestServiceTypeList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let requestCellData = tableView.dequeueReusableCellWithIdentifier("requestCell", forIndexPath: indexPath) as! RequestTableViewCell
        
        requestCellData.requestServiceTable.text = RequestVariables.requestServiceTypeList[indexPath.row]
        requestCellData.requestStatusTable.text = RequestVariables.requestStatusList[indexPath.row]
        requestCellData.requestDateTable.text = RequestVariables.requestCouponCodeList[indexPath.row]
        
        return requestCellData
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //RequestVariables.requestServiceTypeList.removeAtIndex(indexPath.row)
            
            deleteRequest()
            
            self.requestTableView.reloadData()
            
            
            
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        RequestVariables.statusRequest = RequestVariables.requestStatusList[indexPath.row]
        RequestVariables.serviceTypeRequest = RequestVariables.requestServiceTypeList[indexPath.row]
        RequestVariables.couponCodeRequest = RequestVariables.requestCouponCodeList[indexPath.row]
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
