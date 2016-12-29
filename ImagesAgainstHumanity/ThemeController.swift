//
//  ThemeController.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 3/23/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ThemeController {
    
    static let sharedInstance = ThemeController()
    
    fileprivate(set) var themes = [Theme]()
    fileprivate(set) var currentTheme: Theme?
    var themeImage = UIImage()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var storedThemes: [Theme] {
        
        //create fetch request for Theme objects
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Theme")
        
        
        
        do {
            // calls the Theme objects.
            
            return try appDelegate.managedObjectContext.fetch(request) as! [Theme]

        } catch {
            //if there is an error or there are no saved objects return empty array
            return []
        }
    }

    
    func fetchAllThemes(completion:@escaping (_ success: Bool) -> Void){
        
        self.themes = self.storedThemes
    
        FirebaseController.sharedController.getThemes { (data) in
            
            guard let jsonArray = data as? [[String: AnyObject]] else { completion(false); return }
            
            var tempThemes = [Theme]()
            //self.themes = []
            for json in jsonArray {
                do {
                    let theme = try self.json(json: json)
                    tempThemes.append(theme)
                    //self.themes.append(theme)
                } catch {
                    print("Error parsing theme: \(json)")
                }
            }
            
            if(self.storedThemes.count < tempThemes.count){
               
                self.themes = tempThemes
                self.saveToPersistentStorage()
                
            }
            
            completion(true)
            
        }
        
    }
    
    func saveToPersistentStorage() {
        
        do {
            try appDelegate.managedObjectContext.save()
        } catch {
            print("Error saving Managed Object Context. Items not saved.")
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
