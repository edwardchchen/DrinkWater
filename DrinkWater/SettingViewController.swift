//
//  SettingViewController.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-21.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import UIKit

class SettingViewController : UIViewController {
    
    var settingCells : [Setting] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingCells = createCells()
    }
    
    func createCells() ->[Setting] {
        var tempCells : [Setting] = []
        let cellFive = Setting(image: #imageLiteral(resourceName: "notification_icon_hello"), title: "Notification Time")
        let cellThree = Setting (image:#imageLiteral(resourceName: "unit"), title: "Imperial/Metric")
        let cellTwo = Setting (image: #imageLiteral(resourceName: "goal"), title : "Daily Goal")
        let cellFour = Setting (image: #imageLiteral(resourceName: "email"), title : "Notification Message")
        let cellOne = Setting (image: #imageLiteral(resourceName: "heartbeat") , title: "Apple HealthKit")
        
        tempCells.append(cellOne)
        tempCells.append(cellTwo)
        tempCells.append(cellThree)
        tempCells.append(cellFour)
        tempCells.append(cellFive)
        
        return tempCells

    }
    
}

extension SettingViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingCells.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = settingCells[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "healthKitCell") as! SettingViewCell
        cell.setCell(setting: setting)
        return cell
    }
    
    
}
