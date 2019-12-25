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
        var date = DateComponents()
        date.hour = 12
        date.minute = 3
        let cellOne = Time(date: date)
        let cellTwo = Time(date: date)
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell") as! TimeCell
        cell.setCell(time: time)
        return cell
    }
    
}
