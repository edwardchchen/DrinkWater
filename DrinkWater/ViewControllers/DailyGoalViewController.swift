//
//  DailyGoalViewController.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-28.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import Foundation
import UIKit

class DailyGoalViewController : UIViewController {
    
    var dailyGoal = 2000
    let volumeInMetric = [1600,1800,2000,2200,2400,2600,
    2800,3000,3200,3400, 3600, 3800, 4000]
    
    let volumeInImperial = [40,54,60,68,74,82,88,94,100,108]
    
    let defaults = UserDefaults.standard

    struct Keys {
        static let goal = "dailyGoal"
        static let unitpref = "unitPreference"
    }
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func setBtn(_ sender: UIButton) {
        saveDailyGoal()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeUnitLabel()
        loadDailyGoal()
        textField.text = String(dailyGoal)
        createTap()
        createPicker()
        setUpStyle()
    }
    
    func correctList () -> [Int] {
        let isMetric = defaults.bool(forKey: Keys.unitpref)
        if (isMetric) {
            return volumeInMetric
        } else {
            return volumeInImperial
        }
    }

    func changeUnitLabel() {
        let isMetric = defaults.bool(forKey: Keys.unitpref)
        print(isMetric)
        if (isMetric) {
            unitLabel.text = "mL"
        } else {
            unitLabel.text = "oz"
        }
        
    }
    func saveDailyGoal() {
        let isMetric = defaults.bool(forKey: Keys.unitpref)
        if(isMetric) {
            dailyGoal = Int(textField.text!)!
            defaults.set(dailyGoal, forKey: Keys.goal)
            print("save %i", dailyGoal)
        } else {
            dailyGoal = Int(textField.text!)!
            let goal = Float(dailyGoal) * 29.5735296875
            defaults.set(Int(goal), forKey: Keys.goal)
            print("save %i", dailyGoal)
        }
    }
    
    func loadDailyGoal() {
        dailyGoal = defaults.integer(forKey: Keys.goal)
        print(dailyGoal)
        textField.text = String(dailyGoal)
    }
    
    func createPicker() {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        textField.inputView = picker
    }
    
    func setUpButton () {
        setButton.layer.cornerRadius = 25.0
        setButton.layer.borderColor = UIColor.darkGray.cgColor
        setButton.layer.borderWidth = 2
        setButton.tintColor = UIColor.darkGray
    }
    
    func setUpStyle() {
        setUpButton()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "026 Saint Petersburg"))
        messageLabel.textColor = .darkGray
        textField.font = UIFont.boldSystemFont(ofSize: 20)
        messageLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }


    
    func createTap() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    

    
}
extension DailyGoalViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return correctList().count
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(correctList()[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dailyGoal = correctList()[row]
        textField.text = String(dailyGoal)
    }
}
