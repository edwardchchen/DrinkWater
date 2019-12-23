//
//  CustomTableViewRows.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-21.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import UIKit

class SettingViewCell : UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellIconImageView: UIImageView!
    
    func setCell (setting ap: Setting) {
        cellIconImageView.image = ap.image
        cellLabel.text = ap.title
    }
}
