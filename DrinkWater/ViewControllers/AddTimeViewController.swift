//
//  AddTimeViewController.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-24.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import Foundation
import UIKit

class AddTimeViewController : UIViewController {
    
    struct Keys {
        static let frequency = "frequency"
        static let startTime = "startTime"
        static let endTime = "endTime"
    }
    
    let defaults = UserDefaults.standard
    
    var timeCells : [Time] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func createTimeCells () ->[Time] {
        var tempCells : [Time] = []
        let startTime = defaults.string(forKey: Keys.startTime)
        let endTime = defaults.string(forKey: Keys.endTime)
        let frequency = defaults.string(forKey: Keys.frequency)
        let cellOne = Time(time: startTime ?? "<no_time>", uniqueID: "startTimeCell")
        let cellTwo = Time(time: endTime ?? "<no_time>", uniqueID: "endTimeCell")
        let cellThree = Time(time: (String(frequency ?? "<no_time>") + " hours per notification"), uniqueID: "frequencyCell")
        
        tempCells.append(cellOne)
        tempCells.append(cellTwo)
        tempCells.append(cellThree)
        
        return tempCells
    }

    
    
    func setUp() {
        timeCells = createTimeCells()
    }
    
    
    
    
}

extension AddTimeViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeCells.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let time = timeCells[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: time.uniqueID) as! TimeCell
        cell.setCell(time: time)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection
        section: Int) -> String? {
        return "Start/End Time"
    }
    

}
