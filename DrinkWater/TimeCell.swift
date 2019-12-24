//
//  TimeCell.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-22.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import UIKit

class TimeCell : UITableViewCell {
    @IBOutlet weak var timeCell: UILabel!
    
    func setCell(Time time : Time) {
        timeCell.text = time.time
    }
}
