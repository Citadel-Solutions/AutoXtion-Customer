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
    
    //declare array of Lead list
    var promotionServiceTypeList:[String] = ["Auto Electrical Services", "Engine Management Diagnostics", "Wheel Alignment", "Full Car Service", "LPG Installation", "Tyres", "Air Conditioner Service", "Clutch & Transmission", "Brakes", "Radiators & Cooling", "Batteries", "Exhausts"]
    
    var promotionVehicleModelList:[String] = ["Fairmont", "Falcon", "Capri", "Ecosport", "Roadster", "Figo", "Swift", "Eurotech", "Asta", "GTS", "Sirion", "Camaro"]
    
    var promotionVehicleMfdYearList:[String] = ["1998", "2000", "1995", "2004", "2015", "2014", "2015", "2011", "2010", "2008", "2012", "2003"]
    
    var promotionCouponCodeList:[String] = ["AXNZRKF50", "AXNYIZF40", "AXNIMKT12", "AXNNYPY45", "AXNZRKF51", "AXNYIZF41", "AXNIMKT18", "AXNNYPY49", "AXNZRKF56", "AXNYIZF44", "AXNIMKT16", "AXNNYPY43"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getFirstPost()

        // Do any additional setup after loading the view.
        //let barItemColor = UIColor(red: 243/255.0, green: 134/255.0, blue: 25/255.0, alpha: 1.0)
        
        //navigationController?.navigationBar.tintColor = barItemColor

    }
    
    func getFirstPost() {
        // Get first post
        let request = Alamofire.request(PostRouter.Get("customer_all_promotions"))
            .responseJSON { response in
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GET on /posts/1")
                    print(response.result.error!)
                    return
                }
                
                if let value: AnyObject = response.result.value {
                    // handle the results as JSON, without a bunch of nested if loops
                    let post = JSON(value)
                    // now we have the results, let's just print them though a tableview would definitely be better UI:
                    print("The post is: " + post.description)
                    if let title = post["coupon_code"].string {
                        // to access a field:
                        print("The title is: " + title)
                    } else {
                        print("error parsing /posts/1")
                    }
                }
        }
        debugPrint(request)
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
        return promotionCouponCodeList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let promotionCellData = tableView.dequeueReusableCellWithIdentifier("promotionCell", forIndexPath: indexPath) as! PromotionTableViewCell
        
        promotionCellData.promotionServiceType.text = promotionServiceTypeList[indexPath.row]
        promotionCellData.promotionVehicleModel.text = promotionVehicleModelList[indexPath.row]
        promotionCellData.promotionVehicleMfdYear.text = promotionVehicleMfdYearList[indexPath.row]
        promotionCellData.promotionCouponCode.text = promotionCouponCodeList[indexPath.row]
        
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
