//
//  PickedCatagoryController.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 4/6/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PickedCatagoryController {
    
    static let sharedInstance = PickedCatagoryController()
    
    fileprivate(set) var currentTheme: PickedCatagory?
    var randomNum: Int = 0
    var pickedImage = UIImage()
    var ThemeData: [PickedCatagory] {
        
        //create fetch request for PickedCatagory objects
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PickedCatagory")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        do {
            // calls the PickedCatagory objects.
            return try appDelegate.managedObjectContext.fetch(request) as! [PickedCatagory]
            } catch {
            //if there is an error or there are no saved objects return empty array
            return []
        }
    }
    
    func fetchThemeData( completion: @escaping (_ success: Bool) -> Void){
        
        FirebaseController.sharedController.getThemeData { json in

            guard let json = json else {
                completion(false)
                return
            }
            
            self.currentTheme = nil
            
            do {
                let theme = try self.json(json: json)
                self.currentTheme = theme
                completion(true)
            } catch {
                print("Error parsing Theme: \(json)")
                completion(false)
            }
            
            
        }
    }
    
    fileprivate let phraseKey = "phrases"
    fileprivate let imageKey = "images"
    
        private func json(json: [String: AnyObject]) throws -> PickedCatagory {
    
    
            guard let phrases = json[phraseKey] as? [String] else { throw FirebaseController.ParseError.valueNotFound(key: phraseKey)}
            
    
            guard let imageString = json[imageKey] as? [String] else { throw FirebaseController.ParseError.valueNotFound(key: imageKey)}
    
    //        let decodedData = NSData(base64EncodedString: imageString, options: NSDataBase64DecodingOptions(rawValue: 0))
    
            
            return PickedCatagory(phrases: phrases, themeImages: imageString)
        }


    
    func getRandomNum(_ array: NSArray) {
        
        let numberOfThemes = array.count
        
        randomNum = Int(arc4random_uniform(UInt32(numberOfThemes)) + 1)
        
    }
    
    func decodeImage(_ image: NSString) {
        
        let decodeData = Data(base64Encoded: image as String, options: NSData.Base64DecodingOptions(rawValue: 0))
        
        pickedImage = UIImage(data: decodeData!)!
        
    }
    
}



