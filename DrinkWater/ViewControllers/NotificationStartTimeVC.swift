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
    @IBOutlet weak var startTimeTextField: UITextField!
    
    @IBOutlet weak var setButton: UIButton!
    
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
    
    func setUpButton () {
//        let colour = UIColor(red: 45/255, green: 158/255, blue: 234/255, alpha: 1.0)
        setButton.layer.cornerRadius = 25.0
        setButton.layer.borderColor = UIColor.white.cgColor
        setButton.layer.borderWidth = 2
        setButton.tintColor = UIColor.white
    }
    
    func setUpStyle() {
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "045 Loon Crest"))
        messageLabel.textColor = .white
        startTimeTextField.font = UIFont.boldSystemFont(ofSize: 20)
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
        startTimeTextField.text = defaults.string(forKey: Keys.startTime)
    }
    
    func createPicker () {
        picker.datePickerMode = .time
        startTimeTextField.inputView = picker
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
