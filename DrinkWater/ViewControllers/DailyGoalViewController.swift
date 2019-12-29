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
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var unitLabel: UILabel!
    
    @IBAction func setBtn(_ sender: UIButton) {
        saveDailyGoal()
    }
    
    var dailyGoal = 2000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = String(dailyGoal)
        createTap()
    }

    
    func createTap() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func saveDailyGoal() {
        if (textField.text != nil) {
            dailyGoal = Int(textField.text ?? "2000")!
        }
    }
    

    
}
