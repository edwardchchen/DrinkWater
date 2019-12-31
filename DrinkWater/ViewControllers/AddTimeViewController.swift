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

    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeCells = createTimeCells()
        setUp()
    }
    
    func createTimeCells () ->[Time] {
        var tempCells : [Time] = []
        let cellOne = Time(hour: 10, minute: 00, uniqueID: "startTimeCell")
        let cellTwo = Time(hour: 22, minute: 00, uniqueID: "endTimeCell")
        
        tempCells.append(cellOne)
        tempCells.append(cellTwo)
        
        return tempCells
    }

    
    
    func setUp() {
        let sliderValue = Int(slider.value)
        frequencyLabel.text = String(format: "Frequency: %i minutes per message", sliderValue )
    }
    
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        changeFrequencyLabel()
    }
    
    func changeFrequencyLabel() {
        let sliderValue = Int(slider.value)
        frequencyLabel.text = String(format: "Frequency: %i minutes", sliderValue)
        
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
