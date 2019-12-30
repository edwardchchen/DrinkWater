//
//  TimeCell.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-22.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import UIKit

class TimeCell : UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    func setCell(time ap : Time) {
        let timeInString = String(ap.hour) + ":" + String(ap.minute)
        timeLabel.text = timeInString
        
    }    
    

}
