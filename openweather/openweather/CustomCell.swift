//
//  CustomCell.swift
//  openweather
//
//  Created by Isabelly Damascena on 12/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var cityName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
