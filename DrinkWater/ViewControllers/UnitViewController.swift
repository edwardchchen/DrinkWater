//
//  UnitViewController.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-28.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import Foundation
import UIKit

class UnitViewController : UIViewController {
    
    struct Keys {
        static let unitpref = "unitPreference"
    }
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var setButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    let units = ["Metric", "Imperial"]
    
    var selectedUnits = "Metric"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPicker()
        createTap()
        loadUnitPreference()
        setUpStyle()
    }
    
    @IBAction func saveUnits(_ sender: UIButton) {
        save()
    }
    
    func isMetric() -> Bool {
        return selectedUnits == "Metric"
    }
    
    func save() {
        defaults.set(isMetric(),forKey: "unitPreference")
    }
    
    func loadUnitPreference() {
        let pref = defaults.bool(forKey: Keys.unitpref)
        if (pref) {
            selectedUnits = "Metric"
            textField.text = selectedUnits
        } else {
            selectedUnits = "Imperial"
            textField.text = selectedUnits
        }
    }

    func createPicker() {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        textField.inputView = picker
    }
    func setUpButton () {
        setButton.layer.cornerRadius = 25.0
        setButton.layer.borderColor = UIColor.white.cgColor
        setButton.layer.borderWidth = 2
        setButton.tintColor = UIColor.white
    }
    
    func setUpStyle() {
        setUpButton()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "059 Teen Notebook"))
        messageLabel.textColor = .white
        textField.font = UIFont.boldSystemFont(ofSize: 20)
        messageLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }

    
    func createTap() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

}

extension UnitViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return units.count
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return units[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedUnits = units[row]
        textField.text = selectedUnits
    }
}
