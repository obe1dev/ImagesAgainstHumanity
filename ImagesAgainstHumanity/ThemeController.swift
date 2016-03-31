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
    
    static func fetchAllThemes(completion: (success: Bool?) -> Void){
        
        FirebaseController.getThemesTitle { (data) in
            if let themeTitle = data as? [String] {
                
                for theme in themeTitle {
                    
                    let theme = Theme.init(themeTitle: theme)
                    
                    ThemeController.sharedInstance.themeNames.append(theme!)
                    
                    
                }
                completion(success: true)
            }
        }
        
    }
    
    static func fetchThemeData (themeTitle: String?){
        
//        FirebaseController.
        
    }
    
    
    
}
