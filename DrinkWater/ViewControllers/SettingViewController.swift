//
//  SettingViewController.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-21.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import UIKit

class SettingViewController : UIViewController {
    @IBOutlet weak var welcomeMsgLabel: UILabel!
    
    var settingCells : [Setting] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingCells = createCells()
        displayWelcomeMsg()
    }
    
    func createCells() ->[Setting] {
        var tempCells : [Setting] = []
//        let cellOne = Setting (image: #imageLiteral(resourceName: "heartbeat") , title: "Appearance", uniqueID: "appearanceCell")
        let cellTwo = Setting (image: #imageLiteral(resourceName: "goal"), title : "Daily Goal", uniqueID : "goalsCell")
//        let cellThree = Setting (image: #imageLiteral(resourceName: "email"), title : "Notification Message", uniqueID: "notificationMsgCell")
        let cellFour = Setting(image: #imageLiteral(resourceName: "notification_icon_hello"), title: "Notification Time", uniqueID: "notificationTimeCell")
        
        let cellFive = Setting (image: #imageLiteral(resourceName: "unit"), title: "Units", uniqueID: "unitCell")
        
//        tempCells.append(cellOne)
        tempCells.append(cellTwo)
//        tempCells.append(cellThree)
        tempCells.append(cellFour)
        tempCells.append(cellFive)
        
        return tempCells
    }
    
    func displayWelcomeMsg() {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        if (hour > 18) {
            welcomeMsgLabel.text = "Good Night!"
        } else if (hour >= 6 && hour < 11 ) {
            welcomeMsgLabel.text = "Good Morning!"
        } else if ( hour >= 11 && hour <= 13) {
            welcomeMsgLabel.text = "Good Afternoon!"
        } else {
            welcomeMsgLabel.text = "Good Evening!"
        }
    }
    
}

extension SettingViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingCells.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = settingCells[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: setting.uniqueID) as! SettingViewCell
        cell.setCell(setting: setting)
        return cell
    }
    
}
