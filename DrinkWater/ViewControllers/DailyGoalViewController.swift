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
    
    let defaults = UserDefaults.standard

    struct Keys {
        static let goal = "dailyGoal"
        static let unitpref = "unitPreference"
    }
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var unitLabel: UILabel!
    
    @IBAction func setBtn(_ sender: UIButton) {
        saveDailyGoal()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDailyGoal()
        textField.text = String(dailyGoal)
        createTap()
        createPicker()
    }

    
    func saveDailyGoal() {
        dailyGoal = Int(textField.text!)!
        defaults.set(dailyGoal, forKey: Keys.goal)
        print("save %i", dailyGoal)
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

    
    func createTap() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    
}
extension DailyGoalViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return volumeInMetric.count
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(volumeInMetric[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dailyGoal = volumeInMetric[row]
        textField.text = String(dailyGoal)
    }
}
