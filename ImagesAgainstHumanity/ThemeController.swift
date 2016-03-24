//
//  ThemeController.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 3/23/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import Foundation
import UIKit

class ThemeController {
    
    static let sharedInstance = ThemeController()
    
    var themes = [Theme]()
    var themeNames = [Theme]()
    
    static func fetchAllThemes(){
        
        FirebaseController.getThemesTitle()
        
    }
    
    static func fetchThemeData (themeTitle: String?){
        
//        FirebaseController.
        
    }
    
    
    
}
