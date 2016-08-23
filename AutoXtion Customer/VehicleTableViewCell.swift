//
//  VehicleTableViewCell.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 19/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit

class VehicleTableViewCell: UITableViewCell {
    @IBOutlet weak var vehicleNumber: UILabel!
    @IBOutlet weak var vehicleBrand: UILabel!
    @IBOutlet weak var vehicleModel: UILabel!
    @IBOutlet weak var vehicleMakeYear: UILabel!
    @IBOutlet weak var vehicleVIN: UILabel!
    @IBOutlet weak var vehicleRegistrationExpiryDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
