//
//  AppointmentTableViewCell.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 19/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit

class AppointmentTableViewCell: UITableViewCell {
    @IBOutlet weak var appointmentServiceType: UILabel!
    @IBOutlet weak var appointmentServiceStatus: UILabel!
    @IBOutlet weak var appointmentDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
