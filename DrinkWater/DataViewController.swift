//
//  DataViewController.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-19.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var backgroundImageView: UIView!

    @IBOutlet weak var bottleIcon: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var amountOfWaterAddedLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!

    @IBOutlet weak var minusButton: UIButton!

    
    var dataObject: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }


}

