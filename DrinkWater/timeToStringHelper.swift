//
//  timeToStringHelper.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-30.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import Foundation

class timeToStringHelper {
    func timeToString(hour : Int, minutes : Int) -> String {
        var hourInString : String
        var minutesInString : String
        if (hour < 10) {
            hourInString = addZeroInFront(number: hour)
        } else {
            hourInString = String(hour)
        }
        if (minutes < 10) {
            minutesInString = addZeroInFront(number: minutes)
        } else {
            minutesInString = String(minutes)
        }
        return hourInString + ":" + minutesInString
    }
    
    
    func addZeroInFront(number : Int) -> String {
        return String(format: "0%i", number)
    }
}
