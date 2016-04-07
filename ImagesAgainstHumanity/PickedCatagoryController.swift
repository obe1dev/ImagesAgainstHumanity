//
//  PickedCatagoryController.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 4/6/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import Foundation
import UIKit

class PickedCatagoryController {
    
    var randomNum: Int = 0
    
    func getRandomNum(){
        
        let numberOfThemes = ThemeController.sharedInstance.themes.count
        
        randomNum = Int(arc4random_uniform(UInt32(numberOfThemes)) + 1)
        
    }
    
}


