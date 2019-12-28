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
    
    var timeCells : [Time] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeCells = createTimeCells()
    }
    
    
    func createTimeCells () ->[Time] {
        var tempCells : [Time] = []
        let cellOne = Time(hour: 12, minute: 13, uniqueID: "startTimeCell")
        let cellTwo = Time(hour: 23, minute: 23, uniqueID: "endTimeCell")
        
        tempCells.append(cellOne)
        tempCells.append(cellTwo)
        
        return tempCells
    }
}

extension AddTimeViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeCells.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let time = timeCells[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: time.uniqueID) as! TimeCell
        cell.setCell(time: time)
        return cell
    }
    
}
