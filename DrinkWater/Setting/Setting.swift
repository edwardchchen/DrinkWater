//
//  Setting.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-21.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import Foundation
import UIKit

class Setting {
    var image : UIImage
    var title : String
    var uniqueID : String
    init (image: UIImage, title: String, uniqueID: String) {
        self.image = image
        self.title = title
        self.uniqueID = uniqueID
    }
}
