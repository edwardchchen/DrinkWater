//
//  NotificationTimeViewController.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-30.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import Foundation
import UIKit

class NotificationStartTimeVC :UIViewController {
    struct Keys {
        static let startTime = "startTime"
    }
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var setButton: UIButton!
    
    @IBAction func setButtonPressed(_ sender: UIButton) {
        let startTime = textField.text
        defaults.set(startTime, forKey: Keys.startTime)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let startHR = dateFormatter.string(from: picker.date)
        let startHRInt = Int(startHR)
        defaults.set(startHRInt,forKey: "startHR")
    }
    
    var picker = UIDatePicker()
    
    @objc func datePickerChanged(picker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let myString = dateFormatter.string(from: picker.date)
        textField.text = myString
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        

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
    
    func setUp() {
        createPicker()
        createTap()
        loadTextField()
        setUpStyle()
        setUpButton()

    }
    func loadTextField () {
        textField.text = defaults.string(forKey: Keys.startTime)
    }
    
    func createPicker () {
        picker.datePickerMode = .time
        textField.inputView = picker
        picker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
    }
    
}

extension NotificationStartTimeVC : UIPickerViewDelegate  {
    func createTap() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    


}
