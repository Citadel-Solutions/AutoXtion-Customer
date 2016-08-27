//
//  PromotionViewController.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 19/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var addPromotionClicked = "no"

class PromotionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var promotionTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPromotionList()

        // Do any additional setup after loading the view.
        //let barItemColor = UIColor(red: 243/255.0, green: 134/255.0, blue: 25/255.0, alpha: 1.0)
        
        //navigationController?.navigationBar.tintColor = barItemColor

    }
    
    func getPromotionList() {
        _ = Alamofire.request(PostRouter.Get("customer_all_promotions"))
            .responseCollection { (response: Response<[User], BackendError>) in
                PromotionsVariables.arrRes=response.result.value!
                for promotionValues in PromotionsVariables.arrRes{
                    PromotionsVariables.promotionServiceTypeList.append(promotionValues.service)
                    PromotionsVariables.promotionVehicleModelList.append(promotionValues.model)
                    PromotionsVariables.promotionVehicleMfdYearList.append(promotionValues.make_year)
                    PromotionsVariables.promotionCouponCodeList.append(promotionValues.coupon_code)
                }
                print(PromotionsVariables.promotionCouponCodeList)
                self.promotionTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //animateTable()
        promotionTableView.reloadData()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        promotionTableView.reloadData()
        
        let cells = promotionTableView.visibleCells
        let tableHeight: CGFloat = promotionTableView.bounds.size.height
        
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
        return PromotionsVariables.promotionServiceTypeList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let promotionCellData = tableView.dequeueReusableCellWithIdentifier("promotionCell", forIndexPath: indexPath) as! PromotionTableViewCell
        
        promotionCellData.promotionServiceType.text = PromotionsVariables.promotionServiceTypeList[indexPath.row]
        promotionCellData.promotionVehicleModel.text = PromotionsVariables.promotionVehicleModelList[indexPath.row]
        promotionCellData.promotionVehicleMfdYear.text = PromotionsVariables.promotionVehicleMfdYearList[indexPath.row]
        promotionCellData.promotionCouponCode.text = PromotionsVariables.promotionCouponCodeList[indexPath.row]
        
        let promotionImageViewColor = UIColor(red: 217.0/255.0, green: 217.0/255.0, blue: 219.0/255.0, alpha: 1.0)
        promotionCellData.promotionImageView.layer.borderWidth = 1
        promotionCellData.promotionImageView.layer.borderColor = promotionImageViewColor.CGColor
        
        return promotionCellData
    }
    
    func addPromotion() {
        addPromotionClicked = "yes"
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
