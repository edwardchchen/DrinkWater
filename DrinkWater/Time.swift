//
//  Time.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-23.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import Foundation
import UIKit


class Time {
    var minute : Int
    var hour : Int
    var uniqueID : String
    
    init(hour : Int, minute : Int , uniqueID : String) {
        self.minute = minute
        self.hour = hour
        self.uniqueID = uniqueID
    }
    
}
