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
    
    private(set) var themes = [Theme]()
    private(set) var currentTheme: Theme?
    var themeImage = UIImage()

    
    func fetchAllThemes(completion: (success: Bool) -> Void){
        
        FirebaseController.sharedController.getThemes { (data) in
            
            guard let jsonArray = data as? [[String: AnyObject]] else { completion(success: false); return }
            
            self.themes = []
            for json in jsonArray {
                do {
                    let theme = try Theme(json: json)
                    self.themes.append(theme)
                } catch {
                    print("Error parsing theme: \(json)")
                }
            }
            
            completion(success: true)
            
        }
        
    }
    
//    func getNextImage(completion: (image: ImageModelObject?) -> Void) {
    
        // hit firebase, given the current theme, and get back data
        // Parse the data into an ImageModelObject with image and captions
        // Return that object
//    }
    
    func themeAtIndexPath(indexPath: NSIndexPath) -> Theme {
        return themes[indexPath.item]
    }
    
    func selectTheme(theme: Theme) {
        currentTheme = theme
    }
    
    static func fetchThemeData (themeTitle: String?){
        
//        FirebaseController.
        
    }
    
    
    
    
}
