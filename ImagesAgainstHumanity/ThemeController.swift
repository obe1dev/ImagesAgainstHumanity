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
    
    fileprivate(set) var themes = [Theme]()
    fileprivate(set) var currentTheme: Theme?
    var themeImage = UIImage()

    
    func fetchAllThemes(completion:@escaping (_ success: Bool) -> Void){
    
        FirebaseController.sharedController.getThemes { (data) in
            
            guard let jsonArray = data as? [[String: AnyObject]] else { completion(false); return }
            
            self.themes = []
            for json in jsonArray {
                do {
                    let theme = try self.json(json: json)
                    self.themes.append(theme)
                } catch {
                    print("Error parsing theme: \(json)")
                }
            }
            
            completion(true)
            
        }
        
    }
    
    fileprivate let nameKey = "name"
    fileprivate let imageKey = "image"
    
   private func json(json: [String: AnyObject]) throws -> Theme {
        
        guard let name = json[self.nameKey] as? String else { throw FirebaseController.ParseError.valueNotFound(key:self.nameKey) }
        //self.name = name
        guard let imageString = json[self.imageKey] as? String else { throw FirebaseController.ParseError.valueNotFound(key: self.imageKey) }
        
        let decodedData = Data(base64Encoded: imageString, options: NSData.Base64DecodingOptions(rawValue: 0))
        
        let coverImage = UIImage(data: decodedData!)!
        
       return Theme(name: name, coverImage: coverImage)
        
        
        
    }
    
//    func getNextImage(completion: (image: ImageModelObject?) -> Void) {
    
        // hit firebase, given the current theme, and get back data
        // Parse the data into an ImageModelObject with image and captions
        // Return that object
//    }
    
    func themeAtIndexPath(_ indexPath: IndexPath) -> Theme {
        return themes[indexPath.item]
    }
    
    func selectTheme(_ theme: Theme) {
        currentTheme = theme
    }
    
    static func fetchThemeData (_ themeTitle: String?){
        
//        FirebaseController.
        
    }
    
    
    
    
}
