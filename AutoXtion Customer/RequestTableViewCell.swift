//
//  RequestTableViewCell.swift
//  AutoXtion Customer
//
//  Created by citadel soluions on 19/08/2016.
//  Copyright © 2016 Age Analytics. All rights reserved.
//

import UIKit

class RequestTableViewCell: UITableViewCell {
    @IBOutlet weak var requestServiceTable: UILabel!
    @IBOutlet weak var requestStatusTable: UILabel!
    @IBOutlet weak var requestDateTable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
