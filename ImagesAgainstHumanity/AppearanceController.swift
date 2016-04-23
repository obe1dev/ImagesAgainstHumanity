//
//  AppearanceController.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 4/22/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import Foundation
import UIKit

class AppearanceController {
    

    static func initApper(){
        
        let nav = UINavigationBar.appearance()
        
        let darkGreen = UIColor(red: 97/255, green: 231/255, blue: 134/255, alpha: 1.0)
        let lightGreen = UIColor(red: 237/255, green: 255/255, blue: 236/255, alpha: 1.0)
        
        nav.barTintColor = UIColor(red: 72.0/255.0, green: 67.0/255.0, blue: 92.0/255.0, alpha: 1.0)
        nav.tintColor = darkGreen
        nav.titleTextAttributes = [NSForegroundColorAttributeName: darkGreen]
        
        let collection = UICollectionView.appearance()
        
        collection.backgroundColor = lightGreen

    }
    
}