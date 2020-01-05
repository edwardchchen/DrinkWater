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
    
    @IBOutlet weak var addButton: UIButton!
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
    let percentageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    var percentage : Float = 0.0

 


    
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
        createProgressCircle()
        createPercentageLabel()

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
        
        addButton.layer.cornerRadius = 25.0

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
    
    let shapeLayer = CAShapeLayer()
    
    func createPercentageLabel () {
        let bounds: CGRect = UIScreen.main.bounds
        let width:CGFloat = bounds.size.width
        let height:CGFloat = bounds.size.height

        percentageLabel.center = CGPoint(x: width/2, y: height/2.5)
        percentageLabel.textAlignment = .center
        percentage = percentage * 100
        percentage.round()
        percentageLabel.text = String(format: "%i %%", Int(percentage))
        percentageLabel.textColor = UIColor.white
        self.view.addSubview(percentageLabel)

    }

    func createProgressCircle() {
        let bounds: CGRect = UIScreen.main.bounds
        let width:CGFloat = bounds.size.width
        let height:CGFloat = bounds.size.height

        let centerPt = CGPoint(x: width/2, y: height/2.5)
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 130, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)

        shapeLayer.position = centerPt
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
        
        let percentage = Float(todayTotal)/Float(todayGoalVolume)
        print(percentage)
        
        shapeLayer.strokeEnd = 0.8
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapToLoad)))
        view.layer.addSublayer(shapeLayer)

    }
    
    @objc private func tapToLoad() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 1
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
    
    func checkPercentageLabel() {
        if(todayTotal >= todayGoalVolume) {
            percentageLabel.text = "100%"
        } else {
            var percentage = Float(todayTotal)/Float(todayGoalVolume)
            percentage = percentage * 100
            percentage.round()
            percentageLabel.text = String(format: "%i %%", Int(percentage))

        }
    }


}

extension ViewController {
    override func viewWillAppear(_: Bool) {
        super.viewWillAppear(true)
        changeUnitLabels()
        setUp()
        resetDate()
        checkPercentageLabel()
        tapToLoad()
    }
}
