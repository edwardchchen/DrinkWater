//
//  FrequencyViewController.swift
//  DrinkWater
//
//  Created by Edward Chen on 2020-01-04.
//  Copyright © 2020 Edward Chen. All rights reserved.
//

import Foundation
import UIKit

class FrquencyViewController : UIViewController {
    struct Keys {
        static let frequency = "frequency"
    }
    
    let defaults = UserDefaults.standard
    let pickerData = ["0.5","1","1.5","2","2.5","3.0","3.5","4.0"]
    let units = ["hours"]
    var selectedFrquency = "0.5"
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        defaults.set(selectedFrquency, forKey: Keys.frequency)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        createPicker()
    }
    
    func setUp() {
        let frequency = defaults.string(forKey: Keys.frequency)
        textField.text = String(frequency ?? "<no_time>")  + " hours per notification"
    }
    
    
    func createPicker () {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        textField.inputView = picker
    }
    
}
extension FrquencyViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedFrquency = pickerData[row]
        textField.text = String(selectedFrquency) + " hours per notification"
    }
    func createTap() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
}

