//
//  ViewController.swift
//  Practice
//
//  Created by Edward Chen on 2019-12-20.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalAmountWaterLabel: UILabel!

    @IBOutlet weak var volumeOfWaterAddingLabel: UILabel!
    @IBOutlet var backgroundUIView: UIView!
    
    @IBAction func addWaterBtn(_ sender: UIButton) {
        var currentVolumeAdding = Int(volumeOfWaterAddingLabel.text ?? "0")
        currentVolumeAdding = currentVolumeAdding! + 25
        volumeOfWaterAddingLabel.text = String(currentVolumeAdding ?? 0)
    }
    
    @IBAction func removeWaterBtn(_ sender: UIButton) {
        var currentVolumeAdding = Int(volumeOfWaterAddingLabel.text ?? "0")
        currentVolumeAdding = currentVolumeAdding! - 25
        volumeOfWaterAddingLabel.text = String(currentVolumeAdding ?? 0)
    }
    @IBAction func addIntoBottleBtn(_ sender: UIButton) {
        let currentVolumeAdding = Int(volumeOfWaterAddingLabel.text ?? "0")!
        let currentTotal = Int(totalAmountWaterLabel.text ?? "0")
        let sum = currentTotal! + currentVolumeAdding
        totalAmountWaterLabel.text = String(sum)
        volumeOfWaterAddingLabel.text = "0"

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        volumeOfWaterAddingLabel.text = "0"
        totalAmountWaterLabel.text = "0"
        // Do any additional setup after loading the view.
    }
    


}
