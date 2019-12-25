//
//  ViewController.swift
//  Practice
//
//  Created by Edward Chen on 2019-12-20.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalAmountWaterLabel: UILabel!
    @IBOutlet weak var volumeOfWaterAddingLabel: UILabel!
    @IBOutlet var backgroundUIView: UIView!
    @IBOutlet weak var todayGoal: UILabel!
    
    var totalVolume = 0
    var currentAdding = 0
    var todayGoalVolume = 2000
    var notification = NotificationSender()
 

    
    @IBAction func addWaterBtn(_ sender: UIButton) {
        currentAdding = currentAdding + 25
        volumeOfWaterAddingLabel.text = NSString(format: "%i mL", currentAdding) as String
        totalAmountWaterLabel.text = NSString(format: "Total: %i mL", totalVolume) as String
    }
    
    @IBAction func removeWaterBtn(_ sender: UIButton) {
        currentAdding = currentAdding - 25
        volumeOfWaterAddingLabel.text = NSString(format: "%i mL", currentAdding) as String
        totalAmountWaterLabel.text = NSString(format: "Total: %i mL", totalVolume) as String

    }
    @IBAction func addIntoBottleBtn(_ sender: UIButton) {
        totalVolume = totalVolume + currentAdding
        totalAmountWaterLabel.text = NSString(format: "Total: %i mL", totalVolume) as String
        currentAdding = 0
        volumeOfWaterAddingLabel.text = NSString(format: "%i mL", 0) as String

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        volumeOfWaterAddingLabel.text = NSString(format: "%i mL", totalVolume) as String
        totalAmountWaterLabel.text = NSString(format: "Total: %i mL", 0) as String
        todayGoal.text = NSString(format: "Today's Goal is: %i mL", todayGoalVolume) as String
    }
    


}

