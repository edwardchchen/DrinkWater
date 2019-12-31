//
//  NotificationTimeViewController.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-30.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import Foundation
import UIKit

class NotificationTimeViewController :UIViewController {
    struct Keys {
        static let startTime = "startTime"
    }
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var startTimeTextField: UITextField!
    

    @IBAction func setButtonPressed(_ sender: UIButton) {
        let startTime = startTimeTextField.text
        defaults.set(startTime, forKey: Keys.startTime)
    }
    
    var picker = UIDatePicker()
    
    @objc func datePickerChanged(picker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let myString = dateFormatter.string(from: picker.date)
        startTimeTextField.text = myString
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        

    }
    
    func setUp() {
        createPicker()
        createTap()
        loadTextField()

    }
    func loadTextField () {
        startTimeTextField.text = defaults.string(forKey: Keys.startTime)
    }
    
    func createPicker () {
        picker.datePickerMode = .time
        startTimeTextField.inputView = picker
        picker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
    }
    
}

extension NotificationTimeViewController : UIPickerViewDelegate  {
    func createTap() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    


}
