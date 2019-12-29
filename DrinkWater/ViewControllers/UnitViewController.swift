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
    
    @IBOutlet weak var textField: UITextField!
    let units = ["Metric", "Imperial"]
    
    var selectedUnits : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPicker()
        createTap()
    }
    
    
    func createPicker() {
        let picker = UIPickerView()
        picker.delegate = self as? UIPickerViewDelegate
        textField.inputView = picker
    
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
