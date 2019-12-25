//
//  NotificationSender.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-23.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class NotificationSender {
    var notificationmsg = "Please remember to drink water 😉"
    let title = "🚰"
    
    
    func constructNotification(hour : Int, minute : Int ) {
        let content = UNMutableNotificationContent()
        var date = DateComponents()
        let timeInString = String(hour) + String(minute)
        print(timeInString)
        content.title = title
        content.body = notificationmsg
        date.hour = hour
        date.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        let request = UNNotificationRequest(identifier: timeInString , content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
    
    func removeNotification(hour : Int, minute : Int) {
        let timeInString = String(hour) + String(minute)
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [timeInString])
    }
    
    func changeNotificationMsg(msg : String) {
        self.notificationmsg = msg
    }
    
}
