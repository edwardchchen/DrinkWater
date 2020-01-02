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

    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func createTimeCells () ->[Time] {
        var tempCells : [Time] = []
        let startTime = defaults.string(forKey: Keys.startTime)
        let endTime = defaults.string(forKey: Keys.endTime)
        let cellOne = Time(time: startTime ?? "<no_time>", uniqueID: "startTimeCell")
        let cellTwo = Time(time: endTime ?? "<no_time>", uniqueID: "endTimeCell")
        
        tempCells.append(cellOne)
        tempCells.append(cellTwo)
        
        return tempCells
    }

    
    
    func setUp() {
        slider.setValue(Float(defaults.integer(forKey: Keys.frequency)), animated: false)
        let sliderValue = Int(slider.value)
        frequencyLabel.text = String(format: "Frequency: %i minutes per message", sliderValue )
        timeCells = createTimeCells()
    }
    
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        changeFrequencyLabel()
        defaults.set(Int(slider.value), forKey: Keys.frequency)
    }
    
    func changeFrequencyLabel() {
        let sliderValue = Int(slider.value)
        frequencyLabel.text = String(format: "Frequency: %i minutes per message", sliderValue)
        
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
