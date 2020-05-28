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
    var notificationTimes : [HoursAndMinutes] = []
    let title = "🚰"
    let defaults = UserDefaults.standard
    
    func addNotification(){
        var startHR = defaults.integer(forKey: "startHR")
        let endHR = defaults.integer(forKey: "endHR")
        let frequency = defaults.string(forKey: "frequency")
        let freqInt = Int(frequency ?? "1") ?? 1
        while(startHR<endHR){
            constructNotification(hour: startHR, minute: 0)
            startHR += freqInt
            print(startHR)
        }
        
        
    }
    func constructNotification(hour : Int, minute : Int ) {
        let content = UNMutableNotificationContent()
        var date = DateComponents()
        let timeInString = String(hour) + String(minute)
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
    
    func removeAllNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    func changeNotificationMsg(msg : String) {
        self.notificationmsg = msg
    }
    
}
