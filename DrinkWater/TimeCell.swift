//
//  TimeCell.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-22.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import UIKit

class TimeCell : UITableViewCell {
    
    var helper = timeToStringHelper()
    @IBOutlet weak var timeLabel: UILabel!
    
    func setCell(time tm : Time) {
        timeLabel.text = tm.time
        
    }    
    

}
