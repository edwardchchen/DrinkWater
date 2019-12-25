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
    var date = DateComponents()
    var minute : Int
    var hour : Int
//    var hey : String
    
    init(date : DateComponents) {
        self.date = date
        self.minute = date.minute!
        self.hour = date.hour!
//        self.hey = hey
    }
    
}
