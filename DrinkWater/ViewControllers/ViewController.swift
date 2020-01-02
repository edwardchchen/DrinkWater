//
//  ViewController.swift
//  Practice
//
//  Created by Edward Chen on 2019-12-20.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

//TODO: metric/imperial conversion
//Notfication completion
//Widget
//TODO LATER:
//SQL + graphs ???

import UIKit

class ViewController: UIViewController {
    
    struct Keys {
        static let todayTotal = "todayTotal"
        static let dailyGoal = "dailyGoal"
        static let lastAccessedDate = "lastAccessedDate"
        static let isMetric = "unitPreference"
    }
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var totalAmountWaterLabel: UILabel!
    @IBOutlet weak var volumeOfWaterAddingLabel: UILabel!
    @IBOutlet var backgroundUIView: UIView!
    @IBOutlet weak var todayGoal: UILabel!
    
    var todayTotal = 0
    var currentAdding = 0
    var todayGoalVolume = 2000
    var notification = NotificationSender()
    var addPerClick = 25
    var unitLabel = "mL"
 

    
    @IBAction func addWaterBtn(_ sender: UIButton) {
        currentAdding = currentAdding + addPerClick

        volumeOfWaterAddingLabel.text = String(format: "%i " + unitLabel, currentAdding)
        totalAmountWaterLabel.text = String(format: "Total: %i " + unitLabel, todayTotal)
    }
    
    @IBAction func removeWaterBtn(_ sender: UIButton) {
        currentAdding = currentAdding - addPerClick
        volumeOfWaterAddingLabel.text = String(format: "%i " + unitLabel, currentAdding)
        totalAmountWaterLabel.text = String(format: "Total: %i " + unitLabel, todayTotal)

    }
    
    @IBAction func addIntoBottleBtn(_ sender: UIButton) {
        todayTotal = todayTotal + currentAdding
        totalAmountWaterLabel.text = String(format: "Total: %i " + unitLabel, todayTotal)
        currentAdding = 0
        volumeOfWaterAddingLabel.text = String(format: "%i " + unitLabel, 0)
        if(!isMetric()) {
            defaults.set(convertFromImperialToMetric(imperial: todayTotal), forKey: Keys.todayTotal)
        } else {
            defaults.set(todayTotal, forKey: Keys.todayTotal)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeUnitLabels()
        setUp()
        resetDate()

    }
    
    func setUp() {
        //load from userdefaults
        if (!isMetric()) {
        todayGoalVolume = convertFromMetricToImperial(integer: defaults.integer(forKey: Keys.dailyGoal))
        todayTotal = convertFromMetricToImperial(integer: defaults.integer(forKey: Keys.todayTotal))
        } else {
            todayGoalVolume = defaults.integer(forKey: Keys.dailyGoal)
            todayTotal = defaults.integer(forKey: Keys.todayTotal)
        }
        
        
        volumeOfWaterAddingLabel.text = String(format: "%i " + unitLabel, 0)
        totalAmountWaterLabel.text = String(format: "Total: %i " + unitLabel, todayTotal)
        todayGoal.text = String(format: "Today's Goal is: %i " + unitLabel, todayGoalVolume)

    }
    
    func isGoalReached()-> Bool {
        return todayGoalVolume == todayTotal
    }
    
    func changeUnitLabels () {
        let isMetric = defaults.bool(forKey: "unitPreference")
        if (isMetric) {
            unitLabel = "mL"
            addPerClick = 25
        } else {
            unitLabel = "oz"
            addPerClick = 1
        }
    }
    
    func setCurrentDate() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        defaults.set(result, forKey: Keys.lastAccessedDate)
    }
    
    
    //EFFECT: returns true if today's date == last accessed date
    func checkDate() -> Bool {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        let lastAccessedDate = defaults.string(forKey: Keys.lastAccessedDate)
        if (result != lastAccessedDate) {
            return false
        } else {
            return true
        }
    }
    
    //EFFECT: set
    func resetDate () {
        if(!checkDate()) {
            todayTotal = 0
            setCurrentDate()
            defaults.set(0, forKey: Keys.todayTotal)
        }
    }
    
    
    
    
    func isMetric() -> Bool {
        return defaults.bool(forKey: Keys.isMetric)
    }
    
    
    func convertFromMetricToImperial(integer : Int) -> Int{
        let res = Float(integer)/29.5735296875
        return Int(res)
    }
    
    func convertFromImperialToMetric (imperial: Int) -> Int {
        let res = Float(imperial) * 29.5735296875
        return Int(res)
    }



}

extension ViewController {
    override func viewWillAppear(_: Bool) {
        super.viewWillAppear(true)
        changeUnitLabels()
        setUp()
        resetDate()
        
    }
}
